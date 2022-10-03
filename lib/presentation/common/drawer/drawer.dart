import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:val/app/authtication_bloc/authentication_bloc.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
    @override
  void dispose() {

      animationController.reverse();
      animationController.dispose();

      super.dispose();
    }
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return
      CircularRevealAnimation(
        centerAlignment: Alignment.topLeft,
        animation: animation,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(333, 333)
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Drawer(
              backgroundColor: ColorManager.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                    ),
                    child: Image.asset(ImageAssets.logo),
                  ),
                  ElevatedButton(onPressed: () =>     animationController.forward() , child: Text('animate')),
                  ListTile(
                    title: const Text(AppStrings.logout),
                    leading: const Icon(Icons.logout),
                    onTap: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}






//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffeb2a).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*1.242991,size.height*0.6963351),size.width*1.242991,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}