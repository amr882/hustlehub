import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hustlehub/features/core/view/continue_as.dart';
import 'package:hustlehub/features/core/view/splash_screen.dart';
import 'package:hustlehub/firebase_options.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: {"continue_as": (context) => ContinueAs()},
        );
      },
    );
  }
}













// lib/
// ├── features/         
// │   ├── client/          
// │   │   ├── screens/     
// │   │   ├── widgets/
// │   │   └── client_dashboard_screen.dart
// │   │
// │   └── freelancer/  
// │       ├── screens/
// │       ├── widgets/
// │       └── freelancer_profile_screen.dart
// │
// ├── core/               
// │   ├── constants/       
// │   ├── services/        
// │   ├── models/          
// │   └── widgets/
// │
// └── main.dart