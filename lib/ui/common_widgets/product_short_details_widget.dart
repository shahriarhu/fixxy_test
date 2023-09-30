import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixxy_test/ui/common_widgets/loading_widget.dart';
import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductShortDetailsWidget extends StatelessWidget {
  const ProductShortDetailsWidget({
    super.key,
    required this.imageUrl,
    required this.isFavorite,
    required this.rating,
    required this.location,
    required this.designerName,
    required this.dateRange,
    required this.cost,
    required this.buildPageIndicator,
    required this.onChange,
  });

  final String imageUrl;
  final bool isFavorite;
  final double rating;
  final String location;
  final String designerName;
  final String dateRange;
  final int cost;
  final List<Widget> buildPageIndicator;
  final Function(int o) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PageView(
                  // controller: PageController(initialPage: 0),
                  onPageChanged: onChange,
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingWidget(
                        size: 32,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: kMainColor,
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingWidget(
                        size: 32,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: kMainColor,
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingWidget(
                        size: 32,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: kMainColor,
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingWidget(
                        size: 32,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: kMainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: UIHelper.responsiveSmallSpacing(context),
                right: UIHelper.responsiveSmallSpacing(context),
                child: SvgPicture.asset(
                  'assets/images/favorite_heart.svg',
                ),
              ),
              Positioned(
                bottom: UIHelper.responsiveSmallSpacing(context),
                child: Row(
                  children: buildPageIndicator,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: UIHelper.responsiveSmallSpacing(context),
        ),
        Row(
          children: [
            Text(
              location,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Icon(
              Icons.star,
              size: UIHelper.responsiveMediumSpacing(context),
            ),
            Text(
              ' $rating',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Text(
          designerName,
        ),
        Text(
          dateRange,
        ),
        Text(
          '\$$cost night',
        ),
        SizedBox(
          height: UIHelper.responsiveExtraBigSpacing(context),
        ),
      ],
    );
  }
}
