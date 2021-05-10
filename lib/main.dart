import 'package:blue_car/Pruebas/home_screen.dart';
import 'package:blue_car/notifier/anuncio_notifier.dart';
import 'package:blue_car/page/chats_page.dart';
import 'package:blue_car/pruebas.dart';
import 'package:blue_car/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Home/drawerScreen.dart';
import 'Screens/Home/homeScreen.dart';
import 'Screens/Login/login_page.dart';
import 'Services/auth_services.dart';
import 'api/firebase_api.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(Users.initUsers);
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
        fontFamily: 'Circular'
    ),
  ));
}


class MyApp extends StatelessWidget {
  static final String title = 'Firebase Chat';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: ChatsPage(),
  );
}


class AuthWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    // return Pruebas();
    if(user != null){
      return Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen()
          ],
        ),
      );
    }
    return LoginPage();
  }

}