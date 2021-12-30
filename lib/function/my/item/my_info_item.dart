import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:menghabit/menghabit.dart';

class MyInfoItem extends StatelessWidget {
  final MyViewModel viewModel;
  const MyInfoItem({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyViewModel viewModel = context.viewModel<MyViewModel>();

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'assets/images/my/my_bg.png',
          height: 311.px,
          fit: BoxFit.fill,
        ),
        ValueListenableBuilder<bool>(
            valueListenable: viewModel.isLogin,
            builder: (context, value, child) {
              return value
                  ? _buildLoginView(viewModel)
                  : _buildNoLoginView(viewModel);
            }),
      ],
    );
  }

  Widget _buildNoLoginView(MyViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 41.px, vertical: 16.px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(23.px),
        ),
      ),
      child: Text(
        '登录/注册',
        style: TextStyle(
          color: color_FF448FEA,
          fontSize: 15.px,
          height: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).wrapGestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          viewModel.goToLoginPage();
        });
  }

  Widget _buildLoginView(MyViewModel viewModel) {
    return Positioned(
      left: 15.px,
      top: 121.px,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder<String>(
              valueListenable: viewModel.headUrl,
              builder: (context, value, child) {
                return BaseExtendedImage(
                  url: value,
                  shape: BoxShape.circle,
                  placeHolder: 'assets/images/my/my_header_default.png',
                  defaultSize: 73.px,
                  width: 73.px,
                  height: 73.px,
                );
              }),
          // Image.asset('assets/images/my/my_header_default.png'),
          ValueListenableBuilder<String>(
              valueListenable: viewModel.nickName,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.px,
                      fontWeight: FontWeight.bold),
                ).marginTop(17.px);
              }),
          Row(
            children: [
              ValueListenableBuilder<String>(
                  valueListenable: viewModel.sign,
                  builder: (context, value, child) {
                    return Text(
                      value.isNotEmpty ? value : '这个人很懒，什么都没有写~',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.px,
                      ),
                    ).marginRight(12.px);
                  }),
              Image.asset('assets/images/my/my_edit_icon.png'),
            ],
          ).marginTop(12.px),
          ListListenableBuilder<MyItemsData>(
              listListenable: viewModel.topItems,
              builder: (context, value, child) {
                return Row(
                  children: List.generate(value.length, (index) {
                    return RichText(
                      text: TextSpan(
                          text: value[index].count,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.px,
                          ),
                          children: [
                            TextSpan(
                              text: ' ${viewModel.topItems[index].title}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.px,
                              ),
                            ),
                          ]),
                    ).marginRight(30.px);
                  }),
                ).marginTop(12.px);
              }),
          // Row(
          // children: List.generate(
          //   viewModel.topItems.length,
          //   (index) {
          //     return RichText(
          //       text: TextSpan(
          //           text: '0',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 20.px,
          //           ),
          //           children: [
          //             TextSpan(
          //               text: ' ${viewModel.topItems[index]}',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 12.px,
          //               ),
          //             ),
          //           ]),
          //     ).marginRight(30.px);
          //   },
          // ),
          // ).marginTop(16.px)
        ],
      ),
    );
  }

  // String _fetchCount(int index) {
  //   if (index == 0) {
  //     return viewModel.
  //   }
  // }
}
