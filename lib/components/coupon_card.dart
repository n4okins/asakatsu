import 'package:flutter/material.dart';
import "package:asakatsu/model/coupon.dart";

class CouponCard extends StatefulWidget {
  final String couponID;
  final String imageURL;
  const CouponCard({Key? key, required this.couponID, required this.imageURL})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CouponCardState();
}

class CouponCardState extends State<CouponCard> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Coupon coupon = Coupon.fromJson(
        {"coupon_id": widget.couponID, "image_url": widget.imageURL}
    );
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
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20),
                          child: AspectRatio(
                            aspectRatio: 1.75,
                            child: Image.asset(coupon.imageURL,
                                fit: BoxFit.cover),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
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
                              )),
                        ),
                      ),
                    ],
                  ))),
        ),
      ],
    );
  }
}
