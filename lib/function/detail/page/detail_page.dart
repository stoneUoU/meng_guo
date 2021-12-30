import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:meng_guo/function/detail/item/detail_comment_item.dart';
import 'package:meng_guo/function/detail/item/detail_input_widget.dart';
import 'package:menghabit/menghabit.dart';
import 'package:intl/intl.dart';
import 'package:meng_guo/function/detail/model/detail_model.dart';
import 'package:meng_guo/function/detail/viewmodel/detail_view_model.dart';
import 'package:meng_guo/function/discover/model/discover_model.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class DetailPage extends StatelessWidget {
  final int threadId;
  static const String sName = "DetailPage";

  const DetailPage({Key? key, required this.threadId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StatusBarUtils.setUpTransparentStatusBar();
    return ViewModelProvider<DetailViewModel>(
      create: (context) => DetailViewModel(DetailModel()),
      initViewModel: (context, viewModel) =>
          viewModel.initialise(context, threadId),
      builder: (context, viewModel, child) {
        return BaseScaffold<DetailViewModel>(
          resizeToAvoidBottomInset: true,
          viewModel: viewModel,
          body: _DetailView(viewModel: viewModel),
        );
      },
    );
  }
}

class _DetailView extends StatefulWidget {
  final DetailViewModel viewModel;
  const _DetailView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<_DetailView> {
  DetailViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopWidget(),
                  _buildContentWidget(),
                  ValueListenableBuilder<List<String>>(
                    valueListenable: viewModel.images,
                    builder: (context, value, child) {
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 6.px,
                            height: 6.px,
                            color: Colors.white,
                          );
                        },
                        padding: EdgeInsets.symmetric(horizontal: 16.px),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          //viewModel.detailData?.content?.indexes
                          return BaseExtendedImage(
                            url: value[index],
                            // shape: BoxShape.circle,
                            defaultSize: ScreenUtils.screenW(),
                            width: ScreenUtils.screenW(),
                            // height: 250.px,
                          );
                        },
                        itemCount: value.length,
                      );
                    },
                  ),
                  DetailCommentItem(
                    pageData: viewModel.commentData?.pageData ?? [],
                  ),
                ],
              ),
            ).marginBottom(57.px),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DetailInputWidget(
                headUrl: viewModel.user?.avatarUrl ?? '',
                onChangeCallBack: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentWidget() {
    // String imageStr = viewModel
    Widget html = Html(
      data: viewModel.detailData?.content?.text ?? '',

      // tagsList: Html.tags,
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.px),
      child: html,
    );
  }

  Widget _buildTopWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 11.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                BaseExtendedImage(
                  url: viewModel.detailData?.user?.avatar,
                  shape: BoxShape.circle,
                  defaultSize: 36.px,
                  width: 36.px,
                  height: 36.px,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      viewModel.detailData?.user?.nickname ?? '',
                      style: TextStyle(
                        color: color_FF616470,
                        fontSize: 13.px,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          viewModel.detailData?.createdAt ?? '',
                          style: TextStyle(
                            color: color_FF9D9D9D,
                            fontSize: 10.px,
                          ),
                        ),
                        IconText(
                          viewModel.detailData?.viewCount?.toString() ?? '0',
                          padding: EdgeInsets.only(
                            right: 5.px,
                          ),
                          icon: Image.asset('assets/images/home/home_eye.png'),
                          style: TextStyle(
                            fontSize: 10.px,
                            color: color_FF9D9D9D,
                          ),
                        ).marginLeft(13.px),
                      ],
                    ),
                  ],
                ).marginLeft(12.px).paddingTop(2.px).paddingBottom(2.px),
              ],
            ),
          ),
          Text(
            viewModel.detailData?.title ?? '',
            style: TextStyle(
              color: color_FF000000,
              fontSize: 18.px,
              fontWeight: FontWeight.bold,
            ),
          ).marginTop(12.px),
        ],
      ),
    );
  }
}
