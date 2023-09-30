import 'package:fixxy_test/core/enums/view_state.dart';
import 'package:fixxy_test/core/view_models/explore_view_model.dart';
import 'package:fixxy_test/ui/common_widgets/divider_widget.dart';
import 'package:fixxy_test/ui/common_widgets/loading_widget.dart';
import 'package:fixxy_test/ui/common_widgets/price_range_card_widget.dart';
import 'package:fixxy_test/ui/common_widgets/product_short_details_widget.dart';
import 'package:fixxy_test/ui/common_widgets/property_card_widget.dart';
import 'package:fixxy_test/ui/common_widgets/title_description_checkbox_widget.dart';
import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:fixxy_test/ui/shared/ui_helpers.dart';
import 'package:fixxy_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreViewModel>(
      onModelReady: (model) async {
        model.scrollController.addListener(model.scrollListener);
        await model.getHouse();
      },
      builder: (context, model, child) => DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: kScaffoldBackgroundColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(UIHelper.deviceHeight(context) * 0.1),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(UIHelper.responsiveBigPadding(context)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kScaffoldBackgroundColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(
                          UIHelper.responsiveMediumPadding(context),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: kTextMainColor,
                            ),
                            SizedBox(
                              width: UIHelper.responsiveMediumSpacing(context),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Where to?',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  'Anywhere • Any week • Add guests',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                /// Filter UI Start

                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, setState) => Scaffold(
                                      bottomNavigationBar: Card(
                                        elevation: 4,
                                        color: kScaffoldBackgroundColor,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: UIHelper.responsiveBigPadding(context),
                                            vertical: UIHelper.responsiveMediumPadding(context),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: kMainColor,
                                                ),
                                                onPressed: () async {
                                                  model.resetFilter();
                                                  model.resetPageNumber();
                                                  await model.getHouse();
                                                  if (context.mounted) {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  'Clear all',
                                                  style: Theme.of(context).textTheme.labelLarge,
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: kTextMainColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  model.resetPageNumber();
                                                  await model.getHouse();
                                                  if (context.mounted) {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  'Search',
                                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                        color: kScaffoldBackgroundColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      body: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: (MediaQuery.of(context).padding.top + kToolbarHeight) * 0.6,
                                              width: double.infinity,
                                              color: Colors.transparent,
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                ),
                                                color: kScaffoldBackgroundColor,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: UIHelper.responsiveBigPadding(context),
                                                      left: UIHelper.responsiveBigPadding(context),
                                                      right: UIHelper.responsiveBigPadding(context),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          icon: const Icon(Icons.close),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                        ),
                                                        SizedBox(
                                                          width: UIHelper.responsiveMediumSpacing(context),
                                                        ),
                                                        Text(
                                                          'Filter',
                                                          style: Theme.of(context).textTheme.bodyLarge,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 1,
                                                    color: kLightMainColor,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: UIHelper.responsiveBigPadding(context),
                                                      left: UIHelper.responsiveBigPadding(context),
                                                      right: UIHelper.responsiveBigPadding(context),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Price range',
                                                          style: Theme.of(context).textTheme.bodyLarge,
                                                        ),
                                                        const Text('The average nightly price is \$240'),
                                                        Container(),
                                                        RangeSlider(
                                                          min: 10,
                                                          max: 1000,
                                                          activeColor: kMainColor,
                                                          inactiveColor: kLightMainColor,
                                                          values: model.rangeValues,
                                                          onChanged: (RangeValues newRange) {
                                                            setState(() => model.rangeValues = newRange);
                                                          },
                                                        ),
                                                        PriceRangeCardWidget(
                                                            startValue: (model.rangeValues.start).toInt(),
                                                            endValue: (model.rangeValues.end).toInt()),
                                                        const DividerWidget(),
                                                        Text(
                                                          'Type of Place',
                                                          style: Theme.of(context).textTheme.bodyLarge,
                                                        ),
                                                        const DividerWidget(
                                                          isColor: false,
                                                        ),
                                                        TitleDescriptionCheckboxWidget(
                                                          title: 'Entire Place',
                                                          description: 'A place all to yourself',
                                                          isChecked: model.isEntirePlaceSelected,
                                                          onChange: (value) {
                                                            setState(() => model.toggleIsEntirePlaceSelected());
                                                          },
                                                        ),
                                                        TitleDescriptionCheckboxWidget(
                                                          title: 'Room',
                                                          description: 'A place all to yourself',
                                                          isChecked: model.isRoomSelected,
                                                          onChange: (value) {
                                                            setState(() => model.toggleIsRoomSelected());
                                                          },
                                                        ),
                                                        TitleDescriptionCheckboxWidget(
                                                          title: 'Shared room',
                                                          description: 'A sleeping space and common areas that may be shared',
                                                          isChecked: model.isSharedRoomSelected,
                                                          onChange: (value) {
                                                            setState(() => model.toggleIsSharedRoomSelected());
                                                          },
                                                        ),
                                                        const DividerWidget(),
                                                        Text(
                                                          'Rooms and beds',
                                                          style: Theme.of(context).textTheme.bodyLarge,
                                                        ),
                                                        const DividerWidget(
                                                          isColor: false,
                                                        ),
                                                        const Text('Bedrooms'),
                                                        SizedBox(
                                                          height: UIHelper.deviceHeight(context) * 0.08,
                                                          child: ListView.builder(
                                                            itemCount: 9,
                                                            scrollDirection: Axis.horizontal,
                                                            itemBuilder: (context, index) => Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(() => model.selectedBed = index);
                                                                  },
                                                                  child: AnimatedContainer(
                                                                    duration: const Duration(milliseconds: 600),
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical: UIHelper.responsiveBigPadding(context),
                                                                      horizontal: UIHelper.responsiveBigPadding(context) * 1.6,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      color: model.selectedBed == index
                                                                          ? kTextMainColor
                                                                          : kScaffoldBackgroundColor,
                                                                      borderRadius: BorderRadius.circular(24),
                                                                      border: Border.all(
                                                                        color: model.selectedBed == index
                                                                            ? kTextMainColor
                                                                            : kTextSecondaryColor,
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      index == 0
                                                                          ? 'Any'
                                                                          : index == 8
                                                                              ? '$index+'
                                                                              : '$index',
                                                                      style: TextStyle(
                                                                        color:
                                                                            model.selectedBed == index ? kWhiteColor : kTextSecondaryColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: UIHelper.responsiveMediumSpacing(context),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const DividerWidget(),
                                                        Text(
                                                          'Property Type',
                                                          style: Theme.of(context).textTheme.bodyLarge,
                                                        ),
                                                        const DividerWidget(isColor: false),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            PropertyCardWidget(
                                                              icon: Icons.other_houses_outlined,
                                                              title: 'House',
                                                              isSelected: model.isHouseSelected,
                                                              onTap: () {
                                                                setState(() => model.toggleIsHouseSelected());
                                                              },
                                                            ),
                                                            PropertyCardWidget(
                                                              icon: Icons.apartment_outlined,
                                                              title: 'Apartment',
                                                              isSelected: model.isApartmentSelected,
                                                              onTap: () {
                                                                setState(() => model.toggleIsApartmentSelected());
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                                /// Filter UI End
                              },
                              borderRadius: BorderRadius.circular(8),

                              /// Filter button design

                              child: Container(
                                padding: EdgeInsets.all(UIHelper.responsiveSmallPadding(context)),
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kTextSecondaryColor,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.tune_rounded,
                                  color: kTextMainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Tab bars start

                  TabBar(
                    labelColor: kTextMainColor,
                    unselectedLabelColor: kTextSecondaryColor,
                    isScrollable: true,
                    indicatorColor: kTextMainColor,
                    physics: const BouncingScrollPhysics(),
                    onTap: (index) async {
                      model.selectedCategory = model.categoryList[index];
                      model.resetPageNumber();
                      await model.getHouse();
                    },
                    tabs: [
                      _myTab(
                        Icons.beach_access_outlined,
                        'Beachfront',
                      ),
                      _myTab(
                        Icons.cabin_outlined,
                        'cabin',
                      ),
                      _myTab(
                        Icons.directions_boat_outlined,
                        'boats',
                      ),
                      _myTab(
                        Icons.beach_access_outlined,
                        'Iconic cities',
                      ),
                      _myTab(
                        Icons.wb_twilight_outlined,
                        'Tropical',
                      ),
                      _myTab(
                        Icons.ac_unit_outlined,
                        'Arctic',
                      ),
                      _myTab(
                        Icons.water,
                        'Luxe',
                      ),
                      _myTab(
                        Icons.holiday_village_outlined,
                        'Countryside',
                      ),
                    ],
                  ),

                  /// Tab bars end
                ],
              ),
            ),
          ),

          /// Body UI Start

          body: model.state == ViewState.idle
              ? SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(UIHelper.responsiveBigPadding(context)),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            model.houses.isEmpty
                                ? const Center(
                                    child: Text(
                                      'Noting matched',
                                    ),
                                  )
                                : ListView.builder(
                                    controller: model.scrollController,
                                    itemCount: model.houses.length,
                                    itemBuilder: (context, index) => ProductShortDetailsWidget(
                                      imageUrl: model.houses[index].imageUrl ?? '',
                                      isFavorite: true,
                                      rating: model.houses[index].rating ?? 0.0,
                                      location: model.houses[index].place ?? '',
                                      designerName: model.houses[index].designerName ?? '',
                                      dateRange: model.houses[index].date ?? '',
                                      cost: model.houses[index].price ?? 0,
                                      buildPageIndicator: model.selectedImage == index ? model.buildPageIndicator() : [],
                                      onChange: (int page) {
                                        model.selectedImage = index;
                                        model.changeCurrentPage(page);
                                      },
                                    ),
                                  ),
                            model.houses.isEmpty
                                ? const Center(
                                    child: Text(
                                      'Noting matched',
                                    ),
                                  )
                                : ListView.builder(
                                    controller: model.scrollController,
                                    itemCount: model.houses.length,
                                    itemBuilder: (context, index) => ProductShortDetailsWidget(
                                      imageUrl: model.houses[index].imageUrl ?? '',
                                      isFavorite: true,
                                      rating: model.houses[index].rating ?? 0.0,
                                      location: model.houses[index].place ?? '',
                                      designerName: model.houses[index].designerName ?? '',
                                      dateRange: model.houses[index].date ?? '',
                                      cost: model.houses[index].price ?? 0,
                                      buildPageIndicator: model.selectedImage == index ? model.buildPageIndicator() : [],
                                      onChange: (int page) {
                                        model.changeCurrentPage(page);
                                      },
                                    ),
                                  ),
                            model.houses.isEmpty
                                ? const Center(
                                    child: Text(
                                      'Noting matched',
                                    ),
                                  )
                                : ListView.builder(
                                    controller: model.scrollController,
                                    itemCount: model.houses.length,
                                    itemBuilder: (context, index) => ProductShortDetailsWidget(
                                      imageUrl: model.houses[index].imageUrl ?? '',
                                      isFavorite: true,
                                      rating: model.houses[index].rating ?? 0.0,
                                      location: model.houses[index].place ?? '',
                                      designerName: model.houses[index].designerName ?? '',
                                      dateRange: model.houses[index].date ?? '',
                                      cost: model.houses[index].price ?? 0,
                                      buildPageIndicator: model.selectedImage == index ? model.buildPageIndicator() : [],
                                      onChange: (int page) {
                                        model.changeCurrentPage(page);
                                      },
                                    ),
                                  ),
                            const Center(
                              child: Text('Coming soon!!!!'),
                            ),
                            const Center(
                              child: Text('Coming soon!!!!'),
                            ),
                            const Center(
                              child: Text('Coming soon!!!!'),
                            ),
                            const Center(
                              child: Text('Coming soon!!!!'),
                            ),
                            const Center(
                              child: Text('Coming soon!!!!'),
                            ),
                          ],
                        ),
                      ),
                      if (model.isLoadingMore)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 40,
                            color: kScaffoldBackgroundColor,
                            child: const LoadingWidget(size: 32.0),
                          ),
                        ),
                    ],
                  ),
                )
              : const LoadingWidget(),

          /// Body UI End
        ),
      ),
    );
  }

  /// Common widget for Tabs

  Widget _myTab(
    IconData icon,
    String title,
  ) {
    return Tab(
      child: Column(
        children: [
          Icon(
            icon,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
