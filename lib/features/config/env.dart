import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GOOGLE_GEMINI_AI_API_KEY', obfuscate: true)
  static String apiKey = _Env.apiKey;
}
