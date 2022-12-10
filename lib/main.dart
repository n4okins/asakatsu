import 'package:asakatsu/components/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Asakatsu');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(576, 1024));
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Asakatsu",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenContainer(),
    );
  }
}
