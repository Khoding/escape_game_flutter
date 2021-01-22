import 'dart:math';

///Classe contenant ce qui est utile partout
class Utils {
  ///Le mot de passe généré aléatoirement
  static String password;

  ///Génère un mdp aléatoire
  static void generatePassword() {
    Random rnd = new Random();
    int passwordLength = 8;
    passwordLength += rnd.nextInt(4);
    password = "";
    for (var i = 0; i < passwordLength; i++) {
      password += chars[rnd.nextInt(chars.length)];
    }
    print("Mot de passe : $password");
  }

  ///Liste de tous les caractères utilisables pour le mdp
  static List<String> chars;

  ///Initialisation des caractères utilisables pour le mdp
  static void initChars() {
    chars = List<String>();
    //Caractères ascii de ! à ~ (+-tous les ascii imprimables)
    for (var i = 33; i <= 126; i++) {
      chars.add(String.fromCharCode(i));
    }
    //Lunes unicode, parce que c'est cool
    for (var i = 127761; i <= 127773; i++) {
      chars.add(String.fromCharCode(i));
    }
  }
}
