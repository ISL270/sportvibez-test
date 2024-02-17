import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/app/helpres/text_validator.dart';
import 'package:sportvibez_test/ui/common/ui_helpers.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_details_view.form.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_view_response.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'contact_details_viewmodel.dart';

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(
      name: 'firstName',
      validator: TextValidators.nameValidator,
    ),
    FormTextField(
      name: 'lastName',
      validator: TextValidators.nameValidator,
    ),
    FormTextField(name: 'nickName'),
    FormTextField(
      name: 'phoneNumber',
      validator: TextValidators.phoneNumValidator,
    ),
    FormTextField(
      name: 'email',
      validator: TextValidators.emailValidator,
    ),
    FormTextField(name: 'notes'),
    FormTextField(name: 'relationship'),
  ],
)
class ContactDetailsView extends StackedView<ContactDetailsViewModel>
    with $ContactDetailsView {
  final Contact contact;
  const ContactDetailsView(this.contact, {super.key});

  static const routeName = 'contact_details';

  static Future<ContactViewResponse?> route(
    BuildContext context,
    Contact contact,
  ) =>
      context.pushNamed<ContactViewResponse>(routeName, extra: contact);

  @override
  void onViewModelReady(ContactDetailsViewModel viewModel) {
    firstNameController.text = contact.firstName;
    lastNameController.text = contact.lastName;
    nickNameController.text = contact.nickName ?? '';
    phoneNumberController.text = contact.phoneNumber;
    emailController.text = contact.email ?? '';
    notesController.text = contact.notes ?? '';
    relationshipController.text = contact.relationship ?? '';

    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(ContactDetailsViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

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
            onPressed: () {
              viewModel.validateForm();
              if (!viewModel.isFormValid) return;
              if (viewModel.updatedContact == contact) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Nothing changed! please update the contact information then try again.',
                  ),
                ));
                return;
              }
              context.pop(ContactViewResponse(
                ContactAction.edit,
                viewModel.updatedContact,
              ));
            },
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
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          TextFormField(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'First name',
              errorText: viewModel.firstNameValidationMessage,
            ),
          ),
          verticalSpaceMedium,
          TextFormField(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Last name',
              errorText: viewModel.lastNameValidationMessage,
            ),
          ),
          verticalSpaceMedium,
          TextFormField(
            controller: nickNameController,
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Nick name',
              errorText: viewModel.nickNameValidationMessage,
            ),
          ),
          verticalSpaceMedium,
          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Phone number',
              errorText: viewModel.phoneNumberValidationMessage,
            ),
          ),
          verticalSpaceMedium,
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Email',
              errorText: viewModel.emailValidationMessage,
            ),
          ),
          verticalSpaceMedium,
          TextFormField(
            controller: notesController,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Notes',
              errorText: viewModel.notesValidationMessage,
            ),
          ),
          verticalSpaceMedium,
          TextFormField(
            controller: relationshipController,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Relationship',
              errorText: viewModel.relationshipValidationMessage,
            ),
          ),
        ],
      ),
    );
  }

  @override
  ContactDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactDetailsViewModel();
}
