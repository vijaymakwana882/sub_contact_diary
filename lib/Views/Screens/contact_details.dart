import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Providers/contact_provider.dart';

class ContactDetail extends StatefulWidget {
  ContactDetail({super.key, required this.index});

  final int index;

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    var res = Provider.of<ContactProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
          actions: const [
            Icon(
              Icons.circle,
              color: Colors.black,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.menu_outlined,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 120, top: 80),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: Center(
                          child: Icon(
                        Icons.person,
                        size: 70,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "${res.addcontact[widget.index].name}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${res.addcontact[widget.index].lastname}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    "+91 ${res.addcontact[widget.index].phonenumber}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(
                              "tel:${res.addcontact[widget.index].phonenumber}"),
                        );
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                        size: 30,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green))),
                  IconButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(
                              "sms:${res.addcontact[widget.index].phonenumber}"),
                        );
                      },
                      icon: Icon(
                        Icons.message,
                        color: Colors.yellow,
                        size: 30,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orangeAccent))),
                  IconButton(
                    onPressed: () {
                      launchUrl(
                        Uri.parse(
                            'email :${res.addcontact[widget.index].mail}?subject=News&body=New%20plugin'),
                      );
                    },
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 30,
                    ),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share(
                          "Name : ${res.addcontact[widget.index].name} Contact no-${res.addcontact[widget.index].phonenumber}");
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 30,
                    ),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                  )
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ],
          ),
        ));
  }
}
