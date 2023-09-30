import 'package:fixxy_test/core/view_models/inbox_view_model.dart';
import 'package:fixxy_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<InboxViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(
            'Inbox',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
