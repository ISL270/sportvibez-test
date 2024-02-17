import 'package:hive_flutter/hive_flutter.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/services/cache/cache_models/contact_cm.dart';
import 'package:sportvibez_test/services/cache/mappers/contact_mapper.dart';

enum HiveBox {
  contact('contactsBox');

  final String boxName;
  const HiveBox(this.boxName);
}

class HiveService {
  void registerAdapters() {
    Hive.registerAdapter<ContactCM>(ContactCMAdapter());
  }

  Future<void> openBoxes() async {
    for (final hb in HiveBox.values) {
      await Hive.openBox<ContactCM>(hb.boxName);
    }
  }

  Future<void> init() async {
    await Hive.initFlutter();
    registerAdapters();
    await openBoxes();
  }

  Future<void> addContact(Contact contact) async {
    await contactsBox.add(contact.toCacheModel());
  }

  List<Contact> getAllContacts() {
    final cmList = contactsBox.values.cast<ContactCM>();
    return cmList.map((e) => e.toDomainModel()).toList();
  }

  Future<void> deleteContact(int index) async {
    await contactsBox.deleteAt(index);
  }

  Box<ContactCM> get contactsBox =>
      Hive.box<ContactCM>(HiveBox.contact.boxName);
}
