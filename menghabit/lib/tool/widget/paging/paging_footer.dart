import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/paging/base_paging_view_model.dart';
import 'package:menghabit/tool/base/property/empty_constant.dart';
import 'package:menghabit/tool/constants/colors.dart';
import 'package:menghabit/tool/widget/paging/paging_footer_status.dart';

import 'package:menghabit/menghabit.dart';

/// 加载的footer
///
class PagingFooter<VM extends BasePagingViewModel> extends StatelessWidget {
  /// 给底部加载的footer添加一个底部间距(不包含footer本身高度64px)
  final double footerBottom;

  const PagingFooter({
    Key? key,
    this.footerBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasePagingViewModel viewModel = context.viewModel<VM>();
    return ValueListenableBuilder<FooterStatus>(
        valueListenable: viewModel.footerStatus,
        builder: (context, value, child) {
          if (value == FooterStatus.noMore) {
            /// 无更多数据
            return Container(
              height: 64.px,
              padding: EdgeInsets.only(top: 16.px),
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: footerBottom),
              child: Text(
                defaultFooterNoMore,
                style: TextStyle(
                  color: color999999,
                  fontSize: 14.px,
                ),
              ),
            );
          } else if (value == FooterStatus.failed) {
            /// 加载失败，可点击重试
            return InkWell(
              onTap: () {
                viewModel.loadMore();
              },
              child: Container(
                height: 64.px,
                padding: EdgeInsets.only(top: 16.px),
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(bottom: footerBottom),
                child: Text(
                  defaultFooterRetry,
                  style: TextStyle(
                    color: color999999,
                    fontSize: 14.px,
                  ),
                ),
              ),
            );
          } else if (value == FooterStatus.loading) {
            /// 加载中
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CupertinoActivityIndicator(
                    radius: 8.px,
                  ),
                ),
                SizedBox(
                  width: 6.px,
                ),
                Container(
                  height: 64.px,
                  padding: EdgeInsets.only(top: 16.px),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(bottom: footerBottom),
                  child: Text(
                    defaultFooterLoadMore,
                    style: TextStyle(
                      color: color999999,
                      fontSize: 14.px,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Text("");
          }
        });
  }
}
