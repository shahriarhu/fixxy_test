import 'package:fixxy_test/core/enums/view_state.dart';
import 'package:fixxy_test/core/models/house_model.dart';
import 'package:fixxy_test/core/services/home_api.dart';
import 'package:fixxy_test/core/view_models/base_view_model.dart';
import 'package:fixxy_test/locator.dart';
import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class ExploreViewModel extends BaseViewModel {
  /// API
  final HomeAPI _homeAPI = locator<HomeAPI>();

  List<HouseModel> houses = [];

  Future<void> getHouse() async {
    if (pageNumber == 1) {
      setViewState(ViewState.busy);

      houses = (await _homeAPI.getHouseAPI(
        bedrooms: selectedBed,
        categories: selectedCategory,
        maxPrice: rangeValues.end.toInt(),
        minPrice: rangeValues.start.toInt(),
        propertyType: _selectedPropertyType(),
        typeOfPlace: _getTypeOfPlaces(),
      ))!;

      setViewState(ViewState.idle);
    } else if (pageNumber <= 8) {
      isLoadingMore = true;
      notifyListeners();

      houses = houses +
          (await _homeAPI.getHouseAPI(
            bedrooms: selectedBed,
            categories: selectedCategory,
            maxPrice: rangeValues.end.toInt(),
            minPrice: rangeValues.start.toInt(),
            propertyType: _selectedPropertyType(),
            typeOfPlace: _getTypeOfPlaces(),
          ))!;

      isLoadingMore = false;
      notifyListeners();
    }
  }

  /// Pagination for loading more

  final ScrollController scrollController = ScrollController();

  int pageNumber = 1;

  bool isLoadingMore = false;

  void resetPageNumber() {
    pageNumber = 1;
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && isLoadingMore == false) {
      pageNumber++;

      await getHouse();
    }
  }

  /// Filter reset or clear all function
  void resetFilter() {
    selectedBed = 0;
    rangeValues = const RangeValues(10, 1000);
    _isHouseSelected = false;
    _isApartmentSelected = false;
    _isEntirePlaceSelected = false;
    _isRoomSelected = false;
    _isSharedRoomSelected = false;
  }

  /// Page View for images

  int numOfPages = 4;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  int? selectedImage;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numOfPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  void changeCurrentPage(int input) {
    currentPage = input;
    notifyListeners();
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isActive
                ? [
                    kMainColor,
                    kLightMainColor,
                  ]
                : [
                    kScaffoldBackgroundColor,
                    kScaffoldBackgroundColor,
                  ]),
        shape: BoxShape.circle,
      ),
    );
  }

  /// Setter and getter for CategoryList

  final List<String> _categoryList = [
    'beachfront',
    'cabin',
    'boats',
    'iconic_cities',
    'tropical',
    'towers',
    'luxe',
    'countryside',
  ];

  List<String> get categoryList => _categoryList;

  String _selectedCategory = 'beachfront';

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String category) {
    _selectedCategory = category;

    notifyListeners();
  }

  /// Setter and getter for Price Range

  RangeValues _rangeValues = const RangeValues(10, 1000);

  RangeValues get rangeValues => _rangeValues;

  set rangeValues(RangeValues rangeValues) {
    _rangeValues = rangeValues;

    notifyListeners();
  }

  /// Setter and getter for Bed Count

  int _selectedBed = 0;

  int get selectedBed => _selectedBed;

  set selectedBed(int bed) {
    _selectedBed = bed;

    notifyListeners();
  }

  /// Setter and getter for Type of Place

  bool _isEntirePlaceSelected = false;

  bool get isEntirePlaceSelected => _isEntirePlaceSelected;

  void toggleIsEntirePlaceSelected() {
    _isEntirePlaceSelected = !_isEntirePlaceSelected;
    _isRoomSelected = false;
    _isSharedRoomSelected = false;
    notifyListeners();
  }

  bool _isRoomSelected = false;

  bool get isRoomSelected => _isRoomSelected;

  void toggleIsRoomSelected() {
    _isRoomSelected = !_isRoomSelected;
    _isSharedRoomSelected = false;
    _isEntirePlaceSelected = false;
    notifyListeners();
  }

  bool _isSharedRoomSelected = false;

  bool get isSharedRoomSelected => _isSharedRoomSelected;

  void toggleIsSharedRoomSelected() {
    _isSharedRoomSelected = !_isSharedRoomSelected;
    _isEntirePlaceSelected = false;
    _isRoomSelected = false;
    notifyListeners();
  }

  String _getTypeOfPlaces() {
    if (isEntirePlaceSelected) {
      return 'entire_place';
    } else if (isRoomSelected) {
      return 'room';
    } else if (isSharedRoomSelected) {
      return 'shared_room';
    } else {
      return '';
    }
  }

  /// Setter and getter for Property Type

  bool _isHouseSelected = false;

  bool get isHouseSelected => _isHouseSelected;

  void toggleIsHouseSelected() {
    _isHouseSelected = !_isHouseSelected;
    _isApartmentSelected = false;
    notifyListeners();
  }

  bool _isApartmentSelected = false;

  bool get isApartmentSelected => _isApartmentSelected;

  void toggleIsApartmentSelected() {
    _isApartmentSelected = !_isApartmentSelected;
    _isHouseSelected = false;
    notifyListeners();
  }

  String _selectedPropertyType() {
    if (isHouseSelected) {
      return 'house';
    } else if (isApartmentSelected) {
      return 'apartment';
    } else {
      return '';
    }
  }
}
