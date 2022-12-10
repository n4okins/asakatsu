import "dart:convert";


enum CouponStatusType {
  unpublished, // 非公開
  published, // 公開（未取得）
  gained, // 取得済み
  used // 使用済み
}

class Coupon {
  final String couponID;
  final String imageURL;
  final String codeURL;
  final String description;
  final int cost;
  final CouponStatusType couponStatus;

  Coupon({
    required this.couponID,
    required this.imageURL,
    required this.codeURL,
    required this.description,
    required this.couponStatus,
    required this.cost,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
      couponID: json["coupon_id"],
      imageURL: json["image_url"],
      codeURL: json["code_url"],
      couponStatus: json["coupon_status"],
      description: json["description"],
      cost: json["cost"]
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponID,
    "image_url": imageURL,
    "code_url": codeURL,
    "cost": cost,
    "coupon_status": couponStatus,
    "description": description
  };
}

Coupon couponFromJson(String jsonStr) => Coupon.fromJson(json.decode(jsonStr));
String couponToJson(Coupon coupon) => json.encode(coupon.toJson());


var sampleCoupons = [
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
];

var usedCP = sampleCoupons.where((Coupon coupon) => (coupon.couponStatus == CouponStatusType.used)).toList();
var gainCP = sampleCoupons.where((Coupon coupon) => (coupon.couponStatus == CouponStatusType.gained)).toList();
var publishedCP = sampleCoupons.where((Coupon coupon) => (coupon.couponStatus == CouponStatusType.published)).toList();
