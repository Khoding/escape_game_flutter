import 'package:escape_game_flutter/providers/keys_provider.dart';
import 'package:escape_game_flutter/providers/typed_password_provider.dart';
import 'package:escape_game_flutter/screens/end_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/typed_password_provider.dart';

///Le clavier permettant d'entrer le mdp
class Keyboard extends StatefulWidget {
  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  //Variable pour savoir si on doit initialiser
  bool _isinit = true;

  //Provider des touches
  var keysProvider;

  //
  bool _isShuffleButtonEnabled = true;

  //Appelé quand le widget doit être reconstruit
  @override
  void didChangeDependencies() {
    if (_isinit) {
      //Initialisation des touches
      //Ne pas mettre dans initState(), car le context doit être présent
      keysProvider = Provider.of<KeysProvider>(context);
      keysProvider.initKeys();
      _isinit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //Bouton Effacer
            Container(
              width: MediaQuery.of(context).size.width / 3 - 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: RaisedButton(
                onPressed: () =>
                    Provider.of<TypedPasswordProvider>(context, listen: false)
                        .deletePassword(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.red,
                child: Text("Effacer"),
              ),
            ),
            //Bouton Mélanger
            Container(
              width: MediaQuery.of(context).size.width / 3 - 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: RaisedButton(
                onPressed: _isShuffleButtonEnabled
                    ? () {
                        Provider.of<KeysProvider>(context, listen: false)
                            .shuffleKeys();
                        _isShuffleButtonEnabled = false;
                      }
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.orange,
                child: Text("Mélanger"),
              ),
            ),
            //Boutton Valider
            Container(
              width: MediaQuery.of(context).size.width / 3 - 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: RaisedButton(
                onPressed: () {
                  if (Provider.of<TypedPasswordProvider>(context, listen: false)
                      .validatePassword()) {
                    Navigator.pushReplacementNamed(
                        context, EndScreen.routeName);
                  } else {
                    Provider.of<TypedPasswordProvider>(context, listen: false)
                        .deletePassword();
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.green,
                child: Text("Valider"),
              ),
            ),
          ],
        ),
        //1ère ligne du clavier
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //1er tiers de touches du clavier
          child: Row(
            children: [
              //1er tiers des touches du clavier
              //On récupère les touches de la liste depuis le provider --> mis à jour auto quand la liste est changée
              ...keysProvider.keys.getRange(0, keysProvider.keys.length ~/ 3),
            ],
          ),
        ),
        //2ème ligne du clavier
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //2e tiers des touches du clavier
          child: Row(
            children: [
              ...keysProvider.keys.getRange(keysProvider.keys.length ~/ 3,
                  keysProvider.keys.length * 2 ~/ 3),
            ],
          ),
        ),
        //3e ligne du clavier
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //dernier tiers des touches du clavier
          child: Row(
            children: [
              ...keysProvider.keys.getRange(
                  keysProvider.keys.length * 2 ~/ 3, keysProvider.keys.length),
            ],
          ),
        ),
      ],
    );
  }
}
