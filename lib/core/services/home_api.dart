import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fixxy_test/core/models/house_model.dart';
import 'package:fixxy_test/ui/common_widgets/simple_notification_widget.dart';
import 'package:fixxy_test/ui/shared/api_url.dart';
import 'package:http/http.dart' as http;

class HomeAPI {
  Future<List<HouseModel>?> getHouseAPI({
    int? bedrooms,
    String? categories,
    int? maxPrice,
    int? minPrice,
    String? propertyType,
    String? typeOfPlace,
  }) async {
    /// Adding query param for the filter
    var addedSearchString = '';
    if (bedrooms != 0) {
      addedSearchString = '$addedSearchString&bedrooms=$bedrooms';
    }
    if (propertyType!.isNotEmpty) {
      addedSearchString = '$addedSearchString&property_type=$propertyType';
    }
    if (typeOfPlace!.isNotEmpty) {
      addedSearchString = '$addedSearchString&type_of_place=$typeOfPlace';
    }

    try {
      http.Response response = await http.get(
        Uri.parse('${domain}min_price=$minPrice&max_price=$maxPrice&category=$categories&$addedSearchString'),
      );

      log(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<HouseModel> houses = houseModelFromJson(response.body);

        return houses;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        /// Sign Out (if it had authentication)
      } else {
        simpleNotificationWidget(statusCode: response.statusCode, message: jsonDecode(response.body)['message']);
      }
    } on TimeoutException {
      simpleNotificationWidget(message: 'Connection timeout');
    } on SocketException {
      simpleNotificationWidget(message: 'Please check your connection');
    } on Error {
      simpleNotificationWidget(message: 'Unexpected error occurred');
    } on FormatException {
      simpleNotificationWidget(message: 'Server is under maintenance');
    } catch (e) {
      simpleNotificationWidget(message: 'Something went wrong');
    }
    return null;
  }
}
