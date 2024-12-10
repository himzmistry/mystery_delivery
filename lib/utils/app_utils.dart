import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';
import '../constants/sp_keys.dart';
import 'shared_preference/sp_manager.dart';


class AppUtils {
  static double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static goToNextNormalPage(BuildContext context, page, {rootNavigator = false}) =>
      Navigator.of(context, rootNavigator: rootNavigator).push(
        MaterialPageRoute(builder: (_) => page),
      );

  static showDialogueBox(context, dialogue) {
    return showDialog(
      context: context,
      builder: (_) => dialogue,
    );
  }
  static goToNextWithClearAllPage(BuildContext context, page) =>
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => page), ModalRoute.withName('/'));

  static goBack(BuildContext context) => Navigator.of(context).pop(true);

  static goToNextWithClearPage(BuildContext context, page, {rootNavigator = false}) =>
      Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  static circularBorder({double? radius}) => Radius.circular(radius ?? 16);

  static showToast(String? msg,BuildContext context, {Color? color}) {
    final snackBar = SnackBar(
      content: Text(msg??''),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static getAccessToken() {
    String accessToken = SpManager.getString(SpKeys.accessToken);
    print('accessToken: $accessToken');
    var body = {'Access-Token': accessToken};
    return body;
  }

  static showFlutterToast(String? msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? AppColors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getRuppee() {
    return '\u{20B9}';
  }


  // static String getStatus(String status) {
  //   switch (status.toLowerCase()) {
  //     case DELIVERY:
  //       return delivered;
  //     case DINE_IN:
  //       return served;
  //     case TAKE_AWAY:
  //       return pickedUp;
  //     default:
  //     // print('status: $status');
  //       return served;
  //   }
  // }
}
