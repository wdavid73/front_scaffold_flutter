import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static late final String apiKey;
  static late final String baseUrl;
  static late final bool debugMode;

  static void initialize() {
    apiKey = dotenv.env['API_KEY'] ?? '';
    baseUrl = dotenv.env['BASE_URL'] ?? '';
    debugMode = dotenv.env['DEBUG_MODE'] == 'true';
  }
}
