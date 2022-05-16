import 'package:blind_side/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform; // Its required for emulator
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Outside of any class or methods, before main()
const bool _useEmulator = true;

void main() async {
  //  concrete binding for applications based on the Widgets framewor
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set app to run on firebase emulator
  if (_useEmulator) {
    await _connectToEmulator();
  }
  runApp(ProviderScope(child: (MyApp(prefs))));
}

// Outside of main, preferably at the end of the file
// Settings for firebase emulator connection
Future _connectToEmulator() async {
  // Provide url to the emulator, localhost might not work on android emulator.
  final host = Platform.isAndroid ? '22.0.4.08' : 'localhost';
  // Provide port for all the local emulator prodcuts
  const authPort = 9099;
  const firestorePort = 8080;
  const functionsPort = 5001;
  const storagePort = 9199;

  // Just to make sure we're running locally
  print("I am running on emulator");

  // Instruct all the relevant firebase products to use the firebase emulator
  await FirebaseAuth.instance.useAuthEmulator(host, authPort);
  FirebaseFirestore.instance.useFirestoreEmulator(host, firestorePort);
  FirebaseFunctions.instance.useFunctionsEmulator(host, functionsPort);
  FirebaseStorage.instance.useStorageEmulator(host, storagePort);
}
