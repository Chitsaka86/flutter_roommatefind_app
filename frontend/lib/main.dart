import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart'; // Import Firebase
//import 'package:frontend/screens/login_sceen.dart'; // Import the login screen
import 'package:frontend/screens/register_screen.dart';
import 'package:frontend/screens/landlordDashboard.dart';
void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const LandlordDashboard(),
        '/register': (context) => const RegisterPage(), // Must exist
      }, 
    );
  }
}




