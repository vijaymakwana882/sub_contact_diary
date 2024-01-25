import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sub_contact_diary/Models/global_models.dart';

class ContactProvider extends ChangeNotifier {
  final key = GlobalKey<FormState>();
  int index = 0;
  List<GlobalV> addcontact = [];
  List<GlobalV> hiddencontact = [];

  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;

  void pickImage() {
    imagePicker.pickImage(source: ImageSource.camera).then((value) {
      xFile = value;
    });
  }

  void deletelist() {
    hiddencontact.add(addcontact[index]);
    addcontact.remove(addcontact[index]);
    notifyListeners();
  }

  void deletehiddenlist() {
    addcontact.add(hiddencontact[index]);
    hiddencontact.remove(hiddencontact[index]);
    notifyListeners();
  }

  void addContact(
      String name, String lastname, String mail, String phonenumber) {
    print(name);
    print(lastname);
    print(phonenumber);
    GlobalV Global = GlobalV(
        mail: mail, name: name, lastname: lastname, phonenumber: phonenumber);
    addcontact.add(Global);
    notifyListeners();
  }
}
