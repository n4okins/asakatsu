import "dart:convert";


class Coupon {
  final String coupon_id;
  final String image_url;
  final String? description;

  Coupon({
    required this.coupon_id,
    required this.image_url,
    this.description
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    coupon_id: json["coupon_id"],
    image_url: json["image_url"],
    description: json["description"]
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": coupon_id,
    "image_url": image_url,
    "description": description
  };
}

Coupon couponFromJson(String jsonStr) => Coupon.fromJson(json.decode(jsonStr));
String couponToJson(Coupon coupon) => json.encode(coupon.toJson());
