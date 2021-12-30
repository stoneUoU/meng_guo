import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:meng_guo/function/detail/page/detail_page.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class HomeCommonListItem extends StatelessWidget {
  final int index;
  final HomeListContentItemViewModel viewModel;

  const HomeCommonListItem(
      {Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget html = Html(
      data: viewModel.content,
      // customRender: {
      //   "span": (RenderContext context, Widget child) {
      //     return TextSpan(text: "🐦");
      //   },
      // },
      // style: {
      //   'p': Style(
      //     color: Colors.red,
      //   ),
      // },
      tagsList: Html.tags,
    );

    return Container(
      padding: EdgeInsets.fromLTRB(15.px, 15.px, 15.px, 10.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: color_FFF4F3F8, width: 3.px),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BaseExtendedImage(
                url: viewModel.userIcon,
                shape: BoxShape.circle,
                defaultSize: 20.px,
                width: 20.px,
                height: 20.px,
                placeHolder: 'assets/images/my/my_header_default.png',
                borderRadius: BorderRadius.circular(10.px),
              ).marginRight(6.px),
              Text(
                viewModel.userName,
                style: TextStyle(
                    fontSize: 13.px,
                    fontWeight: FontWeight.bold,
                    color: color_FF676767),
              ),
            ],
          ).marginBottom(8.5.px),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.title,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 17.px,
                          color: color_FF000000,
                          fontWeight: FontWeight.bold),
                    ).marginBottom(13.5.px),
                    Text(
                      viewModel.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.px,
                          color: color_FF000000,
                          fontWeight: FontWeight.w400),
                    ),
                    // Container(
                    //   child: html,
                    //   height: 40,
                    // )
                  ],
                ).marginRight(11.px),
              ),
              Visibility(
                visible: viewModel.imageUrl.orEmptyString().isNotNullOrEmpty(),
                child: BaseExtendedImage(
                  url: viewModel.imageUrl.orEmptyString(),
                  shape: BoxShape.rectangle,
                  defaultSize: 40.px,
                  width: 95.px,
                  height: 66.px,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5.px,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // html,

          Container(
            // width: ScreenUtils.screenW(),
            height: 32.px,
            margin: EdgeInsets.only(top: 10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _buildTipWidget(viewModel.tags[index]).marginRight(
                          index != viewModel.tags.length - 1 ? 10.px : 0);
                    },
                    itemCount: viewModel.tags.length,
                    shrinkWrap: true,
                  ),
                  width: ScreenUtils.screenW() * 0.7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconText(
                      viewModel.likeCount,
                      padding: EdgeInsets.only(
                        right: 5.px,
                      ),
                      icon: Image.asset('assets/images/home/home_praise.png'),
                      style: TextStyle(
                        fontSize: 13.px,
                        height: 1,
                        color: color_FF9D9D9D,
                      ),
                    ).marginRight(22.px),
                    IconText(
                      viewModel.commentCount,
                      padding: EdgeInsets.only(
                        right: 5.px,
                      ),
                      icon: Image.asset('assets/images/home/home_comment.png'),
                      style: TextStyle(
                        fontSize: 13.px,
                        height: 1,
                        color: color_FF9D9D9D,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // child: Stack(
            //   // alignment: AlignmentDirectional.bottomEnd,
            //   children: [
            //     Visibility(
            //       child: Wrap(
            //         spacing: 10.px,
            //         runSpacing: 4.px,
            //         direction: Axis.horizontal,
            //         alignment: WrapAlignment.start,
            //         runAlignment: WrapAlignment.center,
            //         crossAxisAlignment: WrapCrossAlignment.center,
            //         children: List.generate(
            //           viewModel.tags.length,
            //           (index) {
            //             return _buildTipWidget(viewModel.tags[index]);
            //           },
            //         ),
            //       ),
            //       visible: viewModel.tags.isNotEmpty,
            //     ),
            //     Positioned(
            //       bottom: 8.px,
            //       right: 0,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           IconText(
            //             viewModel.likeCount,
            //             padding: EdgeInsets.only(
            //               right: 5.px,
            //             ),
            //             icon: Image.asset('assets/images/home/home_praise.png'),
            //             style: TextStyle(
            //               fontSize: 13.px,
            //               height: 1,
            //               color: color_FF9D9D9D,
            //             ),
            //           ).marginRight(22.px),
            //           IconText(
            //             viewModel.commentCount,
            //             padding: EdgeInsets.only(
            //               right: 5.px,
            //             ),
            //             icon:
            //                 Image.asset('assets/images/home/home_comment.png'),
            //             style: TextStyle(
            //               fontSize: 13.px,
            //               height: 1,
            //               color: color_FF9D9D9D,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    ).wrapGestureDetector(onTap: () {
      Navigator.pushNamed(context, DetailPage.sName,
          arguments: viewModel.threadId);
    });
  }

  Widget _buildTipWidget(String tipTitle) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(8.px),
        decoration: BoxDecoration(
          color: color_FFF5FAFF,
          borderRadius: BorderRadius.all(Radius.circular(16.px)),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/home/home_tip.png').marginRight(11.5.px),
            CommonIconTextButton(
              onTap: () {},
              title: tipTitle,
              imagePosition: ButtonImagePosition.right,
              imageName: 'assets/images/home/home_arrow_right.png',
              imageSize: Size(5.px, 9.px),
              padding: 8.px,
              textStyle: TextStyle(
                  fontSize: 13.px,
                  color: color_FF676767,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
