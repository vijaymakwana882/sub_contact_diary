import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/contact_provider.dart';
import 'Providers/theme_provider.dart';
import 'Views/Screens/add_screen.dart';
import 'Views/Screens/hide_contact.dart';
import 'Views/Screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider(),
        )
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: false),
        darkTheme: ThemeData.dark(useMaterial3: false),
        themeMode:
            (Provider.of<themeProvider>(context).themeDetails.isDark == false)
                ? ThemeMode.dark
                : ThemeMode.light,
        initialRoute: "HomePage",
        routes: {
          'HomePage': (context) => HomePage(),
          'AddScreen': (context) => AddScreen(),
          'HideScreen': (context) => HideScreen(),
        },
      ),
    );
  }
}
