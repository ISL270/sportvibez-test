class Contact {
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
}
