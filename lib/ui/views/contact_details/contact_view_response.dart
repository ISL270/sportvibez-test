import 'package:sportvibez_test/app/domain_models/contact.dart';

enum ContactAction {
  edit,
  delete,
}

class ContactViewResponse {
  final ContactAction action;
  final Contact? contact;

  const ContactViewResponse(this.action, [this.contact]);
}
