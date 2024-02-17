import 'package:sportvibez_test/app/domain_models/contact.dart';

// abstraction of the caching service which serves the `Dependancy inversion` principle.
abstract interface class CacheService {
  Future<void> init();
  Future<void> addContact(Contact contact);
  Future<void> updateContact(int index, Contact updatedContact);
  Future<void> deleteContact(int index);
  List<Contact> getAllContacts();
}
