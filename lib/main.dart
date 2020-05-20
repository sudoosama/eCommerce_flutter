import 'package:ecommerceflutter/pages/login_page.dart';
import 'package:ecommerceflutter/pages/register_page.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Flutter',
      routes: {
        '/login': (BuildContext context)=> LoginPage(),
        '/register': (BuildContext context)=> RegisterPage(),
      },
      theme: ThemeData(
       //brightness: Brightness.dark,
        primaryColor: Colors.cyan[400],
        accentColor: Colors.deepOrange[200],
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0,fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0,fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
       // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     home: RegisterPage(),
    );
  }
}
