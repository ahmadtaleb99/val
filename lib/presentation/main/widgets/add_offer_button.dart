import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';

class AddOfferButton extends StatelessWidget {
  const AddOfferButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 17.h,),
        FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: SvgPicture.asset(ImageAssets.addIcon),

        ),
          SizedBox(height: 15.h,),
          Text(AppStrings.addOffer,style: Theme.of(context).textTheme.titleSmall,)
      ],
    );
  }
}
