import 'package:only_contacts/models/contact_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        // print("The id of the Contact is ${contacts.value[index].id}");
        final contact = contacts.value[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            // Unique key vlaue for every item
            key: ValueKey(contact.id),
            onDismissed: (direction) {
              print("The index is $index");
              contacts.delete(contact);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Contact successfully deleted",
                  style: TextStyle(
                      fontFamily: "Poppins-Light",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.sizeOf(context).height / 50),
                ),
                duration: const Duration(seconds: 2),
                backgroundColor: const Color.fromARGB(255, 243, 238, 238),
                // animation: AnimationController(vsync: ) ,
                // elevation: 15,
              ));
            },
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: contact.phoneNumber));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Phone number copied to clipboard",
                    style: TextStyle(
                        fontFamily: "Poppins-Light",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).height / 50),
                  ),
                  duration: const Duration(seconds: 2),
                  backgroundColor: const Color.fromARGB(255, 243, 238, 238),
                  // animation: AnimationController(vsync: ) ,
                  // elevation: 15,
                ));
              },
              child: Material(
                color: const Color.fromARGB(255, 243, 238, 238),
                elevation: 6,
                child: ListTile(
                  leading: const Icon(Icons.face),
                  title: Text(
                    contact.name,
                    style: const TextStyle(
                        fontFamily: "Poppins-Light",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  trailing: Text(
                    contact.phoneNumber,
                    style: const TextStyle(
                        fontFamily: "Poppins-Light",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: contacts.length,
    );
  }
}
