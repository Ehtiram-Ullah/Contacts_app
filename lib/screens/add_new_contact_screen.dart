import 'package:contacts_app/models/contact_book.dart';
import 'package:contacts_app/models/contacts.dart';
import 'package:flutter/material.dart';

class AddNewContact extends StatefulWidget {
  const AddNewContact({super.key});

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  late TextEditingController name;
  late TextEditingController phoneNumber;

  @override
  void initState() {
    name = TextEditingController();
    phoneNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ContactBook();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new contact"),
        centerTitle: true,
      ),
      body: AddingContacts(context),
    );
  }

  Column AddingContacts(BuildContext context) {
    return Column(
      children: [
        InputField(hint: "Name", controller: name, isNumber: false),
        InputField(
            hint: "Phone Number", controller: phoneNumber, isNumber: true),
        TextButton(
            onPressed: () {
              ContactBook()
                  .add(Contact(name: name.text, phoneNumber: phoneNumber.text));
              Navigator.pop(context);
            },
            child: Text("Add"))
      ],
    );
  }

  TextField InputField(
      {required String hint,
      required TextEditingController controller,
      required bool isNumber}) {
    return TextField(
      keyboardType: isNumber ? TextInputType.phone : TextInputType.name,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Color.fromARGB(100, 122, 118, 118)),
        alignLabelWithHint: false,
        // contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
      controller: controller,
    );
  }
}
