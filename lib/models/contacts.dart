import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber})
      : id = const Uuid().v4();

  Contact.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        phoneNumber = map['phone'];
}
