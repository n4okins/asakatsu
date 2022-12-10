import "dart:convert";


class Coupon {
  final String couponID;
  final String imageURL;
  final String codeURL;
  final String description;
  final bool isUsed;

  Coupon({
    required this.couponID,
    required this.imageURL,
    required this.codeURL,
    required this.description,
    this.isUsed = false,

  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
      couponID: json["coupon_id"],
      imageURL: json["image_url"],
      codeURL: json["code_url"],
      isUsed: json["is_used"],
      description: json["description"]
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponID,
    "image_url": imageURL,
    "code_url": codeURL,
    "is_used": isUsed,
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
        "is_used": false,
        "description": "コーヒー"
      }
  ),
  Coupon.fromJson(
      {
        "coupon_id": "coupon2022-001",
        "image_url": "server/images/001.jpg",
        "code_url": "server/code/001.png",
        "is_used": false,
        "description": "サラダ"
      }
  ),
  Coupon.fromJson(
      {
        "coupon_id": "coupon2022-002",
        "image_url": "server/images/002.jpg",
        "code_url": "server/code/002.png",
        "is_used": true,
        "description": "ハンバーグ"
      }
  ),
  Coupon.fromJson(
      {
        "coupon_id": "coupon2022-003",
        "image_url": "server/images/003.jpg",
        "code_url": "server/code/003.png",
        "is_used": false,
        "description": "ヨガ"
      }
  ),
];