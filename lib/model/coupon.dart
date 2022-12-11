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
  CouponStatusType couponStatus;

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
