import 'package:fixxy_test/core/view_models/wishlists_view_model.dart';
import 'package:fixxy_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class WishlistsView extends StatelessWidget {
  const WishlistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WishlistsViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(
            'Wishlists',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
