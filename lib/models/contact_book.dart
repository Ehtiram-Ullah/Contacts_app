import 'package:only_contacts/Database/data_base.dart';
import 'package:only_contacts/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  late MyDataBase dataBase;
  ContactBook._prvt() : super([]) {
    dataBase = MyDataBase();
    _loadContacts();
  }

  static final ContactBook _shared = ContactBook._prvt();

  factory ContactBook() => _shared;

  int get length => value.length;

  void add(Contact contact) {
    dataBase.insert(contact.id, contact.name, contact.phoneNumber);
    value.add(contact);
    notifyListeners();
  }

  void delete(Contact contact) {
    dataBase.remove(contact.id);
    value.remove(contact);
    notifyListeners();
  }

  Contact? getContact({required int atIndex}) {
    return atIndex < value.length ? value[atIndex] : null;
  }

  Future<void> _loadContacts() async {
    final contacts = await dataBase.fetchData();
    value = contacts.map((contact) => Contact.fromMap(contact)).toList();
    notifyListeners();
  }
}
