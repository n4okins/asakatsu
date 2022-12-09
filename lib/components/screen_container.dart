
import 'package:asakatsu/provider.dart';

import 'package:asakatsu/views/history.dart';
import 'package:asakatsu/views/home.dart';
import 'package:asakatsu/views/search_coupon.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ScreenContainer extends ConsumerWidget {
  final List<Widget> screens = [
    const SearchCouponPage(),
    const HomePage(),
    const HistoryPage(),
  ];

  ScreenContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchで変数の状態の変化を監視する。
    final displayPage = ref.watch(displayPageProvider);


    return Scaffold(
      body: screens[displayPage.index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: displayPage.index,

        onTap: (int selectIndex) {
          ref.read(displayPageProvider.notifier).state = DisplayPage.values[selectIndex];
          debugPrint("$displayPage, ${displayPage.index}");
        },

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'search',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'history',
          ),
        ],
      ),
    );
  }
}