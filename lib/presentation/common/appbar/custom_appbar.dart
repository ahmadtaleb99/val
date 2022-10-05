import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/common/search_text_field.dart';
import 'package:val/presentation/resources/assets_manager.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const CustomAppBar ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(

        icon: SvgPicture.asset(ImageAssets.drawerIcon,width: 20.w,height: 20.h,),
        onPressed: (){
          Scaffold.of(context).openDrawer();
        },

      ),
      title: const SearchTextField(),
      actions: [
        IconButton(

          icon: SvgPicture.asset(ImageAssets.drawerIcon,width: 20.w,height: 20.h,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },

        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
