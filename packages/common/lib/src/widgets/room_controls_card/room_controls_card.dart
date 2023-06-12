import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

class RoomControlCard extends StatelessWidget {
  const RoomControlCard({
    super.key,
    required this.image,
    required this.onCardTap,
    required this.serviceName,
    this.textStyle,
    this.buttonsWidget,
  });

  final Widget image;
  final VoidCallback onCardTap;
  final String serviceName;
  final TextStyle? textStyle;
  final Widget? buttonsWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      focusColor: theme.zigHotelsColors.teal,
      onTap: onCardTap,
      child: Card(
        color: theme.zigHotelsColors.onBackground,
        elevation: 20,
        shape: Border.all(
          color: theme.zigHotelsColors.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Space(Dimensions.smallest),
            Text(
              serviceName,
              style: textStyle ??
                  theme.textTheme.titleLarge?.copyWith(
                    color: theme.zigHotelsColors.background,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const Space(Dimensions.smaller),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: image,
              ),
            ),
            const Space(Dimensions.smaller),
            buttonsWidget ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
