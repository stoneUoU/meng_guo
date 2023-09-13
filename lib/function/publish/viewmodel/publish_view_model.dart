import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meng_guo/common/dialog/category_select_bottom_dialog.dart';
import 'package:meng_guo/common/utils/image_compress_utils.dart';
import 'package:meng_guo/common/widget/common_permission_handler.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/home/entity/home_category_list_resp_entity.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/publish/entity/image_resp_entity.dart';
import 'package:meng_guo/function/publish/entity/publish_req_entity.dart';
import 'package:meng_guo/function/publish/model/publish_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/storage/emoji_storage.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/list_notifier.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/utils/common_utils.dart';
import 'package:menghabit/tool/utils/keyboard_utils.dart';
import 'package:menghabit/tool/utils/toast_utils.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PublishViewModel extends BaseViewModel<PublishModel> {
  late BuildContext _context;

  final TextEditingController contentTextEditingController =
      TextEditingController();
  final TextEditingController titleTextEditingController =
      TextEditingController();

  LoginRespEntity? user = UserStorage.getUser();

  List<HomeCategoryListRespEntity>? categories;

  HomeCategoryListRespEntity? selectedCategory;

  double keyboardHeight = 267.px;

  ValueNotifier<List<EmojiListRespEntity>?> emojis = ValueNotifier(null);

  String insertEmojiText = '';

  ValueNotifier<bool> showEmojiGird = ValueNotifier(false);

  /// 选择或拍照的图片文件
  File? _file;

  ListNotifier<String> displayImages = ListNotifier([]);

  List<int> imageIds = [];

  PublishReqEntity reqEntity = PublishReqEntity();

  PublishViewModel(PublishModel model) : super(model);

  void initialise(BuildContext context) {
    _context = context;
    hideStateToolBar = false;
    // this.threadId = threadId;
    // globalBgColor.value = color_FFF7F9FA;
    setAppBarShow(false);
    // getData(threadId);
    getData();
  }

  void getData() {
    mState = EmptyState.PROGRESS;
    launch(() async {
      final emojiList = EmojiStorage.getEmojis();
      categories = await model.getHomeCategoryTabList();
      emojis.value = emojiList;
      // final l = EmojiStorage.getEmojis();

      mState = EmptyState.NORMAL;
    }, (err) {
      mState = EmptyState.NET_ERROR;
    });
  }

  void publishThread() {
    reqEntity.title = titleTextEditingController.text;
    reqEntity.content.text = contentTextEditingController.text;
    if (imageIds.isNotEmpty) {
      reqEntity.content.indexes = {
        "101": {
          "tomId": 101,
          "body": {
            "imageIds": imageIds,
          },
        }
      };
    }
    KeyboardUtils.hide();
    if (reqEntity.title.orEmptyString().isNullOrEmpty() ||
        (reqEntity.content.text ?? '').isNullOrEmpty()) {
      ToastUtils.showShort('标题或内容不能为空');
      return;
    }
    showLoadingDialog();
    launch(() async {
      final data = await model.postPublish(reqEntity);

      dismissLoadingDialog();
      ToastUtils.showShort('发布成功');
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pop(_context);
      });
    }, (err) {
      dismissLoadingDialog();
    });
  }

  void showCategoryDialog(BuildContext context) async {
    KeyboardUtils.hideByContext(context);
    HomeCategoryListRespEntity? selectItem =
        await CategorySelectBottomSheetDialog(
      categories.orEmptyList(),
      initEntity: selectedCategory,
    ).showDialog(_context);
    selectedCategory = selectItem;
    reqEntity.categoryId = selectItem?.categoryId;
  }

  void openAlbum(BuildContext context) {
    PermissionHelper.check(
        context, BuildConfig.isIos ? Permission.photos : Permission.storage,
        onSuccess: () async {
      final List<AssetEntity>? assets = await AssetPicker.pickAssets(context);
      if (assets?.first != null) {
        _file = await assets!.first.file;
        if (_file != null) {
          /// 图片按需压缩
          File? compressedFile =
              await ImageCompressUtil().imageCompressAndGetFile(_file!);
          // uploadImage(compressedFile);
          if (compressedFile != null) {
            // onFile.call(Future.value(compressedFile));
            File photo = await compressedFile;
            uploadImage(photo);
          } else {
            ToastUtils.showShort(getLanguage<S>().common_info_not_empty);
          }
        }
      }
    }, onFailed: () async {
      await openAppSettings();
    }, onOpenSetting: () async {
      await openAppSettings();
    });
  }

  void uploadImage(File? file) {
    String filePath = '';
    if (file != null) {
      filePath = file.path;
      launch(() async {
        CommonUtils.showUploadLoadingDialog(_context);
        ImageRespEntity imgData = await model.uploadImage(filePath);
        CommonUtils.disMissLoadingDialog(_context);

        Future.delayed(Duration(milliseconds: 300), () {
          displayImages.add(imgData.url ?? '');
          imageIds.add(imgData.id ?? 0);
        });
      }, (err) {
        CommonUtils.disMissLoadingDialog(_context);
      });
    } else {
      ToastUtils.showShort(getLanguage<S>().common_info_not_empty);
    }
  }

  void insertText(String text, TextEditingController editingController) {
    final TextEditingValue value = editingController.value;
    final int start = value.selection.baseOffset;
    int end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = '';
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
        end = start;
      }

      editingController.value = value.copyWith(
          text: newText,
          selection: value.selection.copyWith(
              baseOffset: end + text.length, extentOffset: end + text.length));
    } else {
      editingController.value = TextEditingValue(
          text: text,
          selection:
              TextSelection.fromPosition(TextPosition(offset: text.length)));
    }
  }

  @override
  void onReloadData() {
    super.onReloadData();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
