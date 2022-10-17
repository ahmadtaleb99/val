import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/circular_container.dart';
import 'package:val/presentation/resources/values_manager.dart';

import '../../../resources/color_manager.dart';

class ChatOfferDetails extends StatelessWidget {
  const ChatOfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularContainer(
            image: 'assets/images/img.png', color: ColorManager.lightSecondary),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Perfume',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 20.sp)),
            Text('Beuaty And Skin Care'),
          ],
        )
      ],
    );
  }
}
