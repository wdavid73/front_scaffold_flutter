import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_scaffold_flutter/app/app.dart';
import 'package:front_scaffold_flutter/utils/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // ENVIRONMENT VARIABLES
  await dotenv.load();
  AppConfig.initialize();

  runApp(const MyApp());
}
