import 'package:hive/hive.dart';

part 'contact_cm.g.dart';

// CM means "Cache model"
@HiveType(typeId: 0)
class ContactCM {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String? nickName;
  @HiveField(4)
  final String? relationship;
  @HiveField(5)
  final String? email;
  @HiveField(6)
  final String? notes;

  const ContactCM({
    this.email,
    this.notes,
    this.nickName,
    this.relationship,
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
  });
}
