import 'package:flutter/material.dart';
import 'package:sportvibez_test/app/app.locator.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/services/cache/hive_service.dart';
import 'package:sportvibez_test/ui/bottom_sheets/add_contact/add_contact_sheet.dart';
import 'package:stacked/stacked.dart';

class ContactsViewModel extends BaseViewModel {
  final _cacheService = locator<HiveService>();

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  void showBottomSheet(BuildContext context) async {
    final newContact = await showModalBottomSheet<Contact>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const AddContactSheet(),
    );
    if (newContact == null) return;
    await _cacheService.addContact(newContact);
    getContacts();
  }

  void getContacts() {
    _contacts = _cacheService.getAllContacts();
    rebuildUi();
  }

  Future<void> deleteContact(int index) async {
    await _cacheService.deleteContact(index);
    getContacts();
  }
}
