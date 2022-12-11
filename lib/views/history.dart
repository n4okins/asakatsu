import 'package:asakatsu/components/calendar.dart';
import 'package:asakatsu/components/coupon_card.dart';
import 'package:asakatsu/model/coupon.dart';
import 'package:asakatsu/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final currentUserPoint = ref.watch(currentUserPointProvider);
    return MaterialApp(
      home: Scaffold(
          body: Column(children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 64.0),
          child: Column(
            children: [
              Container(
                  color: Colors.white30,
                  height: 60,
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 40, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "$currentUserPoint",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "pt",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  )),
              Divider(
                height: 2,
                thickness: 2,
                indent: MediaQuery.of(context).size.width * 0.05,
                endIndent: MediaQuery.of(context).size.width * 0.05,
              )
            ],
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
                child: Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: FractionallySizedBox(
                            widthFactor: 0.9,
                            heightFactor: 0.9,
                            child: Container(
                              color: const Color(0xfff5f5f5),
                              child: Calendar(),
                            )))))),
        Expanded(
            flex: 5,
            child: Scrollbar(
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  children: [
                    for (final cp in ref.read(allCouponProvider.notifier).state.where((c) => (c.couponStatus == CouponStatusType.used)))
                      CouponCard(coupon: cp)
                  ],
                ),
              ),
            ))
      ])),
    );
  }
}
