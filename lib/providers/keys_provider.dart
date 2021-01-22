import 'package:escape_game_flutter/utils/utils.dart';
import 'package:escape_game_flutter/widgets/keyboard/keyboard_key.dart';
import 'package:flutter/foundation.dart';

///Classe permettant d'initialiser, stocker et mélanger les touches du clavier
///ChangeNotifier --> permet d'avertir les listeners quand la liste est modifiée
class KeysProvider with ChangeNotifier {
  List<KeyboardKey> keys;

  ///Initialise la liste des touches du clavier, en y mettant tous les caractères présents dans la liste chars de Utils
  void initKeys() {
    keys = List<KeyboardKey>();
    for (String char in Utils.chars) {
      keys.add(
        KeyboardKey(
          char: char,
        ),
      );
    }
  }

  ///Mélanger liste de touches utilisées par le clavier
  void shuffleKeys() {
    keys.shuffle();
    /*keys.forEach((element) {
      print(element.char);
    });*/
    notifyListeners();
  }
}
