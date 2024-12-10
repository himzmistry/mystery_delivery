import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';

normalTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: fontSize ?? 15.sp,
          color: color ?? AppColors.black,
          fontWeight: fontWeight ?? FontWeight.normal),
    );

verticalDivider({double? height, Color? color}) => Container(
      height: height ?? 40.0,
      width: 2.0,
      color: color ?? AppColors.black,
    );

horizontalDivider({double? width, Color? color}) => Container(
      width: width ?? 40.0,
      height: 1.0,
      color: color ?? AppColors.black,
    );

horizontalBox({double? width}) => SizedBox(
      width: width ?? 10.0,
    );

verticalBox({double? height}) => SizedBox(
      height: height ?? 10.0,
    );

borderRadius({double? radius}) => BorderRadius.circular(radius ?? 4.0);

submitButton(
        {Key? key,
        required String text,
        Function()? onTap,
        EdgeInsets? padding,
        Color? buttonColor,
        Color? borderColor,
        double? borderWidth,
        double? borderRadius,
        double? height,
        double? width,
        TextStyle? textStyle,
        List<BoxShadow>? boxShadow}) =>
    InkWell(
      onTap: onTap,
      key: key,
      child: Container(
        height: height ?? 48,
        width: width ?? 200,
        alignment: Alignment.center,
        // padding: padding ?? EdgeInsets.symmetric(horizontal: 22.5, vertical: 5.5),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.grey,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: borderColor != null ? Border.all(color: borderColor, width: borderWidth ?? 1) : null,
          boxShadow: boxShadow,
        ),
        child: Text(
          text,
          style: textStyle ?? normalTextStyle(color: AppColors.white),
        ),
      ),
    );

boxShadow({double? blurRadius, Offset? offset}) => [
      BoxShadow(color: Colors.grey, blurRadius: blurRadius ?? 5.0, offset: offset ?? Offset(0, 0)),
    ];

cancelContainer() => Transform.translate(
      // top:10,
      offset: Offset(-5, 10),
      child: Transform.rotate(
        angle: 35,
        child: Container(
          height: 1.5,
          width: 15,
          color: AppColors.red,
        ),
      ),
    );

emptyBox() => const SizedBox.shrink();

Widget customInkWell({onTap, child}) => InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );

roundedContainer(onTap,
        {required Color bgColor,
        required Color textColor,
        required String text,
        required FontWeight? fontWeight,
        fontSize,
        double? width}) =>
    customInkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 110.w,
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(30.r)),
        child: Text(
          text,
          style: normalTextStyle(
              fontSize: fontSize ?? 14.sp, fontWeight: fontWeight ?? FontWeight.normal, color: textColor),
        ),
      ),
    );

Widget customImageIcon(onTap, {String? icon, double? height, double? width, padding, Color? bgColor}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 40,
        height: height ?? 40,
        padding: padding ?? const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: bgColor ?? AppColors.cancelKotTabColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Image.asset(
          icon ?? AppImages.icUser,
          width: 18,
          height: 18,
        ),
      ),
    );