import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_delivery/constants/app_colors.dart';
import 'package:mystery_delivery/custom_widgets/custom_textfield.dart';
import 'package:mystery_delivery/custom_widgets/custom_widgets.dart';
import 'package:mystery_delivery/screen/home_screen.dart';

import '../utils/util_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passcodeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, bottom: 10.0.h),
        child: Column(
          children: [
            mysteryText(),
            entryField('Email', emailCtrl),
            verticalBox(height: 20.0.h),
            entryField('Password', passcodeCtrl, isPasscode: true),
            verticalBox(height: 5.0),
            forgotPasswordText(),
            Spacer(),
            submitButton(
                text: 'Login',
                buttonColor: AppColors.primaryColor,
                onTap: () {
                  UtilHelper.goToNextNormalPage(context, HomeScreen());
                }),
          ],
        ),
      )),
    );
  }

  forgotPasswordText() => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Forgot password ?',
          style: normalTextStyle(fontSize: 13.sp, color: AppColors.primaryColor),
        ),
      );

  mysteryText() => Text(
        'Mystery \nDelivery',
        style: normalTextStyle(fontSize: 30.sp),
      );

  entryField(String text, TextEditingController ctrl, {bool isPasscode = false}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: normalTextStyle(),
          ),
          verticalBox(height: 5.0),
          CustomTextField(
            controller: ctrl,
            showBorder: true,
            isObsecure: isPasscode,
          ),
        ],
      );
}
