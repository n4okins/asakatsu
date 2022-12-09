import "dart:convert";


class Coupon {
  final String couponID;
  final String imageURL;
  final String? description;

  Coupon({
    required this.couponID,
    required this.imageURL,
    this.description
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    couponID: json["coupon_id"],
    imageURL: json["image_url"],
    description: json["description"]
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponID,
    "image_url": imageURL,
    "description": description
  };
}

Coupon couponFromJson(String jsonStr) => Coupon.fromJson(json.decode(jsonStr));
String couponToJson(Coupon coupon) => json.encode(coupon.toJson());
