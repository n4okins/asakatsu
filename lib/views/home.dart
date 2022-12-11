import 'package:asakatsu/components/coupon_card.dart';
import 'package:asakatsu/model/coupon.dart';
import 'package:asakatsu/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentUserPoint = ref.watch(currentUserPointProvider);
    final allCoupon = ref.read(allCouponProvider.notifier);

    return MaterialApp(
      home: Scaffold(
          body: Column(children: [
            Expanded(
                flex: 4,
                child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: Container(
                              width: 345,
                              height: 267,
                              color: const Color(0xffA9F1F6),
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          width: 298,
                                          height: 144,
                                          child: Container(
                                            color: const Color(0xfffdfdfd),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 20),
                                                const Text("あなたのポイント"),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(width: 10),
                                                    Text(
                                                        "$currentUserPoint".padLeft(6),
                                                        style: TextStyle(
                                                            fontSize: 64.0
                                                        )
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text("pt",
                                                        style: TextStyle(
                                                            fontSize: 32.0)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                      Container(
                                          transform: Matrix4.translationValues(
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
                          for(final cp in allCoupon.state.where((c) => (c.couponStatus == CouponStatusType.gained)))
                            CouponCard(coupon: cp)
                        ],
                      ),
                    ),
                  ),
                ))
          ])
      ),
    );
  }
}