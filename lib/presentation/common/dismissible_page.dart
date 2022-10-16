import 'package:flutter/material.dart';



class DismissiblePage {
  final Widget page;
  final BuildContext context;

  const DismissiblePage({
    required this.page,
    required this.context,
  });


  void show (){
    showModalBottomSheet(
        isScrollControlled : true,
        context: context,
        builder: (_) {
          return DismissiblePageWidget(
            page: page,
          );
        });
  }
}
class DismissiblePageWidget extends StatefulWidget {
  final Widget page;



  @override
  State<DismissiblePageWidget> createState() => _DismissiblePageWidgetState();

  const DismissiblePageWidget({
    required this.page,
  });
}

class _DismissiblePageWidgetState extends State<DismissiblePageWidget> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  @override
  void initState() {


     _animationController = AnimationController(vsync: this);

     _animationController =
         BottomSheet.createAnimationController(this);
     _animationController.duration = Duration(seconds: 3);


    showModalBottomSheet(
        isScrollControlled : true,
        context: context,
        transitionAnimationController :_animationController,
        builder: (_) {
          return widget.page;
        });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
