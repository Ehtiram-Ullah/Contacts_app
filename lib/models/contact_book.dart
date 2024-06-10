import 'package:contacts_app/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._prvt() : super([]);
  static final ContactBook _shared = ContactBook._prvt();

  factory ContactBook() => _shared;

  int get length => value.length;

  void add(Contact contact) {
    value.add(contact);
    notifyListeners();
  }

  void delete(Contact contact) {
    value.remove(contact);
    notifyListeners();
  }

  Contact? getContact({required int atIndex}) {
    return atIndex < value.length ? value[atIndex] : null;
  }
}
