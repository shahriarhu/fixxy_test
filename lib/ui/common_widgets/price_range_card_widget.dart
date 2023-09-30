import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class PriceRangeCardWidget extends StatelessWidget {
  const PriceRangeCardWidget({
    super.key,
    required this.startValue,
    required this.endValue,
  });

  final int startValue;
  final int endValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: UIHelper.deviceWidth(context) * 0.16,
          width: UIHelper.deviceWidth(context) * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kTextSecondaryColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: UIHelper.responsiveMediumPadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Minimum'),
                Text(
                  '\$$startValue',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 2,
          width: UIHelper.responsiveBigSpacing(context),
          color: kTextSecondaryColor,
        ),
        const Spacer(),
        Container(
          height: UIHelper.deviceWidth(context) * 0.16,
          width: UIHelper.deviceWidth(context) * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kTextSecondaryColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: UIHelper.responsiveMediumPadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Minimum'),
                Text(
                  '\$$endValue',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
