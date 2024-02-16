import 'package:flutter/material.dart';
import 'package:sportvibez_test/ui/views/contacts/contact_tile.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({super.key});

  @override
  void onViewModelReady(ContactsViewModel viewModel) {
    viewModel.getContacts();
    super.onViewModelReady(viewModel);
  }

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
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemCount: viewModel.contacts.length,
          itemBuilder: (context, i) => ContactTile(viewModel.contacts[i]),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactsViewModel();
}
