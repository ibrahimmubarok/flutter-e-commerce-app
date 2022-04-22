import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/page_cubit.dart';
import '../../utils/theme.dart';
import '../widgets/custom_animated_bottom_bar.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'shopping_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/main_page';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex = 0;

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const FavoritePage();
      case 2:
        return const ShoppingPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  Widget buildBottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: whiteColor,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        // onItemSelected: (index) => setState(() => _currentIndex = index),
        onItemSelected: (index) => {
          _currentIndex = index,
          context.read<PageCubit>().setPage(_currentIndex),
        },
        items: const [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.green,
            inActiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Favorite'),
            activeColor: Colors.green,
            inActiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Shopping'),
            activeColor: Colors.green,
            inActiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Message'),
            activeColor: Colors.green,
            inActiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Stack(
              children: [
                buildContent(currentIndex),
                buildBottomBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
