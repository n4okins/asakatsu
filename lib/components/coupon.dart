import 'package:flutter/material.dart';
import "package:asakatsu/model/coupon.dart";

class CouponCard extends StatefulWidget {
  const CouponCard({Key? key, required this.couponID}) : super(key: key);
  final String couponID;

  @override
  State<StatefulWidget> createState() => CouponCardState();
}

class CouponCardState extends State<CouponCard> {
  Coupon getCouponInfo() {
    // var response = await http.get(
    //   Uri.https(
    //     "192.168.2.108:2434", "/coupons/info/", {"coupon_id": "coupon2022"}
    //   )
    // );
    // final List<dynamic> body = jsonDecode(response.body);
    final Coupon coupon = Coupon.fromJson(
        {"coupon_id": "coupon2022", "image_url": "server/images/default.jpg"}
    );
    return coupon;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Coupon coupon = getCouponInfo();
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                  width: 300,
                  height: 216,
                  color: const Color(0xffC8E6C9),
                  child: Column(
                    children: [
                      // Text(coupon.coupon_id),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10),
                          child: AspectRatio(
                            aspectRatio: 1.75,
                            child: Image.asset(coupon.image_url,
                                fit: BoxFit.cover),
                          )),
                      SizedBox(
                        height: 35,
                        width: 117,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  //角の丸み
                                  side: const BorderSide(
                                      color: Colors.black), //枠線の設定
                                ),
                                color: const Color(0xff74e39a),
                                onPressed: () {},
                              child: const Text(
                                "詳細",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                        ),
                      ),
                    ],
                  )
              )
          ),
        ),
      ],
    );
  }
}
