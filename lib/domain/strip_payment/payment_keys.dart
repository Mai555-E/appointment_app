import 'package:flutter_dotenv/flutter_dotenv.dart' as dot;

class DotenvServices {
  static final secretKey =  dot.dotenv.env['Strip_Secret_Key'];
  //String.fromEnvironment('Strip_Secret_Key');
  //
}

abstract class PaymentKeys {
  static String publishedKey =
      'pk_test_51RQqC6I16Jl67WXbqOoVN7t83BnMYNDi4ZgsDu4bdltbXyF5D0rNA9CvookWkBaxN8DdheDEZc2pjloMCwsa6i7600wI3jCfxf';

  static String secretKeys = DotenvServices.secretKey!;
}
