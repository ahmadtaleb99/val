import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/buttons/custom_button_widget.dart';
import 'package:val/presentation/common/drawer/drawer.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';
import 'package:val/presentation/welcome_screen/view/widgets/choose_Interest_widget.dart';
import 'package:val/presentation/welcome_screen/view/widgets/choose_location_widget.dart';
import 'package:val/presentation/welcome_screen/view/widgets/skip_button.dart';
import 'dart:ui' as ui;


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = ColorManager.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.9939071,size.height*0.0049467);
    path0.quadraticBezierTo(size.width*0.2495355,size.height*0.0049467,size.width*0.0006831,size.height*0.0049467);
    path0.quadraticBezierTo(size.width*0.0077596,size.height*0.6420000,size.width*0.0102459,size.height*0.8555467);
    path0.quadraticBezierTo(size.width*0.6178689,size.height*0.9071467,size.width*0.9939071,size.height*0.7675467);
    path0.quadraticBezierTo(size.width*0.9948087,size.height*0.5770400,size.width*0.9939071,size.height*0.0049467);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () => Scaffold.of(context).openDrawer()
          );
        }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Padding(
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
          ],
        ),
      ),
    );
  }
}






class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("First Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, createRoute()),
      ),
      body: Center(),
    );
  }

}

Route createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 333),
    reverseTransitionDuration: Duration(milliseconds: 333),
    opaque: false,
    barrierDismissible: false,
    pageBuilder: (context, animation, secondaryAnimation) => AppDrawer(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var screenSize = MediaQuery.of(context).size;
      Offset center = Offset(screenSize.width - 40, screenSize.height - 40);
      double beginRadius = 0.0;
      double endRadius = screenSize.height * 1.2;

      var tween = Tween(begin: beginRadius, end: endRadius);
      var radiusTweenAnimation = animation.drive(tween).value;

      return ClipPath(
        clipper:
        CircleRevealClipper(radius: radiusTweenAnimation, center: center),
        child: child,
      );
    },
  );
}



class CircleRevealClipper extends CustomClipper<Path> {
  final Offset  center;
  final double radius;

  CircleRevealClipper({required this.center,required this.radius});

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(radius: radius, center: center));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}