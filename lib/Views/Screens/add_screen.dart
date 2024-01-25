import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sub_contact_diary/Providers/contact_provider.dart';
import '../../Providers/theme_provider.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddState();
}

class _AddState extends State<AddScreen> {
  String name = '';
  String mail = '';
  String phonenumber = '';
  String lastname = '';

  @override
  Widget build(BuildContext context) {
    var res = Provider.of<ContactProvider>(context);
    var providertheme = Provider.of<themeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Contact",
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
            )),
        actions: [
          IconButton(
              onPressed: () {
                providertheme.changetheme();
                providertheme.setTheme();
              },
              icon: const Icon(
                Icons.developer_mode,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: res.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "First Name",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    hintText: "Name",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter first name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    name = val;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Last Name",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    hintText: "surname",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter last name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    lastname = val;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "1234567890",
                      prefixText: "+91"),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter mobile number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    phonenumber = val;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Email",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    hintText: "xyz@gmail.com",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter email";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    mail = val;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ContactProvider>(context, listen: false)
                          .addContact(name, lastname, mail, phonenumber);
                      Navigator.pop(context);
                    },
                    child: const Text("SAVE"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
