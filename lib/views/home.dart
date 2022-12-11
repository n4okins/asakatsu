import 'package:asakatsu/components/buttons.dart';
import 'package:asakatsu/components/coupon_card.dart';
import 'package:asakatsu/components/popup.dart';
import 'package:asakatsu/model/coupon.dart';
import 'package:asakatsu/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isLoading = true;
  int loginPoint = 0;
  final Random rndSeed = Random();

  Future<void> _showDialog(BuildContext context) async {
    final shownLogin = ref.read(shownLoginProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!shownLogin) {
        ref.read(shownLoginProvider.notifier).state = true;
        BuildContext context2;
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)).then((_) {
                    if (isLoading) {
                      loginPoint = rndSeed.nextInt(5) + 1;
                      ref.read(currentUserPointProvider.notifier).state +=
                          loginPoint;
                      debugPrint("${loginPoint}");
                    }
                    ;
                    isLoading = false;
                  }),
                  builder: (context, snapshot) {
                    context2 = _;
                    return Dialogs(
                        child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "8日連続ログイン中！",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24),
                              ),
                            )),
                        Expanded(
                          flex: 7,
                          child: Container(
                            child: Image.asset("server/animations/omikuji.gif"),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Container(
                                alignment: Alignment.center,
                                transform:
                                    Matrix4.translationValues(16, 0.0, 0.0),
                                child: !isLoading
                                    ? Text(
                                        " ${loginPoint} pt獲得 ！",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 48),
                                      )
                                    : null)),
                        Expanded(
                            flex: 2,
                            child: !isLoading
                                ? closeButton(
                                    child: Text("閉じる"),
                                    onPressed: () {
                                      Navigator.of(context2).pop();
                                    })
                                : Container()),
                      ],
                    ));
                  });
            });
      } else {
        () => {};
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUserPoint = ref.watch(currentUserPointProvider);
    final allCoupon = ref.read(allCouponProvider.notifier);
    return FutureBuilder(
        future: _showDialog(context),
        builder: (context, snapshot) => MaterialApp(
              home: Scaffold(
                  body: Column(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              child: FractionallySizedBox(
                                widthFactor: 0.9,
                                heightFactor: 1,
                                child: Container(
                                    width: 345,
                                    height: 267,
                                    color: const Color(0xffA9F1F6),
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 40, right: 40),
                                                child: Container(
                                                  height: 144,
                                                  color:
                                                      const Color(0xfffdfdfd),
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                          height: 20),
                                                      const Text("あなたのポイント"),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(width: 10),
                                                          Text(
                                                              "$currentUserPoint"
                                                                  .padLeft(6),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      64.0)),
                                                          SizedBox(width: 10),
                                                          Text("pt",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      32.0)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                transform:
                                                    Matrix4.translationValues(
                                                        0.0, 64, 0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: const [
                                                    Text("連続ログイン",
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            height: -1.75)),
                                                    SizedBox(width: 10),
                                                    Text("8",
                                                        style: TextStyle(
                                                            fontSize: 48.0,
                                                            height: -0.5)),
                                                    SizedBox(width: 10),
                                                    Text("日目",
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            height: -1.75)),
                                                    SizedBox(width: 20),
                                                  ],
                                                )),
                                          ],
                                        ))),
                              ),
                            )))),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          primary: true,
                          child: Column(
                            children: [
                              for (final cp in allCoupon.state.where((c) =>
                                  (c.couponStatus == CouponStatusType.gained)))
                                CouponCard(coupon: cp)
                            ],
                          ),
                        ),
                      ),
                    ))
              ])),
            ));
  }
}
