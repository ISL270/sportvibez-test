import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/ui/bottom_sheets/add_contact/add_contact_sheet.form.dart';
import 'package:stacked/stacked.dart';

class ContactDetailsViewModel extends FormViewModel {
  Contact get updatedContact => Contact(
        firstName: firstNameValue ?? '',
        lastName: lastNameValue ?? '',
        nickName: nickNameValue,
        phoneNumber: phoneNumberValue ?? '',
        email: emailValue,
        notes: notesValue,
        relationship: relationshipValue,
      );
}
