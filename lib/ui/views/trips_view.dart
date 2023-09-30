import 'package:fixxy_test/core/view_models/trips_view_model.dart';
import 'package:fixxy_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TripsViewModel>(
      builder: (context, model, child) => Container(
        child: Center(
          child: Text(
            'Trips',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
