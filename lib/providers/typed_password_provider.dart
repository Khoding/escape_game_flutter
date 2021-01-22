import 'package:escape_game_flutter/utils/utils.dart';
import 'package:flutter/foundation.dart';

class TypedPasswordProvider with ChangeNotifier {
  ///La chaîne tapée dans le champs password
  String typedPassword = "";

  ///La chaîne contenant autant d'étoiles qu'il y a de caractères dans le mdp tapé
  String typedPasswordStars = "";

  ///Ajoute un caractère au mot de passe et aux étoiles
  void addPasswordChar(String char) {
    typedPassword += char;
    typedPasswordStars += "*";
    notifyListeners();
  }

  ///Efface le mot de passe
  void deletePassword() {
    typedPassword = typedPasswordStars = "";
    notifyListeners();
  }

  bool validatePassword() {
    return typedPassword == Utils.password;
  }
}
