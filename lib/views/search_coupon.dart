import 'package:asakatsu/components/coupon_card.dart';
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
          Expanded(
            flex: 4,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '検索',
                  hintStyle: TextStyle(fontSize: 32)),
              onChanged: (newValue) {
                ref.read(searchWordProvider.notifier).state = newValue;
              },
            ),
          ),
          Expanded(
              flex: 6,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      CouponCard(
                        couponID: "coupon2022",
                        imageURL: "server/images/default.jpg",
                      ),
                      CouponCard(
                        couponID: "coupon2022",
                        imageURL: "server/images/001.jpg",
                      ),
                      CouponCard(
                        couponID: "coupon2022",
                        imageURL: "server/images/002.jpg",
                      ),
                      CouponCard(
                        couponID: "coupon2022",
                        imageURL: "server/images/003.jpg",
                      ),
                    ],
                  ),
                ),
              )
            )
        ]),
      ),
    );
  }
}
