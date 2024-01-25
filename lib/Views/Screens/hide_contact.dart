import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/contact_provider.dart';
import '../../Providers/theme_provider.dart';

class HideScreen extends StatefulWidget {
  const HideScreen({super.key});

  @override
  State<HideScreen> createState() => _HideScreenState();
}

class _HideScreenState extends State<HideScreen> {
  @override
  Widget build(BuildContext context) {
    var TProvider = Provider.of<themeProvider>(context, listen: false);
    var res = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()  {
                TProvider.changetheme();
                 TProvider.setTheme();
              },
              icon: const Icon(
                Icons.developer_mode,

              )),
        ],
      ),
      body: ListView.builder(
        itemCount: res.hiddencontact.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${res.hiddencontact[index].name}"),
              subtitle: Text("${res.hiddencontact[index].phonenumber}"),
              trailing: IconButton(
                onPressed: () {
                  res.deletehiddenlist();
                },
                icon: Icon(Icons.hide_source),
              ),
            ),
          );
        },
      ),
    );
  }
}