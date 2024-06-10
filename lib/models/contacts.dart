import 'package:uuid/uuid.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String id;
  Contact({required this.name, required this.phoneNumber})
      : id = const Uuid().v4();
}
