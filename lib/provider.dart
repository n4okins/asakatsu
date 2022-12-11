import 'package:asakatsu/model/coupon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum DisplayPage { search, home, history }
final displayPageProvider = StateProvider<DisplayPage>((ref) => DisplayPage.home);

final searchWordProvider = StateProvider<String>((ref) => "");
final currentDisplayCouponProvider = StateProvider<Coupon?>((ref) => null);

final currentUserPointProvider = StateProvider<int>((ref) => 500);

final calendarDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final shownLoginProvider = StateProvider<bool>((ref) => false);

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
                "cost": 1000,
                "coupon_status": CouponStatusType.gained,
                "description": "このクーポンは、有効期限内にお客様が「フィットネスジム・トシダイ」をご利用の際に、「30分 トレーニングコース」の料金を無料にするクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-d",
                "image_url": "server/images/default.jpg",
                "code_url": "server/code/default.png",
                "cost": 10,
                "coupon_status": CouponStatusType.used,
                "description": "このクーポンは、有効期限内にお客様が「カフェ・エスプレッソ」で「アメリカンコーヒー」をご注文いただいた際に、100円を割引するクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-001",
                "image_url": "server/images/001.jpg",
                "code_url": "server/code/001.png",
                "cost": 100,
                "coupon_status": CouponStatusType.published,
                "description": "このクーポンは、有効期限内にお客様が「おいしいれすとらん デイビッド」で「今日のサラダ」をご注文いただいた際に、「サラダ」1皿分の金額を購入時に割引するクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-002",
                "image_url": "server/images/002.jpg",
                "code_url": "server/code/002.png",
                "cost": 100,
                "coupon_status": CouponStatusType.used,
                "description": "このクーポンは、有効期限内にお客様が「ハンバーグ王国」で「ハンバーグ」をご注文いただいた際に、「ハンバーグ」1杯分の金額を購入時に割引するクーポンです。"
              }
          ),
          Coupon.fromJson(
              {
                "coupon_id": "coupon2022-003",
                "image_url": "server/images/003.jpg",
                "code_url": "server/code/003.png",
                "cost": 400,
                "coupon_status": CouponStatusType.published,
                "description": "このクーポンは、有効期限内にお客様が「フィットネスジム・トシダイ」をご利用の際に、「30分 サウナ付きコース」の料金を半額にするクーポンです。"
              }
          ),
        ]
);
