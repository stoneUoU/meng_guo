import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/menghabit.dart';
import 'package:video_player/video_player.dart';

class HomeMovieListItem extends StatefulWidget {
  final int index;
  final HomeListContentItemViewModel viewModel;

  const HomeMovieListItem(
      {Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  _HomeMovieListItemState createState() => _HomeMovieListItemState();
}

class _HomeMovieListItemState extends State<HomeMovieListItem> {
  late VideoPlayerController _controller;

  ValueNotifier<bool> isPlay = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((value) {
        setState(() {});
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {});
        });
      });
    _controller.addListener(() {
      isPlay.value = _controller.value.isPlaying;
    });
    // _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.px, 15.px, 15.px, 10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonIconTextButton(
            onTap: () {},
            title: '1111',
            imageName: 'assets/images/my/my_account_icon.png',
            imageSize: Size(20.px, 20.px),
            padding: 8.px,
            isMultipleLine: true,
            isMultipleAndCenter: true,
            textStyle: TextStyle(
                fontSize: 13.px,
                color: color_FF676767,
                fontWeight: FontWeight.bold),
          ).marginBottom(8.5.px),
          Container(
            height: 217.px,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  child: VideoPlayer(_controller),
                  borderRadius: BorderRadius.circular(5.px),
                ),
                ValueListenableBuilder<bool>(
                    valueListenable: isPlay,
                    builder: (context, value, child) {
                      return _ControlsOverlay(
                        controller: _controller,
                        imgString: value
                            ? ''
                            : 'assets/images/home/home_movie_play.png',
                      );
                    })
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTipWidget().marginRight(10.px),
                  _buildTipWidget(),
                ],
              ),
              Row(
                children: [
                  IconText(
                    '11',
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
                    '11',
                    padding: EdgeInsets.only(
                      right: 5.px,
                    ),
                    icon: Image.asset('assets/images/home/home_praise.png'),
                    style: TextStyle(
                      fontSize: 13.px,
                      height: 1,
                      color: color_FF9D9D9D,
                    ),
                  ),
                ],
              ),
            ],
          ).marginTop(10.px),
        ],
      ),
    );
  }

  Widget _buildTipWidget() {
    return Container(
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
            title: '电影',
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
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  _ControlsOverlay(
      {Key? key, required this.controller, required this.imgString})
      : super(key: key);

  final VideoPlayerController controller;
  final String imgString;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      icon: imgString.isNotNullOrEmpty()
          ? Image.asset(
              imgString,
              width: 45.px,
              height: 50.px,
            )
          : SizedBox(),
    );
  }
}
