
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/style_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {


  return ThemeData(
    //main colors
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.primary,
    backgroundColor: ColorManager.white,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,
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
        color: ColorManager.white ,
        elevation: 0,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white)),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedLabelStyle: getRegularStyle(color: ColorManager.grey,fontSize: 10),
        selectedLabelStyle: getRegularStyle(color: ColorManager.primary,fontSize: 10),
      selectedItemColor:    ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        elevation: 50,
        backgroundColor: Colors.blue,
        showUnselectedLabels: true
    ),


    //divider
    dividerTheme: DividerThemeData(
      color: ColorManager.black,
      thickness: 1,

    ),




    //button  theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),


    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary
    ),

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
        titleSmall: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s10),



        bodyLarge: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s18),
      bodyMedium: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
      bodySmall: getLightStyle(color:  ColorManager.black,),

    ),

    //input decoration
    inputDecorationTheme:   InputDecorationTheme( 

      hintStyle: getMediumStyle(color: ColorManager.hintColor,fontSize:FontSize.s18),
        filled: true,
        fillColor: ColorManager.white,
        contentPadding: const EdgeInsets.all(AppPadding.p12),
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
