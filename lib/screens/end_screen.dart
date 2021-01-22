import 'package:flutter/Material.dart';

///Page de fin qui annonce qu'on a gagné
class EndScreen extends StatelessWidget {
  //chemin pour accéder à la page
  static const routeName = '/end_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escape Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mot de passe",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Text(
            "Voici le mot de passe à entrer dans la page suivante : ",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Text("Vous avez gagné !"),
        ],
      ),
    );
  }
}
