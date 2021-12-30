import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/publish/item/publish_app_bar.dart';
import 'package:meng_guo/function/publish/item/publish_image_item.dart';
import 'package:meng_guo/function/publish/item/publish_input_item.dart';
import 'package:meng_guo/function/publish/item/publish_tool_item.dart';
import 'package:meng_guo/function/publish/model/publish_model.dart';
import 'package:meng_guo/function/publish/page/publish_toptip_search_page.dart';
import 'package:meng_guo/function/publish/utils/my_special_text_span_builder.dart';
import 'package:meng_guo/function/publish/viewmodel/publish_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:meng_guo/function/detail/model/detail_model.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/keyboard_utils.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class PublishPage extends StatelessWidget {
  static const String sName = "PublishPage";

  const PublishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StatusBarUtils.setUpTransparentStatusBar();
    return ViewModelProvider<PublishViewModel>(
      create: (context) => PublishViewModel(PublishModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: BaseScaffold<PublishViewModel>(
            resizeToAvoidBottomInset: false,
            viewModel: viewModel,
            body: _PublishView(viewModel: viewModel),
          ),
        );
      },
    );
  }
}

class _PublishView extends StatefulWidget {
  final PublishViewModel viewModel;
  const _PublishView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _PublishViewState createState() => _PublishViewState();
}

class _PublishViewState extends State<_PublishView> {
  PublishViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          PublishAppBar(
            publishOnTap: () {
              viewModel.publishThread();
            },
          ),
          _buildTopTipItem(context),
          Expanded(
            child: PublishInputItem(
              viewModel: viewModel,
            ),
          ),
          // ignore: prefer_const_constructors
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: PublishToolItem(),
          // ),
        ],
      ),
    );
  }

  Widget _buildTopTipItem(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 9.5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.px, 8.px, 20.5.px, 8.px),
            decoration: BoxDecoration(
              color: const Color(0xFFF5FAFF),
              borderRadius: BorderRadius.all(Radius.circular(16.px)),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/home/home_tip.png')
                    .marginRight(11.5.px),
                Text(
                  '选择话题',
                  style: TextStyle(
                      fontSize: 13.px,
                      color: color_FF676767,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/home/home_arrow_right.png'),
        ],
      ),
    ).wrapGestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushNamed(context, PublishTopTipPage.sName).then((value) {
            if (value != null && value is String) {
              // viewModel.insertText(
              //     value, viewModel.contentTextEditingController);
              viewModel.contentTextEditingController.text += ' #$value# ';
            }
          });
        });
  }
}

/// 中部输入widget
class PublishInputItem extends StatefulWidget {
  final PublishViewModel viewModel;
  const PublishInputItem({Key? key, required this.viewModel}) : super(key: key);

  @override
  _PublishInputItemState createState() => _PublishInputItemState();
}

class _PublishInputItemState extends State<PublishInputItem> {
  final GlobalKey _contentKey = GlobalKey();

  final FocusNode _contentFocusNode = FocusNode();

  final GlobalKey _titleKey = GlobalKey();

  final FocusNode _titleFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _titleFocusNode.addListener(() {
      if (!_titleFocusNode.hasFocus) {
        widget.viewModel.showEmojiGird.value = false;
      }
    });

    _contentFocusNode.addListener(() {
      if (!_contentFocusNode.hasFocus) {
        widget.viewModel.showEmojiGird.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;

    return Stack(
      children: [
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            height: ScreenUtils.screenH() -
                ScreenUtils.navigationBarHeight() -
                50.px,
            child: Column(
              children: [
                ExtendedTextField(
                  key: _titleKey,
                  specialTextSpanBuilder: MySpecialTextSpanBuilder(
                    showAtBackground: true,
                  ),
                  controller: widget.viewModel.titleTextEditingController,
                  maxLines: null,
                  focusNode: _titleFocusNode,
                  autofocus: true,
                  keyboardAppearance: Brightness.light,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 16.px, top: 16.px),
                    hintText: '请输入标题',
                    hintStyle: TextStyle(
                        color: color_FF8F92A1, fontSize: 14.px, height: 1),
                    border: InputBorder.none,
                  ),
                ).paddingLeft(16.px).paddingRight(16.px),
                Divider(
                  height: 1.px,
                  thickness: 1.px,
                ),
                Container(
                  height: widget.viewModel.keyboardHeight,
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: widget.viewModel.keyboardHeight -
                              ((ScreenUtils.screenW() - 32.px) / 3),
                          maxHeight: widget.viewModel.keyboardHeight -
                              ((ScreenUtils.screenW() - 32.px) / 3),
                        ),
                        child: ExtendedTextField(
                          key: _contentKey,
                          specialTextSpanBuilder: MySpecialTextSpanBuilder(
                            showAtBackground: true,
                          ),
                          controller:
                              widget.viewModel.contentTextEditingController,
                          maxLines: null,
                          focusNode: _contentFocusNode,
                          keyboardAppearance: Brightness.light,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 16.px, top: 16.px),
                            hintText: '请输入要发布的内容',
                            hintStyle: TextStyle(
                                color: color_FF8F92A1,
                                fontSize: 14.px,
                                height: 1),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListListenableBuilder<String>(
                            listListenable: widget.viewModel.displayImages,
                            builder: (context, value, child) {
                              return Visibility(
                                visible: value.isNotEmpty,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return PublishImageItem(
                                      imageUrl: value[index],
                                      onDelete: () {
                                        widget.viewModel.displayImages
                                            .removeAt(index);
                                        widget.viewModel.imageIds
                                            .removeAt(index);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 12.px);
                                  },
                                  itemCount: value.length,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ).wrapGestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_contentFocusNode);
                    SystemChannels.textInput.invokeMethod('TextInput.show');
                  },
                  behavior: HitTestBehavior.translucent,
                ),
                Divider(
                  height: 1.px,
                  thickness: 1.px,
                ),
              ],
            ),
          ),
        ),
        ValueListenableBuilder<bool>(
            valueListenable: widget.viewModel.showEmojiGird,
            builder: (context, value, child) {
              return Positioned(
                left: 0,
                right: 0,
                bottom: bottom,
                child: PublishToolItem(
                  onTapCallBack: (EmojiListRespEntity value) {
                    widget.viewModel.insertText(
                        value.code ?? '',
                        _titleFocusNode.hasFocus
                            ? widget.viewModel.titleTextEditingController
                            : widget.viewModel.contentTextEditingController);
                  },
                  emojiOnTap: () {
                    if (bottom > 0) {
                      widget.viewModel.showEmojiGird.value = true;
                    } else {
                      widget.viewModel.showEmojiGird.value =
                          !widget.viewModel.showEmojiGird.value;
                    }
                    if (widget.viewModel.showEmojiGird.value) {
                      KeyboardUtils.hide();
                    }
                    // update
                  },
                  showEmoji: value && bottom <= 0,
                ),
              );
            }),
      ],
    );
  }

  void update(Function change, PublishViewModel viewModel) {
    if (viewModel.showEmojiGird.value) {
      change();
    } else {
      SystemChannels.textInput
          .invokeMethod<void>('TextInput.hide')
          .whenComplete(() {
        Future<void>.delayed(const Duration(milliseconds: 200))
            .whenComplete(() {
          change();
        });
      });
    }
  }
}
