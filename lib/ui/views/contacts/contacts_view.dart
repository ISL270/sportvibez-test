import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ContactsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showBottomSheet,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactsViewModel();
}
