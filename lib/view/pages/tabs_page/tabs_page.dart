import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:dream_store_app/routers/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/prodect_controller.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/custem_cart_icon.dart';
import '../Account_page/account_page.dart';
import '../Category_page/caregory_page.dart';
import '../Home_page/home_page.dart';
import '../cart_page/cart_page.dart';
import '../ask_AI_page/ask_ai_page.dart';

class TabsPage extends StatefulWidget {
  // ignore: use_super_parameters
  const TabsPage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  void _selectScreen(int index) {
    if (index == 3) {
      Get.toNamed(RoutesClass.getCartPageRoute());
    }
    setState(() {
      if (index != 2 && index != 3) {
        _selectedScreenIndex = index;
      }
    });
  }

  int _selectedScreenIndex = 0;

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  // Widget _screen =  switch(_selectedScreenIndex)

  // ignore: prefer_final_fields
  late List<Map<String, Widget>> _screens = [
    {
      'Screen': HomePage(
        onClick: listClick,
      ),
    },
    {
      'Screen': CategoryPage(),
    },
    {
      'Screen': const AskAIPage(),
    },
    {
      'Screen': const CartPage(),
    },
    {
      'Screen': AccountPage(),
    },
  ];

  late ThemeData _theme;
  final ProdectController _prodectController = Get.put(ProdectController());

  // ProdectController _prodectController = Get.find();

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return AddToCartAnimation(
      cartKey: cartKey,
      width: 10,
      height: 10,
      // opacity: 1,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: false,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        backgroundColor: Constants.kSecondaryColor,
        body: _screens[_selectedScreenIndex]['Screen'],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: _theme.colorScheme.secondaryContainer,
                      width: 0.5))),
          // height: 60,
          child: BottomNavigationBar(
            showSelectedLabels: false,

            // enableFeedback: false,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey[600],
            selectedLabelStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            unselectedLabelStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            onTap: _selectScreen,
            selectedItemColor: Constants.kSecondaryColor,
            currentIndex: _selectedScreenIndex,
            backgroundColor: _theme.colorScheme.primaryContainer,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: LocaleKeys.home,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: LocaleKeys.category,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.question_mark_outlined,
                  color: _theme.colorScheme.primaryContainer,
                ),
                label: LocaleKeys.ask,
              ),
              BottomNavigationBarItem(
                icon: Container(
                    key: cartKey,
                    child: CustemCartIcon(
                      iconColor: Colors.grey[600]!,
                      prodectController: _prodectController,
                    )),
                label: LocaleKeys.cart,
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_crop_square),
                label: LocaleKeys.account,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () => Get.toNamed(RoutesClass.getAskAIPageRoute()),
          child: Container(
            padding: const EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.transparent,
              gradient: LinearGradient(
                  colors: [
                    _theme.colorScheme.secondaryContainer,
                    _theme.colorScheme.secondaryContainer,
                    _theme.colorScheme.primaryContainer
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.5, 0.5]),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    _theme.colorScheme.primary == Constants.kTextColor
                        ? const AssetImage(Constants.askAIDarkImage)
                        : const AssetImage(Constants.askAIImage),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
  }
}
