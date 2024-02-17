import 'package:flutter/material.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_view_response.dart';
import 'package:sportvibez_test/ui/views/contacts/contact_tile.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({super.key});

  static const routeName = 'contacts';

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
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.contacts.isEmpty) {
            return const Center(
                child: Text(
              'You have no contacts!\nLets add some from the botton below 👇',
              textAlign: TextAlign.center,
            ));
          }
          return Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: viewModel.contacts.length,
              itemBuilder: (context, i) => ContactTile(
                contact: viewModel.contacts[i],
                onActionTaken: (res) {
                  switch (res.action) {
                    case ContactAction.delete:
                      viewModel.deleteContact(i);
                    case ContactAction.edit:
                      viewModel.updateContact(i, res.contact!);
                  }
                },
              ),
              separatorBuilder: (context, index) => const Divider(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.showBottomSheet(context),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
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
