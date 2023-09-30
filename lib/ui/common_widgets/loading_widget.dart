import 'package:fixxy_test/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.size = 64,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPulsingGrid(
        color: kMainColor,
        size: size,
      ),
    );
  }
}
