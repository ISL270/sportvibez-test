import 'package:sportvibez_test/app/domain_models/group.dart';

class Contact {
  final String firstName, lastName, phoneNumber;
  final String? nickName, relationship, email, notes;
  late final List<Group> groups;

  Contact({
    this.email,
    this.notes,
    this.nickName,
    this.relationship,
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
    List<Group>? groups,
  }) {
    this.groups = groups ?? [];
  }
}
