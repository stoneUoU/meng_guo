import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/common/widget/refresh/common_footer.dart';
import 'package:meng_guo/common/widget/refresh/common_sliver_footer.dart';
import 'package:meng_guo/function/message/item/message_my_item.dart';
import 'package:meng_guo/function/message/item/message_system_item.dart';
import 'package:meng_guo/function/message/item/message_tip_item.dart';
import 'package:meng_guo/function/message/model/message_model.dart';
import 'package:meng_guo/function/message/viewmodel/message_child_view_model.dart';
import 'package:meng_guo/function/message/viewmodel/message_view_model.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MessagePage extends StatelessWidget {
  static const String sName = "MessagePage";

  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('message page');
    return ViewModelProvider<MessageViewModel>(
      create: (context) => MessageViewModel(MessageModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<MessageViewModel>(
          viewModel: viewModel,
          body: _MessageView(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}

class _MessageView extends StatefulWidget {
  final MessageViewModel viewModel;
  const _MessageView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<_MessageView>
    with AutomaticKeepAliveClientMixin {
  MessageViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    print('build Message page');
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 96.px,
          padding: EdgeInsets.symmetric(horizontal: 60.px),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: color_FFF3F3F3, width: 6.px),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonIconTextButton(
                onTap: () {
                  if (viewModel.msgType.value != MessageType.my) {
                    viewModel.msgType.value = MessageType.my;
                    viewModel.page = 1;
                    viewModel.show.value = true;
                    viewModel.loadData(false);
                  }
                },
                title: '我的消息',
                imagePosition: ButtonImagePosition.top,
                imageName: 'assets/images/message/message_my.png',
                imageSize: Size(39.px, 39.px),
                padding: 6.5.px,
                textStyle: TextStyle(
                    fontSize: 13.px,
                    color: color_FF000000,
                    fontWeight: FontWeight.w400),
              ),
              CommonIconTextButton(
                onTap: () {
                  if (viewModel.msgType.value != MessageType.system) {
                    viewModel.msgType.value = MessageType.system;
                    viewModel.page = 1;
                    viewModel.show.value = true;
                    viewModel.loadData(false);
                  }
                },
                title: '系统消息',
                imagePosition: ButtonImagePosition.top,
                imageName: 'assets/images/message/message_system.png',
                imageSize: Size(39.px, 39.px),
                padding: 6.5.px,
                textStyle: TextStyle(
                    fontSize: 13.px,
                    color: color_FF000000,
                    fontWeight: FontWeight.w400),
              ),
              CommonIconTextButton(
                onTap: () {
                  if (viewModel.msgType.value != MessageType.tip) {
                    viewModel.msgType.value = MessageType.tip;
                    viewModel.page = 1;
                    viewModel.show.value = true;
                    viewModel.loadData(false);
                  }
                },
                title: '帖子消息',
                imagePosition: ButtonImagePosition.top,
                imageName: 'assets/images/message/message_tip.png',
                imageSize: Size(39.px, 39.px),
                padding: 6.5.px,
                textStyle: TextStyle(
                    fontSize: 13.px,
                    color: color_FF000000,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        ValueListnableTuple2Builder<MessageType, bool>(
            valueListenables: Tuple2(viewModel.msgType, viewModel.show),
            builder: (context, value, child) {
              return Container(
                padding: EdgeInsets.all(16.px),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: color_FFF4F3F8, width: 1.px),
                  ),
                ),
                child: CommonIconTextButton(
                  onTap: () {
                    if (viewModel.dataCount.value != 0) {
                      viewModel.show.value = !viewModel.show.value;
                    }
                  },
                  title: value.item1.fetchMessageString(),
                  imagePosition: ButtonImagePosition.right,
                  imageName: value.item2
                      ? 'assets/images/common/arrow_down.png'
                      : 'assets/images/common/arrow_up.png',
                  imageSize: Size(10.px, 10.px),
                  padding: 5.px,
                  textStyle: TextStyle(
                      fontSize: 16.px,
                      color: color_FF000000,
                      fontWeight: FontWeight.w500),
                ),
              );
            }),
        Expanded(
            child: ValueListenableBuilder<bool>(
                valueListenable: viewModel.show,
                builder: (context, value, child) {
                  return Visibility(
                    visible: value,
                    child: MessageChildView(),
                  );
                })),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MessageChildView extends StatelessWidget {
  const MessageChildView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChildViewModelProvider<MessageViewModel, MessageChildViewModel>(
      create: (_, parent) => parent.childViewModel,
      initViewModel: (context, parent, viewModel) {
        viewModel.setAppBarShow(false);
        viewModel.hideStateToolBar = true;
        viewModel.initParentViewModel(parent);
      },
      builder: (context, parent, viewModel, child) {
        return MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: BaseScaffold(
            viewModel: viewModel,
            body: Container(
              color: color_FFF7F9FA,
              child: ValueListnableTuple3Builder<int, bool, MessageType>(
                  valueListenables: Tuple3(
                      parent.dataCount, parent.showFooter, parent.msgType),
                  builder: (context, value, child) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: 54.px + ScreenUtils.padBotH()),
                      child: EasyRefresh(
                        onLoad: value.item2
                            ? null
                            : () {
                                return parent.getStoreList();
                              },
                        enableControlFinishLoad: true,
                        controller: parent.easyRefreshController,
                        footer: CommonFooter(
                          loadingText: '加载中',
                          noMoreText: '已全部加载完毕',
                          textColor: color_FF999999,
                        ),
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final item = parent.dataList[index];
                              if (value.item3 == MessageType.tip) {
                                return MessageTipItem(
                                    contentItemViewModel: item);
                              } else if (value.item3 == MessageType.system) {
                                return MessageSystemItem(
                                    contentItemViewModel: item);
                              } else {
                                return MessageMyItem(
                                    contentItemViewModel: item);
                              }
                            },
                            physics: AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                height: 1.px,
                                color: color_FFF2F2F2,
                              );
                            },
                            itemCount: value.item1),
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
