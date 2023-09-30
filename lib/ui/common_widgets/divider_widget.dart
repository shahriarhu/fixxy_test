import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    this.isColor = true,
  });

  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isColor)
          Divider(
            height: UIHelper.responsiveExtraBigSpacing(context),
            thickness: 1,
            color: kLightMainColor,
          ),
        SizedBox(
          height: UIHelper.responsiveMediumSpacing(context),
        ),
      ],
    );
  }
}
