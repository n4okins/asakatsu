import 'package:asakatsu/model/coupon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum DisplayPage { search, home, history }
final displayPageProvider = StateProvider<DisplayPage>((ref) => DisplayPage.home);

final searchWordProvider = StateProvider<String>((ref) => "");
final currentDisplayCouponProvider = StateProvider<Coupon?>((ref) => null);

final currentUserPointProvider = StateProvider<int>((ref) => 100000);

final calendarDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final allCouponProvider = StateProvider<List<Coupon>>(
        (ref) => [
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-d",
                "image_url": "server/images/default.jpg",
                "code_url": "server/code/default.png",
                "cost": 50,
                "coupon_status": CouponStatusType.gained,
                "description": "このクーポンは、有効期限内にお客様が「カフェ・ド・ラ・モード」で「アメリカンコーヒー」をご注文いただいた際に、「アメリカンコーヒー」1杯分の金額を購入時に割引するクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-001",
                "image_url": "server/images/001.jpg",
                "code_url": "server/code/001.png",
                "cost": 100,
                "coupon_status": CouponStatusType.gained,
                "description": "このクーポンは、有効期限内にお客様が「カフェ・ド・ラ・モード」で「サラダ」をご注文いただいた際に、「サラダ」1皿分の金額を購入時に割引するクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-002",
                "image_url": "server/images/002.jpg",
                "code_url": "server/code/002.png",
                "cost": 100,
                "coupon_status": CouponStatusType.published,
                "description": "このクーポンは、有効期限内にお客様が「ハンバーグ王国」で「ハンバーグ」をご注文いただいた際に、「ハンバーグ」1杯分の金額を購入時に割引するクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-003",
                "image_url": "server/images/003.jpg",
                "code_url": "server/code/003.png",
                "cost": 100,
                "coupon_status": CouponStatusType.gained,
                "description": "ヨガ"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-d",
                "image_url": "server/images/default.jpg",
                "code_url": "server/code/default.png",
                "cost": 10,
                "coupon_status": CouponStatusType.used,
                "description": "コーヒー"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-001",
                "image_url": "server/images/001.jpg",
                "code_url": "server/code/001.png",
                "cost": 100,
                "coupon_status": CouponStatusType.published,
                "description": "サラダ"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-002",
                "image_url": "server/images/002.jpg",
                "code_url": "server/code/002.png",
                "cost": 100,
                "coupon_status": CouponStatusType.used,
                "description": "ハンバーグ"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-003",
                "image_url": "server/images/003.jpg",
                "code_url": "server/code/003.png",
                "cost": 100,
                "coupon_status": CouponStatusType.published,
                "description": "ヨガ"
              }
          ),
        ]
);
