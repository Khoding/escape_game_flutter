import 'package:flutter/material.dart';

///Faux TextField permettant de ne pas ouvrir le clavier système pour taper le mot de passe
class FakeTextField extends StatefulWidget {
  //Le texte affiché dans le champs (comme c'est un mdp, mettre des étoiles)
  final String text;
  //Message indiquant ce qu'il doit entrer dans le champ
  final String hint;
  //Fonction passée en paramètres, et appelée lors d'un clic (ouvrir le clavier)
  final Function onTap;
  final Color textColor;

  FakeTextField(
      {@required this.text,
      @required this.onTap,
      this.textColor = Colors.black,
      this.hint = ""});

  @override
  _FakeTextFieldState createState() => _FakeTextFieldState();
}

class _FakeTextFieldState extends State<FakeTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: widget.text.isNotEmpty
              //Affichage du texte entré si un message est entré
              ? Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 12,
                  ),
                )
              //Affichage du message
              : Text(
                  widget.hint,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
        ),
      ),
    );
  }
}
