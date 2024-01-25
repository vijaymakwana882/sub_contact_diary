import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_contact_diary/Providers/contact_provider.dart';
import 'package:sub_contact_diary/Views/Screens/add_screen.dart';
import '../../Providers/theme_provider.dart';
import 'contact_Details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    await Provider.of<themeProvider>(context, listen: false).getTheme();
  }

  @override
  Widget build(BuildContext context) {
    var ThemeProvider = Provider.of<themeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_outlined),
          // centerTitle: true,
          title: const Text(
            "Recents",
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  ThemeProvider.changetheme();
                  await ThemeProvider.setTheme();
                },
                icon: const Icon(
                  Icons.developer_mode,
                )),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "HideScreen");
              },
              child: Icon(
                Icons.menu,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: Provider.of<ContactProvider>(context).addcontact.isEmpty
          ? const emptyy()
          : const Details(),
    );
  }
}

class emptyy extends StatefulWidget {
  const emptyy({Key? key}) : super(key: key);

  @override
  State<emptyy> createState() => _emptyyState();
}

class _emptyyState extends State<emptyy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/box.png",
          scale: 5,
        ),
        const Center(
          child: Text(
            "You have no contacts yet",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var res = Provider.of<ContactProvider>(context);
    var Fres = Provider.of<ContactProvider>(context, listen: false);
    return Scaffold(
      body: ListView.builder(
        itemCount: res.addcontact.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetail(index: index),
                  ));
            },
            child: ListTile(
              trailing: InkWell(
                onTap: () {
                  Fres.deletelist();
                },
                child: Icon(Icons.hide_source),
              ),
              title: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("${res.addcontact[index].name}"),
                          SizedBox(
                            width: 6,
                          ),
                          Text("${res.addcontact[index].lastname}"),
                        ],
                      ),
                      Text("${res.addcontact[index].phonenumber}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
