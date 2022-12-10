import 'package:asakatsu/components/navigation_icon.dart';
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
        body: Container(
          transform: Matrix4.translationValues(0.0, 16, 0.0),
          child: screens[displayPage.index],
        ),
        bottomNavigationBar: Container(
            transform: Matrix4.translationValues(0.0, 16, 0.0),
            child: BottomNavigationBar(
              currentIndex: displayPage.index,
              onTap: (int selectIndex) {
                ref.read(displayPageProvider.notifier).state =
                    DisplayPage.values[selectIndex];
                debugPrint("$displayPage, ${displayPage.index}");
              },
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 48,
              items: const [
                BottomNavigationBarItem(
                  icon: NavIcon(icon: Icons.search_sharp),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: NavIcon(icon: Icons.home_outlined),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: NavIcon(icon: Icons.history_outlined),
                  label: 'history',
                )
              ],
            )
        )
    );
  }
}
