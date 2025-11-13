import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hustlehub/features/client/view/client_account_setup.dart';
import 'package:hustlehub/features/client/view/client_home_page.dart';
import 'package:hustlehub/features/core/auth/user_db.dart';
import 'package:hustlehub/features/core/view/continue_as.dart';
import 'package:hustlehub/features/core/view/onboarding.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/freelancer_setup_account.dart';
import 'package:hustlehub/features/freelancer/view/freelancer_home_page.dart';
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
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final User? user = snapshot.data;

              if (user == null) {
                return const Onboarding();
              } else {
                return FutureBuilder<Map<String, dynamic>?>(
                  future: UserDb().getUserData(),
                  builder: (context, dataSnapshot) {
                    if (dataSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final Map<String, dynamic>? userData = dataSnapshot.data;
                    final String? userRole = userData?['user_role'] as String?;
                    final bool accountSetup =
                        userData?['account_setup'] as bool? ?? false;

                    if (userRole == 'freelancer') {
                      return accountSetup
                          ? const FreelancerHomePage()
                          : const FreelancerSetupPage();
                    } else if (userRole == 'client') {
                      return accountSetup
                          ? const ClientHomePage()
                          : const ClientAccountSetup();
                    } else {
                      return const ContinueAs();
                    }
                  },
                );
              }
            },
          ),
          routes: {"continue_as": (context) => const ContinueAs()},
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