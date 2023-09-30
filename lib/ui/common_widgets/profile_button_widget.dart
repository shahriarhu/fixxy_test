import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key,
    required this.iconData,
    required this.buttonName,
    required this.onTap,
  });

  final IconData iconData;
  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kMainColor,
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                iconData,
                color: kTextMainColor,
              ),
              SizedBox(
                width: UIHelper.responsiveBigSpacing(context),
              ),
              Text(
                buttonName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                color: kTextMainColor,
              ),
            ],
          ),
        ),
        const Divider(
          color: kMainColor,
        ),
      ],
    );
  }
}
