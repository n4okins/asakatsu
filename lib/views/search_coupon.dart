import 'package:asakatsu/components/coupon_card.dart';
import 'package:asakatsu/model/coupon.dart';
import 'package:asakatsu/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCouponPage extends ConsumerStatefulWidget {
  const SearchCouponPage({super.key});

  @override
  ConsumerState<SearchCouponPage> createState() => _SearchCouponPageState();
}

class _SearchCouponPageState extends ConsumerState<SearchCouponPage> {
  @override
  Widget build(BuildContext context) {
    final searchWord = ref.watch(searchWordProvider);
    final currentDisplayCoupon = ref.watch(currentDisplayCouponProvider);
    final currentUserPoint = ref.watch(currentUserPointProvider);

    final allCoupon = ref.read(allCouponProvider.notifier);
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
            flex: 5,
            child: Container(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: Scrollbar(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top:10, left: 30, right: 30, bottom: 20),
                    child: Column(
                  children: [
                    currentDisplayCoupon == null ? Container() : Image.asset(currentDisplayCoupon.imageURL),
                    currentDisplayCoupon == null ? Container() : Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                      "${currentDisplayCoupon.description}",
                      style: TextStyle(fontSize: 14),
                    ))
                  ],
                )),
              )),
            )),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 48),
            child: Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36),
                            borderSide:
                                BorderSide(width: 16, color: Colors.black45)),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: "検索",
                        fillColor: Colors.white70),
                    onChanged: (newValue) {
                      ref.read(searchWordProvider.notifier).state = newValue;
                    },
                  ),
                )),
          ),
          Expanded(
              flex: 5,
              child: Scrollbar(
                child: SingleChildScrollView(
                  primary: true,
                  child: Column(
                    children: [
                      for(final cp in allCoupon.state.where((c) => (c.couponStatus == CouponStatusType.published && c.description.contains(searchWord))))
                        InkWell(
                          child: CouponCard(coupon: cp),
                          onTap: () {
                            ref.read(currentDisplayCouponProvider.notifier).state = cp;
                          },
                        )

                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
