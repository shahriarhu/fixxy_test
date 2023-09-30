import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: UIHelper.deviceHeight(context) * 0.16,
        width: UIHelper.deviceWidth(context) * 0.44,
        decoration: BoxDecoration(
          color: isSelected ? kLightMainColor : kScaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? kTextMainColor : kTextSecondaryColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: UIHelper.responsiveMediumPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: UIHelper.responsiveExtraBigSpacing(context) * 1.2,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
