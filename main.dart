import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart'; // Fixed path
import 'utils/routes.dart';            // Fixed path
import 'utils/theme.dart';             // Fixed path

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase Initialization Error: $e");
    return; // Early exit on error
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CU Today',
        initialRoute: '/',
        routes: appRoutes, // Use defined routes
        theme: appTheme, // Use defined theme (not CustomTheme)
      ),
    );
  }
}
