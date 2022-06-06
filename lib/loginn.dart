import 'package:flutter/material.dart';
import 'package:login_fb/authentication_service.dart';
import 'package:login_fb/singUp.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  const Login({ Key key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuario ;
   TextEditingController contrasena;

  @override
  void initState() {
    super.initState();
    usuario = new TextEditingController();
    contrasena = new TextEditingController();
  }

  @override
  void dispose() {
    usuario.dispose();
    contrasena.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black38,
              blurRadius: 25.0,
              spreadRadius: 25.0,
              offset: Offset(15.0, 15.0))
        ], color: Colors.teal, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 150, /*color: Colors.black87,*/
              ),
              Text(
                "INICIO DE SESION",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 20, 0),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                      controller: usuario,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Usuario')),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 15),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                      controller: contrasena,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña')),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    child: Text(
                      "Ingresar",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                                      context.read<AuthenticationService>().signIn(
                            email: usuario.text,
                            password: contrasena.text,
       
                  );
                      
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    child: Text(
                      "Nuevo usuario",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () => 
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingUp())),
                    //print("boton de nuevo usuario");
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
