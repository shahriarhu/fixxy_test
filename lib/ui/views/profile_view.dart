import 'package:fixxy_test/core/view_models/profile_view_model.dart';
import 'package:fixxy_test/ui/common_widgets/divider_widget.dart';
import 'package:fixxy_test/ui/common_widgets/profile_button_widget.dart';
import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:fixxy_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(UIHelper.responsiveBigPadding(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: UIHelper.responsiveExtraBigSpacing(context),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/user_icon.png',
                        height: UIHelper.deviceWidth(context) * 0.16,
                        width: UIHelper.deviceWidth(context) * 0.16,
                      ),
                      SizedBox(
                        width: UIHelper.responsiveMediumSpacing(context),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Md Shahriar',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Show profile',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                        ),
                      ),
                    ],
                  ),
                  const DividerWidget(),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: kScaffoldBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.all(UIHelper.responsiveMediumPadding(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: UIHelper.deviceWidth(context) * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Airbnb your place',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'It\'s simple to get set up and start earning.',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/building_icon.png',
                            height: UIHelper.deviceWidth(context) * 0.24,
                            width: UIHelper.deviceWidth(context) * 0.24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: UIHelper.responsiveExtraBigSpacing(context),
                  ),

                  /// Settings

                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const DividerWidget(isColor: false),
                  ProfileButtonWidget(
                    iconData: Icons.account_circle_outlined,
                    buttonName: 'Personal information',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.admin_panel_settings_outlined,
                    buttonName: 'Login & security',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.wallet,
                    buttonName: 'Payments and payouts',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.settings_outlined,
                    buttonName: 'Accessibility',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.description_outlined,
                    buttonName: 'Taxes',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: UIHelper.responsiveExtraBigSpacing(context),
                  ),

                  /// Hosting

                  Text(
                    'Hosting',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: UIHelper.responsiveExtraBigSpacing(context),
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.other_houses_outlined,
                    buttonName: 'List you space',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.real_estate_agent_outlined,
                    buttonName: 'Learn about hosting',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: UIHelper.responsiveExtraBigSpacing(context),
                  ),

                  /// Support

                  Text(
                    'Support',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const DividerWidget(isColor: false),
                  ProfileButtonWidget(
                    iconData: Icons.help_outline,
                    buttonName: 'Visit the help center',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.health_and_safety_outlined,
                    buttonName: 'Get help with safety issue',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.support_agent_outlined,
                    buttonName: 'Report a neighbourhood concern',
                    onTap: () {},
                  ),
                  ProfileButtonWidget(
                    iconData: Icons.edit_outlined,
                    buttonName: 'Give us feedback',
                    onTap: () {},
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: kMainColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Log out',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
