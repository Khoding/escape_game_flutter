import 'package:escape_game_flutter/providers/typed_password_provider.dart';
import 'package:escape_game_flutter/widgets/fake_form_field.dart';
import 'package:escape_game_flutter/widgets/keyboard/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Page permettant d'entrer le mot de passe
class PasswordScreen extends StatefulWidget {
  //chemin pour accéder à la page
  static const routeName = '/passwordScreen';

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  //Variable permettant de savoir si le clavier est ouvert ou non
  bool _keyboardEnabled = false;

  ///Ouvrir le clavier (au clic sur FakeTextField)
  void _enableKeyBoard() {
    setState(() {
      _keyboardEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //Le FakeTextField
          Container(
            //Si clavier fermé prendre toute la place, sinon 2/3
            height: _keyboardEnabled
                ? (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            kToolbarHeight) *
                        (2 / 3) -
                    32
                : MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight,
            child: Center(
              child: FakeTextField(
                text: Provider.of<TypedPasswordProvider>(context)
                    .typedPasswordStars,
                hint: "Entrez le mot de passe",
                onTap: _enableKeyBoard,
              ),
            ),
          ),
          //Le clavier
          if (_keyboardEnabled)
            Container(
              height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          kToolbarHeight) /
                      3 +
                  32,
              child: Keyboard(),
            ),
        ],
      ),
    );
  }
}
