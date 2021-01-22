import 'package:escape_game_flutter/providers/keys_provider.dart';
import 'package:escape_game_flutter/providers/typed_password_provider.dart';
import 'package:escape_game_flutter/screens/home_page_screen.dart';
import 'package:escape_game_flutter/screens/password_screen.dart';
import 'package:escape_game_flutter/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    //Les providers (classent qui donnent des données et avertissent si elles sont modifiées) --> ajouter les nouveaux providers ici
    providers: [
      ChangeNotifierProvider(create: (_) => KeysProvider()),
      ChangeNotifierProvider(
        create: (_) => TypedPasswordProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escape Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      //Les pages auxquelles on peut accéder --> ajouter les nouvlles pages ici
      routes: {
        HomePageScreen.routeName: (context) => HomePageScreen(),
        StartScreen.routeName: (context) => StartScreen(),
        PasswordScreen.routeName: (context) => PasswordScreen(),
      },
    );
  }
}
