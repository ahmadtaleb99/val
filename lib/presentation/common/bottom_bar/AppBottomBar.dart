import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:val/presentation/main/cubit/main_cubit.dart';
import 'package:val/presentation/resources/color_manager.dart';

class AppBottomBarItem  {
  const AppBottomBarItem({Key? key, required this.label, required this.icon});
  final String label;
  final String icon;

}

class AppBottomBar extends StatelessWidget {
  final List<AppBottomBarItem> items;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey[400]!, blurRadius: 11,
            offset: const Offset(3, 3),
            spreadRadius: 1.1,)]),
      child: BottomAppBar(

        elevation: 55,
        child: BlocSelector<MainCubit, MainState, int>(
          selector: (state) => state.currentPageIndex,
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.only(top:  12.0.h,bottom: 4.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...List.generate(
                      2,
                          (index) => Expanded(
                            child: InkWell(
                              onTap: () => onTap?.call(index),
                              child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              SvgPicture.asset(
                                items[index].icon,
                                color: state == index
                                    ? ColorManager.primary
                                    : ColorManager.grey,
                                height: 26.h,

                              ),
                              SizedBox(height: 6.h,),
                              Text(
                                items[index].label,
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                              ],
                            ),
                            ),
                          )),

                  Spacer(),
                  if (items.length > 3)
                    ...List.generate(
                        2,
                            (index) => Expanded(
                              child: InkWell(
                                onTap: () => onTap?.call(index + 2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(

                                      items[index + 2].icon,
                                      color: state == index + 2
                                          ? ColorManager.primary
                                          : ColorManager.grey,
                                      height: 23.h,
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Text(
                                      items[index + 2].label,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    )
                                  ],
                                ),
                              ),
                            )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  const AppBottomBar({
    required this.items,
    this.onTap,
  });
}
