import 'package:fixxy_test/core/enums/view_state.dart';
import 'package:flutter/foundation.dart';

/// Every ViewModel class is extends this BaseViewModel class

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setViewState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
