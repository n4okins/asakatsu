import 'package:asakatsu/components/popup.dart';
import 'package:asakatsu/provider.dart';
import 'package:flutter/material.dart';
import "package:asakatsu/model/coupon.dart";
import 'package:asakatsu/components/buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CouponCard extends ConsumerStatefulWidget {
  final Coupon coupon;

  const CouponCard({Key? key, required this.coupon}) : super(key: key);

  @override
  ConsumerState<CouponCard> createState() => CouponCardState();
}

class CouponCardState extends ConsumerState<CouponCard> {
  @override
  Widget build(BuildContext context) {
    Coupon coupon = widget.coupon;
    final currentUserPoint = ref.watch(currentUserPointProvider);

    generateButtonPressed() {
      switch (coupon.couponStatus) {
        case CouponStatusType.used:
          return null;
        case CouponStatusType.gained:
          BuildContext context2;
          return showDialog<void>(
              context: context,
              builder: (_) {
                context2 = _;
                return Dialogs(
                    child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.of(context2).pop(),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Image.asset(coupon.imageURL, fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 30, right: 20, left: 20),
                                child: Text("【概要】\n${coupon.description}"),
                              )),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 20, right: 20, left: 20),
                                child: Text(
                                    "ご利用は有効期限内に1度限りです。使用済みのクーポンを利用することはできません。"),
                              )),
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: greenButton(
                        color: (currentUserPoint >= coupon.cost)
                            ? Color(0xff74e39a)
                            : Color(0xfff5f5f5),
                        child: Text("使う"),
                        onPressed: () {
                          if (currentUserPoint >= coupon.cost) {
                            coupon.couponStatus = CouponStatusType.used;

                            BuildContext context3;
                            showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) {
                                  context3 = _;
                                  return Dialogs(
                                      child: Column(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              icon: Icon(Icons.close),
                                              onPressed: () {
                                                Navigator.of(context2).pop();
                                                Navigator.of(context3).pop();
                                              },
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: FractionallySizedBox(
                                            heightFactor: 0.7,
                                            child: Image.asset(coupon.codeURL,
                                                fit: BoxFit.fill),
                                          )),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 7,
                                              child: Container(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  SizedBox(height: 30),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                          "この画面をお店の方に見せてください。",
                                                          textAlign: TextAlign
                                                              .center)),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        "【注意事項】",
                                                        style: TextStyle(
                                                            fontSize: 36),
                                                      )),
                                                  Expanded(
                                                      flex: 6,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                            "本画面を閉じると、\n本クーポンは自動的に使用済みになります。",
                                                            style: TextStyle(
                                                                fontSize: 24),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ))),
                                                ],
                                              )),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ],
                                  ));
                                });

                            ref.read(currentUserPointProvider.notifier).state -=
                                coupon.cost;
                          } else {
                            null;
                          }
                        },
                      ),
                    ),
                  ],
                ));
              });
        case CouponStatusType.published:
          BuildContext context2;
          return showDialog<void>(
              context: context,
              builder: (_) {
                context2 = _;
                return Dialogs(
                    child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.of(context2).pop(),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Image.asset(coupon.imageURL, fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 7,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text("${coupon.description}"),
                              )),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                    "ご利用は有効期限内に1度限りです。使用済みのクーポンを利用することはできません。"),
                              )),
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: greenButton(
                        color: (currentUserPoint >= coupon.cost)
                            ? Color(0xff74e39a)
                            : Color(0xfff5f5f5),
                        child: Text("交換する"),
                        onPressed: () {
                          if (currentUserPoint >= coupon.cost) {
                            coupon.couponStatus = CouponStatusType.gained;

                            BuildContext context3;
                            showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) {
                                  context3 = _;
                                  return Dialogs(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, right: 15, left: 15),
                                          child: Image.asset(coupon.imageURL,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 60,
                                                      right: 20,
                                                      left: 20),
                                                  child: Text(
                                                    "交換しました！",
                                                    style:
                                                        TextStyle(fontSize: 32),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20,
                                                      right: 20,
                                                      left: 20),
                                                  child: Text(
                                                    "所持ポイント",
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20,
                                                    right: 20,
                                                    left: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("${currentUserPoint}",
                                                        style: TextStyle(
                                                            fontSize: 32)),
                                                    Icon(Icons.arrow_right_alt),
                                                    Text(
                                                        "${currentUserPoint - coupon.cost}",
                                                        style: TextStyle(
                                                            fontSize: 32)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20, left: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    closeButton(
                                                      child: Text("閉じる"),
                                                      onPressed: () {
                                                        Navigator.of(context3)
                                                            .pop();
                                                        Navigator.of(context2)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ],
                                  ));
                                });

                            ref.read(currentUserPointProvider.notifier).state -=
                                coupon.cost;
                          } else {
                            null;
                          }
                        },
                      ),
                    ),
                  ],
                ));
              });
        case CouponStatusType.unpublished:
          return showDialog<void>(
              context: context,
              builder: (_) {
                return Dialogs(child: Container(color: Colors.white));
              });
      }
    }

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
                    color: coupon.couponStatus == CouponStatusType.used
                        ? Color(0xffeeeeee)
                        : Color(0xffC8E6C9),
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
                            child: greenButton(
                              child:
                                  coupon.couponStatus == CouponStatusType.used
                                      ? Text("使用済み")
                                      : Text("詳細"),
                              color:
                                  coupon.couponStatus == CouponStatusType.used
                                      ? Color(0xfff5f5f5)
                                      : Color(0xff74e39a),
                              onPressed: generateButtonPressed,
                            ))
                      ],
                    )),
              )),
        ),
      ],
    );
  }
}
