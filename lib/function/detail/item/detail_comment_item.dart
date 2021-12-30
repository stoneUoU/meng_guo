import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/style/common_button_style.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:meng_guo/function/detail/entity/detail_comment_resp_entity.dart';
import 'package:meng_guo/function/detail/viewmodel/detail_view_model.dart';
import 'package:meng_guo/function/publish/utils/my_special_text_span_builder.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class DetailCommentItem extends StatefulWidget {
  final List<DetailCommentEntity> pageData;
  const DetailCommentItem({Key? key, required this.pageData}) : super(key: key);

  @override
  _DetailCommentItemState createState() => _DetailCommentItemState();
}

class _DetailCommentItemState extends State<DetailCommentItem> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    // textEditingController.text = widget.pageData.content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 16.px),
          margin: EdgeInsets.only(top: 40.px),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: color_FFF4F3F8,
                width: 6.px,
              ),
              bottom: BorderSide(
                color: color_FFF4F3F8,
                width: 1.px,
              ),
            ),
          ),
          child: IconText(
            '评论 ${widget.pageData.length.toString()}',
            padding: EdgeInsets.only(
              right: 5.px,
            ),
            icon: Image.asset('assets/images/discover/discover_hot_icon.png'),
            style: TextStyle(
              fontSize: 15.px,
              fontWeight: FontWeight.bold,
              color: color_FF000000,
            ),
          ),
        ),
        widget.pageData.orEmptyList().isEmpty
            ? const SizedBox()
            : ListView.builder(
                padding:
                    EdgeInsets.symmetric(vertical: 12.px, horizontal: 16.px),
                itemBuilder: (context, index) {
                  return _buildFirstFloorCommentWidget(widget.pageData[index]);
                },
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.pageData.length,
                shrinkWrap: true,
              ),
      ],
    );
  }

  Widget _buildSecondFloorCommentWidget(
      List<DetailCommentEntity> secondFloorList) {
    if (secondFloorList.isEmpty) {
      return SizedBox();
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 48.5.px,
        top: 15.px,
      ),
      padding: EdgeInsets.all(15.px),
      decoration: BoxDecoration(
        color: Color(0xFFF7F6FB),
        borderRadius: BorderRadius.all(Radius.circular(5.px)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          secondFloorList.length,
          (index) {
            // return Text(secondFloorList[index].user?.nickname?.toString() ?? '',style: ,)
            //     .marginBottom(index != secondFloorList.length - 1 ? 15.px : 0);
            return RichText(
              text: TextSpan(
                  text: secondFloorList[index].user?.nickname?.toString() ?? '',
                  style: TextStyle(
                    color: Color(0xFF458BD4),
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${secondFloorList[index].content}',
                      style: TextStyle(
                        color: Color(0xFF6C6B70),
                        fontSize: 14.px,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }

  ///List<DetailCommentEntity> firstList
  Widget _buildFirstFloorCommentWidget(DetailCommentEntity entity) {
    textEditingController.text = entity.content.toString();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BaseExtendedImage(
                url: entity.user?.avatar,
                shape: BoxShape.circle,
                defaultSize: 40.px,
                width: 40.px,
                height: 40.px,
                placeHolder: 'assets/images/my/my_header_default.png',
                // height: 250.px,
              ).marginRight(8.5.px),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entity.user?.nickname?.toString() ?? '',
                          style: TextStyle(
                              color: color_FF9D9D9D,
                              fontSize: 13.px,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconText(
                              entity.likeCount.toString(),
                              padding: EdgeInsets.only(
                                right: 5.px,
                              ),
                              icon: Image.asset(
                                  'assets/images/home/home_praise.png'),
                              style: TextStyle(
                                fontSize: 13.px,
                                height: 1,
                                color: color_FF9D9D9D,
                              ),
                            ).marginRight(5.px),
                            TextButton(
                              onPressed: () {},
                              style: CommonButtonStyle(
                                color: color_FFF3F3F3,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.px,
                                  vertical: 3.5.px,
                                ),
                              ),
                              child: Text(
                                '回复',
                                style: TextStyle(
                                  color: Color(0xFF7C7E85),
                                  fontSize: 11.px,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      entity.createdAt.toString(),
                      style: TextStyle(
                        color: Color(0xFFB9B9B9),
                        fontSize: 10.px,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          ExtendedTextField(
            specialTextSpanBuilder: MySpecialTextSpanBuilder(
              showAtBackground: true,
            ),
            scrollPadding: EdgeInsets.zero,
            style: TextStyle(
              color: color_FF000000,
              fontWeight: FontWeight.w500,
              fontSize: 14.px,
            ),
            maxLines: null,
            readOnly: true,
            enableInteractiveSelection: false,
            keyboardAppearance: Brightness.light,
            controller: textEditingController,
            decoration: const InputDecoration.collapsed(
              hintText: '',
            ),
          ).marginLeft(48.5.px).marginTop(12.px),
          // Text(
          //   entity.content.toString(),
          //   style: TextStyle(
          //     color: color_FF000000,
          //     fontWeight: FontWeight.w500,
          //     fontSize: 14.px,
          //   ),
          // ).marginLeft(48.5.px).marginTop(12.px),
          _buildSecondFloorCommentWidget(entity.lastThreeComments ?? [])
        ],
      ),
    );
  }
}
