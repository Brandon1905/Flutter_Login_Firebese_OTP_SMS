import 'package:flutter/material.dart';
import 'package:login_fb/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_fb/home.dart';
import 'package:login_fb/loginn.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print('HOLAAAAAAAAAAAAAAAAAAAAA');
       /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()));*/
      return Home();
      
    }
      print('55555555555555555');
     /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));*/
    return Login();
  }
}
