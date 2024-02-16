import 'package:flutter/material.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/app/helpres/text_validator.dart';
import 'package:sportvibez_test/ui/bottom_sheets/add_contact/add_contact_sheet.form.dart';
import 'package:sportvibez_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_contact_sheet_model.dart';

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
class AddContactSheet extends StackedView<AddContactSheetModel>
    with $AddContactSheet {
  final Function(SheetResponse<Contact> response)? completer;
  final SheetRequest request;
  const AddContactSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  void onViewModelReady(AddContactSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(AddContactSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    AddContactSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25) +
          const EdgeInsets.only(top: 25, bottom: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add contact',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {
                  viewModel.validateForm();
                  if (viewModel.isFormValid) {
                    final newContact = Contact(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      nickName: nickNameController.text,
                      phoneNumber: phoneNumberController.text,
                      email: emailController.text,
                      notes: notesController.text,
                      relationship: relationshipController.text,
                    );
                    completer?.call(SheetResponse(data: newContact));
                  }
                },
                icon: const Icon(Icons.check),
                iconSize: 32,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
          verticalSpaceMedium,
          Expanded(
            child: ListView(
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
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Notes',
                    errorText: viewModel.notesValidationMessage,
                  ),
                ),
                verticalSpaceMedium,
                TextFormField(
                  controller: relationshipController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Relationship',
                    errorText: viewModel.relationshipValidationMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  AddContactSheetModel viewModelBuilder(BuildContext context) =>
      AddContactSheetModel();
}
