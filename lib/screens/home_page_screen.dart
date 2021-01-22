import 'package:escape_game_flutter/screens/start_screen.dart';
import 'package:flutter/material.dart';

///Page de lancement => accueil, présentation et connexion au jeu
class HomePageScreen extends StatelessWidget {
  //chemin pour accéder à la page
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escape Game"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue dans notre escape game",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              "Cette page permettra de se connecter à la partie quand le système de communication sera mis en place",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, StartScreen.routeName),
              child: Text("Commencer"),
            ),
          ],
        ),
      ),
    );
  }
}
