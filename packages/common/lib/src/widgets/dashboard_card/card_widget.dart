import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.onCardTap,
    required this.serviceName,
    this.textStyle,
  });

  final Widget image;
  final VoidCallback onCardTap;
  final String serviceName;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onCardTap,
      child: Card(
        elevation: 20,
        shadowColor: theme.zigHotelsColors.teal,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: image,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    theme.zigHotelsColors.onBackground.withOpacity(.68),
                    theme.zigHotelsColors.onBackground.withOpacity(.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Text(
                serviceName,
                style: textStyle ??
                    theme.textTheme.headlineMedium?.copyWith(
                      color: theme.zigHotelsColors.background,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
