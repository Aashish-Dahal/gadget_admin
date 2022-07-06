import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'presentation/screen/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
