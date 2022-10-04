
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/style_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
      toggleableActiveColor: ColorManager.primary,

    //default font
    fontFamily: FontConstants.fontFamily,



    // cardview theme

    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    //app bar
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white)),


    //divider
    dividerTheme: DividerThemeData(
      color: ColorManager.black,
      thickness: 1,

    ),




    //button  theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
                minimumSize: Size(192.w,45.h),
            textStyle:  getMediumStyle(fontSize: FontSize.s18, color: ColorManager.white),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r6)))),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white, fontSize: FontSize.s17),
      ),

    ),

    // text theme
    textTheme: TextTheme(

        titleMedium: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),


      bodyLarge: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s18),
      bodyMedium: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),


    ),

    //input decoration
    inputDecorationTheme:   InputDecorationTheme( 

      hintStyle: getMediumStyle(color: ColorManager.hintColor,fontSize:FontSize.s18),
        filled: true,
        fillColor: ColorManager.white,
        contentPadding: EdgeInsets.all(AppPadding.p12),
        focusedBorder:OutlineInputBorder(
      

          borderSide: BorderSide(
            color: ColorManager.white,
          ),
          borderRadius: BorderRadius. circular(AppRadius.r6),
        ),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.white,

          ),
          borderRadius: BorderRadius. circular(AppRadius.r6),
        ),
        errorBorder:OutlineInputBorder(

          borderRadius: BorderRadius. circular(AppRadius.r6),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius. circular(AppRadius.r6),
        ) ,
    )
    ,
    // label style


  );
}
