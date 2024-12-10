import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/sp_keys.dart';
import 'shared_preference/sp_manager.dart';

class UtilHelper {
  static double height(BuildContext context, double value) {
    MediaQueryData queryData = MediaQuery.of(context);
    return queryData.size.height / 100.0 * value;
  }

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

  static goToNextWithClearAllPage(BuildContext context, page) =>
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => page), ModalRoute.withName('/'));

  static goBack(BuildContext context) => Navigator.of(context).pop(true);

  static goToNextWithClearPage(BuildContext context, page, {rootNavigator = false}) =>
      Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  // static showToast(String? msg, {Color? color}) {
  //   Fluttertoast.showToast(
  //       msg: msg ?? '',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: color ?? AppColors.green,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  static getPhone(String phone) {
    if (phone == '' || phone.isEmpty) {
      return '';
    }
    return phone.substring(phone.length - 10);
  }

  static getRupee() {
    return '\u{20B9}';
  }

  static showDialogueBox(context, dialogue, {bool? dismiss}) {
    return showDialog(
      barrierDismissible: dismiss ?? true,
      context: context,
      builder: (_) => dialogue,
    );
  }

  static searchAndGetList(parentList, searchList) {
    List<String> selectedId = [];
    parentList.forEach((element) {
      searchList.forEach((childElement) {
        if (element.title == childElement) {
          selectedId.add(' ${element.id}');
        }
      });
    });
    return selectedId.join(',');
  }

  static getAccessToken() {
    String accessToken = SpManager.getString(SpKeys.accessToken);
    print('accessToken: $accessToken');
    var body = {'Authorization': 'Bearer $accessToken'};
    return body;
  }

  static getInt(String? value) {
    return int.tryParse(value ?? '0');
  }

  static showSnackBar(String msg, context) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  // static Future<void> launchUri(url) async {
  //   try {
  //     await launchUrl(Uri.parse(url));
  //   } catch (e) {
  //     print('launchUrl: $e');
  //   }
  // }

  static getInitials(String value) =>
      value.isNotEmpty ? value.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join() : '';
}
