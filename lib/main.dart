import 'package:asakatsu/components/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/foundation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    setWindowTitle('Asakatsu');
    setWindowMaxSize(const Size(1080, 1920));
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
          primarySwatch: Colors.blue, splashFactory: InkRipple.splashFactory),
      home: ScreenContainer(),
    );
  }
}
