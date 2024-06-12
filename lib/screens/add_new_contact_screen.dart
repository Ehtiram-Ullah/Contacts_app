import 'package:only_contacts/models/contact_book.dart';
import 'package:only_contacts/models/contacts.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new contact"),
        centerTitle: true,
      ),
      body: AddingContacts(context),
    );
  }

  Column AddingContacts(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InputField(
              hint: "Name", controller: name, isNumber: false, isPerson: true),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InputField(
              hint: "Phone Number",
              controller: phoneNumber,
              isNumber: true,
              isPerson: false),
        ),
        TextButton(
            onPressed: () {
              ContactBook()
                  .add(Contact(name: name.text, phoneNumber: phoneNumber.text));
              Navigator.pop(context);
            },
            child: const Text("ADD"))
      ],
    );
  }

  TextField InputField(
      {required String hint,
      required TextEditingController controller,
      required bool isNumber,
      required bool isPerson}) {
    return TextField(
      keyboardType: isNumber ? TextInputType.phone : TextInputType.name,
      decoration: InputDecoration(
        hintText: hint,
        label: Icon(isPerson ? Icons.face : Icons.call),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintStyle: const TextStyle(
            color: Color.fromARGB(100, 122, 118, 118),
            fontFamily: "Poppins-Light"),
        alignLabelWithHint: false,

        // contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
      style: const TextStyle(
          fontFamily: "Poppins-Light", fontWeight: FontWeight.bold),
      controller: controller,
    );
  }
}
