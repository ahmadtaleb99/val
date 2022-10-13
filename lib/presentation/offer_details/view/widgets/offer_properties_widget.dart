import 'package:flutter/material.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class OfferProperties extends StatelessWidget {

  final List<OfferPropertyViewObject> properties;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...properties.map((property) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  Expanded(flex:2,child: Text(property.label)),
                  Expanded(child: Text(property.value)),
                ],
              ),
            ),
            Divider(color: ColorManager.hintColor,),
          ],
        ))

      ],
    );
  }

  const OfferProperties({
    required this.properties,
  });
}


class OfferPropertyViewObject{
 final String label;
  final String value;

  OfferPropertyViewObject({
    required this.label,
    required this.value,
  });
}