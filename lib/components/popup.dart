import 'package:asakatsu/components/buttons.dart';
import 'package:asakatsu/model/coupon.dart';
import 'package:flutter/material.dart';

Future popUpBase(
  context, {
  required Widget child,
  required onApproved,
  required bool barrierDismissible,
}) async {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: child,
        );
      });
}

Future boxPopUp(
  context, {
  required Widget child,
  heightFactor = 0.8,
  widthFactor = 1.0,
}) async {
  return popUpBase(context,
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: child,
      ),
      onApproved: () => {},
      barrierDismissible: true);
}

// Future PopUp(context){
// }) async {
//   return boxPopUp(context,)
//}

Future couponInfoPopUp(
  context, {
  required Coupon coupon,
}) async {
  return boxPopUp(context,
    heightFactor: 0.9,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.white,),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Image.asset(coupon.codeURL, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${coupon.description}")
                ],
              )
            ),
          ),
          Expanded(
            flex: 1,
            child: MyButton(
                child: Text("使う"),
                onPressed: () => {},
              buttonheight: 35,
              ),
          ),
        ],
      ));
}

Future loginPopUp(context, {required int loginNum}) async {
  return boxPopUp(context,
      child: Container(
        child: Column(
          children: [
            Expanded(flex: 1, child: Text("$loginNum日連続ログイン中！")),
            Expanded(flex: 5, child: Text("$loginNum日連続ログイン中！")),
            Expanded(flex: 3, child: Text("$loginNum日連続ログイン中！")),
            Expanded(flex: 1, child: Text("$loginNum日連続ログイン中！")),
          ],
        ),
      ));
}
