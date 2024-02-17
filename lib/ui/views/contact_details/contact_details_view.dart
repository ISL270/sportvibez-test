import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_view_response.dart';
import 'package:stacked/stacked.dart';

import 'contact_details_viewmodel.dart';

class ContactDetailsView extends StackedView<ContactDetailsViewModel> {
  final Contact contact;
  const ContactDetailsView(this.contact, {super.key});

  static const routeName = 'contact_details';

  static Future<ContactViewResponse?> route(
    BuildContext context,
    Contact contact,
  ) =>
      context.pushNamed<ContactViewResponse>(routeName, extra: contact);

  @override
  Widget builder(
    BuildContext context,
    ContactDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          contact.firstName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
            iconSize: 25,
          ),
          IconButton(
            onPressed: () => context.pop(
              const ContactViewResponse(ContactAction.delete),
            ),
            icon: const Icon(Icons.delete),
            color: Colors.red,
            iconSize: 27,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Text(contact.firstName),
      ),
    );
  }

  @override
  ContactDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactDetailsViewModel();
}
