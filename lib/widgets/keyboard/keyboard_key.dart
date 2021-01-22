import 'package:escape_game_flutter/providers/keys_provider.dart';
import 'package:escape_game_flutter/providers/typed_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Une touche du clavier
class KeyboardKey extends StatelessWidget {
  //Le caractère auquel la touche correspond
  final String char;

  KeyboardKey({@required this.char});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight) /
                3 /
                3 -
            18,
        //hauteur: 1/3 de la hauteur du clavier
        width: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight) /
                3 /
                3 -
            18, //largeur: comme la hauteur
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {
            //print(char);
            //Ajouter le caractère à la chaîne
            Provider.of<TypedPasswordProvider>(context, listen: false).addPasswordChar(char);
            //Mélanger les touches du clavier
            Provider.of<KeysProvider>(context, listen: false).shuffleKeys();
          },
          child: Text(char),
        ),
      ),
    );
  }
}
