

import 'package:flutter/cupertino.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
        fontFamily: FontConstants.fontFamily
    );
}


    TextStyle getRegularStyle ( {double fontSize = FontSize.s12 ,required  Color color}){
                return _getTextStyle(fontSize, FontWeightManager.regular, color);
    }


    TextStyle getBoldStyle ( {double fontSize = FontSize.s18 ,required  Color color}){
      return _getTextStyle(fontSize, FontWeightManager.bold, color);
    }

    TextStyle getMediumStyle ( {double fontSize = FontSize.s16 ,required  Color color}){
      return _getTextStyle(fontSize, FontWeightManager.medium, color);
    }

    TextStyle getSemiBoldStyle ( {double fontSize = FontSize.s12 ,required  Color color}){
      return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
    }

    TextStyle getLightStyle ( {double fontSize = FontSize.s12 ,required  Color color}){
      return _getTextStyle(fontSize, FontWeightManager.light, color);
    }

