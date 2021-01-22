import 'package:escape_game_flutter/screens/password_screen.dart';
import 'package:escape_game_flutter/utils/utils.dart';
import 'package:flutter/Material.dart';

///Page qui présente le mot de passe, qu'il faudra retenir et taper à la page suivante
class StartScreen extends StatelessWidget {
  //chemin pour accéder à la page
  static const routeName = '/start_screen';

  @override
  Widget build(BuildContext context) {
    Utils.initChars();
    Utils.generatePassword();

    return Scaffold(
      appBar: AppBar(
        title: Text("Escape Game"),
      ),
      body: Center(
        child: Column(
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
            SizedBox(height: 8),
            Text(Utils.password),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, PasswordScreen.routeName),
              child: Text("Commencer"),
            )
          ],
        ),
      ),
    );
  }
}
