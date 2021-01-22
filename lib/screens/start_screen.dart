import 'package:escape_game_flutter/screens/password_screen.dart';
import 'package:escape_game_flutter/utils/utils.dart';
import 'package:flutter/Material.dart';

///Page qui présente le mot de passe, qu'il faudra retenir et taper à la page suivante
class StartScreen extends StatelessWidget {
  //chemin pour accéder à la page
  static const routeName = '/StartScreen';

  @override
  Widget build(BuildContext context) {
    Utils.initChars();
    Utils.generatePassword();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Utils.password),
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
