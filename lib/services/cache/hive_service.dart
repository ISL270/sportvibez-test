import 'package:hive_flutter/hive_flutter.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/services/cache/cache_models/contact_cm.dart';
import 'package:sportvibez_test/services/cache/i_cache_service.dart';
import 'package:sportvibez_test/services/cache/mappers/contact_mapper.dart';

enum HiveBox {
  contact('contactsBox');

  final String boxName;
  const HiveBox(this.boxName);
}

/// Concrete implementation of [CacheService] using Hive.
class HiveService implements CacheService {
  void registerAdapters() {
    Hive.registerAdapter<ContactCM>(ContactCMAdapter());
  }

  Future<void> openBoxes() async {
    for (final hb in HiveBox.values) {
      await Hive.openBox<ContactCM>(hb.boxName);
    }
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    registerAdapters();
    await openBoxes();
  }

  @override
  Future<void> addContact(Contact contact) async {
    await contactsBox.add(contact.toCacheModel());
  }

  @override
  Future<void> updateContact(int index, Contact updatedContact) async {
    await contactsBox.putAt(index, updatedContact.toCacheModel());
  }

  @override
  Future<void> deleteContact(int index) async {
    await contactsBox.deleteAt(index);
  }

  @override
  List<Contact> getAllContacts() {
    final cmList = contactsBox.values.cast<ContactCM>();
    return cmList.map((e) => e.toDomainModel()).toList();
  }

  Box<ContactCM> get contactsBox =>
      Hive.box<ContactCM>(HiveBox.contact.boxName);
}
