import 'package:contacts_app/models/contact_book.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = ContactBook();
    return ListenableBuilder(
      listenable: contacts,
      builder: (context, child) {
        return ListViewBuilder(contacts: contacts);
      },
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    required this.contacts,
  });

  final ContactBook contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: ValueKey(contacts),
            onDismissed: (direction) {
              contacts.delete(contacts.value[index]);
            },
            child: Material(
              color: Color.fromARGB(255, 233, 224, 224),
              elevation: 6,
              child: ListTile(
                leading: Icon(Icons.face),
                title: Text(contacts.value[index].name),
                trailing: Text(contacts.value[index].phoneNumber),
              ),
            ),
          ),
        );
      },
      itemCount: contacts.length,
    );
  }
}
