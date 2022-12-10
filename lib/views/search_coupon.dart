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
                            "123",
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
                child: Container(
                    child: Column(
                  children: [
                    Image.asset("server/images/default.jpg"),
                    Text(
                      "aaaaaaaaaaa\naaaaaaaaaaa\naaaaaaaaaaa\naaaaaaaaaaa\naaaaaaaaaaa\naaaaaaaaaaa\naaaaaaaaaaa\n",
                      style: TextStyle(fontSize: 64),
                    )
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
                      CouponCard(coupon: sampleCoupons[0]),
                      CouponCard(coupon: sampleCoupons[1]),
                      CouponCard(coupon: sampleCoupons[2]),
                      CouponCard(coupon: sampleCoupons[3]),
                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
