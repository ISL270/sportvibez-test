import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String firstName, lastName, phoneNumber;
  final String? nickName, relationship, email, notes;

  const Contact({
    this.email,
    this.notes,
    this.nickName,
    this.relationship,
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phoneNumber,
        nickName,
        relationship,
        email,
        notes,
      ];
}
