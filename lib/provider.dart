import 'package:asakatsu/model/coupon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum DisplayPage { search, home, history }
final displayPageProvider = StateProvider<DisplayPage>((ref) => DisplayPage.home);

final searchWordProvider = StateProvider<String>((ref) => "");
final currentDisplayCouponProvider = StateProvider<Coupon?>((ref) => null);

final currentUserPointProvider = StateProvider<int>((ref) => 100000);

final calendarDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

