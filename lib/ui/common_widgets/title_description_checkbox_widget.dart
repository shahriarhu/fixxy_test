import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class TitleDescriptionCheckboxWidget extends StatelessWidget {
  const TitleDescriptionCheckboxWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isChecked,
    required this.onChange,
  });

  final String title;
  final String description;
  final bool isChecked;
  final Function(bool? d) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: UIHelper.deviceWidth(context) * 0.74,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: kTextMainColor),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Checkbox(
          value: isChecked,
          onChanged: onChange,
          activeColor: kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
