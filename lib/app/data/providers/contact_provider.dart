import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../services/data_manager.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

  Future<void> loadContacts() async {
    final contacts = await DataManager.instance.readAllContacts();
    _contacts = contacts;
    notifyListeners();
  }

  Future<void> addContact(ContactModel contact) async {
    final newContact = await DataManager.instance.create(contact);
    _contacts = [..._contacts, newContact];
    notifyListeners();
  }

  Future<void> updateContact(ContactModel contact) async {
    await DataManager.instance.update(contact);
    _contacts = [
      for (final c in _contacts)
        if (c.id == contact.id) contact else c,
    ];
    notifyListeners();
  }

  Future<void> deleteContact(int id) async {
    await DataManager.instance.delete(id);
    _contacts = _contacts.where((contact) => contact.id != id).toList();
    notifyListeners();
  }
}
