import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/appbar/common_search_app_bar.dart';
import 'package:meng_guo/function/publish/entity/publish_toptip_search_resp_entity.dart';
import 'package:meng_guo/function/publish/item/publish_search_item.dart';
import 'package:meng_guo/function/publish/model/publish_model.dart';
import 'package:meng_guo/function/publish/viewmodel/publish_toptip_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class PublishTopTipPage extends StatelessWidget {
  static const String sName = "PublishTopTipPage";

  const PublishTopTipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StatusBarUtils.setUpTransparentStatusBar();
    return ViewModelProvider<PublishTopTipViewModel>(
      create: (context) => PublishTopTipViewModel(PublishModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: BaseScaffold(
            toolBar: CommonSearchAppBar(
              changedHandler: (value) {
                if (value.isNotNullOrEmpty()) {
                  // viewModel.reqEntity.pageNum = 1;
                }
              },
              // editingCompleteHandler: viewModel.inputCommit,
              clearHandler: () {
                // viewModel.searchResult.value.orEmptyList().clear();
              },
              autoFocus: true,
              enableInteractiveSelection: true,

              /// 输入法按钮点击
              submittedHandler: (value) {
                // viewModel.reqEntity.keyword = value;
                viewModel.search(value);
              },
              placeholder: '搜索话题',
            ),
            body: ValueListenableBuilder<List<TopTipPageEntity>?>(
                valueListenable: viewModel.searchResult,
                builder: (context, value, child) {
                  if (value.orEmptyList().isEmpty) {
                    return _buildNoDataWidget();
                  }

                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return PublishSearchItem(
                          title: value![index].content ?? '',
                          onTapCallBack: () {
                            Navigator.pop(context, value[index].content);
                          },
                        );
                      },
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 1.px,
                          color: color_FFF2F2F2,
                        );
                      },
                      itemCount: value!.length);
                }),
            viewModel: viewModel,
          ),
        );
      },
    );
  }

  Widget _buildNoDataWidget() {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.only(top: 50.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/common/common_no_data.png',
            width: 81.px,
            height: 85.px,
          ),
          Text(
            '暂无内容',
            style: TextStyle(
              color: color_FFBDBDBD,
              fontSize: 16.px,
            ),
          ),
        ],
      ),
    );
  }
}

class _PublishTopTipView extends StatefulWidget {
  final PublishTopTipViewModel viewModel;
  const _PublishTopTipView({Key? key, required this.viewModel})
      : super(key: key);

  @override
  _PublishTopTipViewState createState() => _PublishTopTipViewState();
}

class _PublishTopTipViewState extends State<_PublishTopTipView> {
  PublishTopTipViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [],
      ),
    );
  }
}
