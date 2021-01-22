import 'package:flutter/Material.dart';

///Page de fin qui annonce qu'on a gagné
class EndScreen extends StatelessWidget {
  //chemin pour accéder à la page
  static const routeName = '/end_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Vous avez gagné !"),
      ),
    );
  }
}
