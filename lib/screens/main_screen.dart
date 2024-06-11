import 'package:contacts_app/models/contact_book.dart';
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: ValueKey(contacts),
            onDismissed: (direction) {
              contacts.delete(contacts.value[index]);
            },
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: contacts.value[index].phoneNumber));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Phone number copied to clipboard",
                    style: TextStyle(
                        fontFamily: "Poppins-Light",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).height / 50),
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: const Color.fromARGB(255, 243, 238, 238),
                  // animation: AnimationController(vsync: ) ,
                  // elevation: 15,
                ));
              },
              child: Material(
                color: const Color.fromARGB(255, 243, 238, 238),
                elevation: 6,
                child: ListTile(
                  leading: Icon(Icons.face),
                  title: ContactInfo(index, context, true),
                  trailing: ContactInfo(index, context, false),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: contacts.length,
    );
  }

  Text ContactInfo(int index, BuildContext context, bool isName) => Text(
        isName ? contacts.value[index].name : contacts.value[index].phoneNumber,
        style: TextStyle(
            fontFamily: "Poppins-Light",
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.sizeOf(context).height / 50),
      );
}
