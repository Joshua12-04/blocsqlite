import 'dart:io';
import 'package:blocsqlite/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    pantalla();
  }
  if (Platform.isAndroid || Platform.isIOS) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  runApp(const App());
}

void pantalla() {
  const Size size = Size(800, 800);
  setWindowMaxSize(size);
  setWindowMinSize(size);

  getWindowInfo().then((window) {
    final Screen? screen = window.screen;
    if (screen != null) {
      final Rect screenFrame = screen.visibleFrame;
      final double left = screenFrame.left + (screenFrame.width - size.width) / 2;
      final double top = screenFrame.top + (screenFrame.height - size.height) / 2;
      setWindowFrame(Rect.fromLTWH(left, top, size.width, size.height));
    }
  });
}
