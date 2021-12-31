import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/discover/pages/discover_page.dart';
import 'package:meng_guo/function/home/pages/home_page.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/login/pages/login_page.dart';
import 'package:meng_guo/function/message/pages/message_page.dart';
import 'package:meng_guo/function/my/pages/my_page.dart';
import 'package:meng_guo/function/publish/page/publish_page.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class MengGuoHomeIndexPage extends StatefulWidget {
  static const String sName = "MengGuoHomeIndexPage";

  const MengGuoHomeIndexPage({Key? key}) : super(key: key);

  @override
  _MengGuoHomeIndexState createState() => _MengGuoHomeIndexState();
}

class _MengGuoHomeIndexState extends State<MengGuoHomeIndexPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const DiscoverPage(),
    const SizedBox(),
    const MessagePage(),
    const MyPage(),
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _selectedIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/index/index_home_unselect.png'),
              activeIcon:
                  Image.asset('assets/images/index/index_home_select.png'),
              label: getLanguage<S>().common_tab_home,
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  'assets/images/index/index_discover_unselect.png'),
              activeIcon:
                  Image.asset('assets/images/index/index_discover_select.png'),
              label: getLanguage<S>().common_tab_discover,
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/index/index_publish.png'),
              label: '',
              activeIcon: Image.asset('assets/images/index/index_publish.png'),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon:
                  Image.asset('assets/images/index/index_message_unselect.png'),
              activeIcon:
                  Image.asset('assets/images/index/index_message_select.png'),
              label: getLanguage<S>().common_tab_message,
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/index/index_my_unselect.png'),
              activeIcon:
                  Image.asset('assets/images/index/index_my_select.png'),
              label: getLanguage<S>().common_tab_my,
              tooltip: '',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: color_FF626262,
          selectedItemColor: color_FF5545F2,
          selectedFontSize: 11.px,
          unselectedFontSize: 11.px,
          showUnselectedLabels: true,

          // selectedIconTheme: IconThemeData(color: color_FF4CD080, size: 40),
          // fixedColor: color_FF4CD080,
          onTap: (index) {
            _onItemTapped(index, context);
          },
        ),
      ),
      body: PageView(
        children: _pages,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
        _pageController.jumpToPage(index);
      });
    } else {
      LoginRespEntity? user = UserStorage.getUser();
      if (user != null) {
        Navigator.of(context).pushNamed(PublishPage.sName);
      } else {
        Navigator.of(context).pushNamed(LoginPage.sName);
      }
    }
  }
}
