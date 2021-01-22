import 'package:escape_game_flutter/screens/start_screen.dart';
import 'package:flutter/material.dart';

///Page de lancement => accueil, présentation et connexion au jeu
class HomePageScreen extends StatelessWidget {
  //chemin pour accéder à la page
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, StartScreen.routeName),
          child: Text("Commencer"),
        ),
      ),
    );
  }
}
