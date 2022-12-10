import 'package:asakatsu/components/popup.dart';
import 'package:flutter/material.dart';
import "package:asakatsu/model/coupon.dart";
import 'package:asakatsu/components/buttons.dart';

class CouponCard extends StatefulWidget {
  final Coupon coupon;

  const CouponCard({Key? key, required this.coupon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CouponCardState();
}

class CouponCardState extends State<CouponCard> {
  @override
  Widget build(BuildContext context) {
    Coupon coupon = widget.coupon;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(minHeight: 224, minWidth: 320),
                child: Container(
                    width: 300,
                    height: 216,
                    color: coupon.isUsed ? Color(0xffeeeeee) : Color(0xffC8E6C9),
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
                            padding: const EdgeInsets.only(top: 10),
                            child: MyButton(
                                child: coupon.isUsed ? Text("使用済み") : Text("詳細") ,
                                color: coupon.isUsed ? Color(0xfff5f5f5) : Color(0xff74e39a),
                                onPressed: () => couponInfoPopUp(context, coupon: coupon),
                            )
                        )
                      ],
                    )),
              )),
        ),
      ],
    );
  }
}
