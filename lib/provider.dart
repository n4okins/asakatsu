import 'package:flutter_riverpod/flutter_riverpod.dart';


enum DisplayPage { search, home, history }
final displayPageProvider = StateProvider<DisplayPage>((ref) => DisplayPage.home);

final searchWordProvider = StateProvider<String>((ref) => "");


