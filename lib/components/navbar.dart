import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "search"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "history",
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
// 検索ページへの遷移処理
            break;
          case 1:
// トップページへの遷移処理
            break;
          case 2:
// 履歴ページへの遷移処理
            break;
        }
      },
    );
  }
}