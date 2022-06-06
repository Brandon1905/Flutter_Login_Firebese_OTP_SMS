import 'package:flutter/material.dart';
import 'package:login_fb/authentication_service.dart';
import 'package:login_fb/loginn.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("INICIO"),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                //Navigator.pop(context);                
                /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));*/
              },
              child: Text("SALIR"),
            ),
          ],
        ),
      ),
    );
  }
}
