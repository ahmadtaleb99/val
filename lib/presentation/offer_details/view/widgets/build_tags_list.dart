import 'package:flutter/material.dart';
import 'package:val/presentation/common/custom_chip/custom_chip.dart';
import 'package:val/presentation/resources/values_manager.dart';

class BuildTagsList extends StatelessWidget {
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags.map((tag) => Padding(
        padding: const EdgeInsets.all(AppPadding.p4),
        child: CustomChip(text: tag),
      )).toList(),
    );
  }

  const BuildTagsList({
    required this.tags,
  });
}
