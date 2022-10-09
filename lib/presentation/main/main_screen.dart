import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/common/appbar/custom_appbar.dart';
import 'package:val/presentation/common/bottom_bar/AppBottomBar.dart';
import 'package:val/presentation/common/drawer/drawer.dart';
import 'package:val/presentation/main/cubit/main_cubit.dart';
import 'package:val/presentation/main/pages/home/view/home_page.dart';
import 'package:val/presentation/main/widgets/add_offer_button.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


  final _pagesList = const [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: BlocSelector<MainCubit, MainState, int>(
          selector: (state) => state.currentPageIndex,
          builder: (context, state) => _pagesList[state],
        ),
      ),
      floatingActionButton: const AddOfferButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomBar(
        onTap: (index) => context.read<MainCubit>().changePage(index),
        items: const [
          AppBottomBarItem(
              label: AppStrings.home, icon: ImageAssets.bottomBarHome),
          AppBottomBarItem(
              label: AppStrings.myInterests, icon: ImageAssets.bottomBarHome),
          AppBottomBarItem(
              label: AppStrings.history, icon: ImageAssets.bottomBarHistory),
          AppBottomBarItem(
              label: AppStrings.stores, icon: ImageAssets.bottomBarStores),
        ],
      ),
    );
  }


}