import 'package:flutter/material.dart';
import 'package:sportvibez_test/app/helpres/text_validator.dart';
import 'package:sportvibez_test/ui/bottom_sheets/add_contact/add_contact_sheet.form.dart';
import 'package:sportvibez_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_contact_sheet_model.dart';

@FormView(fields: [
  FormTextField(
    name: 'firstName',
  ),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'nickName'),
  FormTextField(name: 'relationship'),
  FormTextField(name: 'email'),
  FormTextField(name: 'notes'),
])
class AddContactSheet extends StackedView<AddContactSheetModel>
    with $AddContactSheet {
  final Function(SheetResponse response)? completer;
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
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add contact',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: firstNameController,
              keyboardType: TextInputType.name,
              validator: TextValidators.nameValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              validator: TextValidators.nameValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              validator: TextValidators.phoneNumValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              validator: TextValidators.emailValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Email',
                errorText: viewModel.emailValidationMessage,
              ),
            ),
            verticalSpaceMedium,
            TextFormField(
              controller: notesController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Notes',
                errorText: viewModel.notesValidationMessage,
              ),
            ),
            verticalSpaceMedium,
            TextFormField(
              controller: relationshipController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Relationship',
                errorText: viewModel.relationshipValidationMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AddContactSheetModel viewModelBuilder(BuildContext context) =>
      AddContactSheetModel();
}
