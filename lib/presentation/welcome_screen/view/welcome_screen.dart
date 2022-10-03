import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/buttons/custom_button_widget.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';
import 'package:val/presentation/welcome_screen/view/widgets/choose_Interest_widget.dart';
import 'package:val/presentation/welcome_screen/view/widgets/choose_location_widget.dart';
import 'package:val/presentation/welcome_screen/view/widgets/skip_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p37.w),
          child: Column(
            children: [
              SizedBox(height: 98.h,),
              Image.asset(ImageAssets.logo),
              SizedBox(height: 72.h,),
              Text(AppStrings.welcomeMSg,style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 10.h,),
              Text(AppStrings.welcomeSelectHelperMsg,style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: 53.h,),
              const ChooseLocationWidget(),
              SizedBox(height: 25.h,),
             const  ChooseInterestWidget(),
              SizedBox(height: 135.h,),
              CustomButtonWidget(onPressed: (){},color: ColorManager.secondary, text:  AppStrings.confirm,),
              SizedBox(height: 25.h,),
              SkipButton()


            ],
          ),
        ),
      ),
    );
  }
}
