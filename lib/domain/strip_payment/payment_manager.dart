import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'payment_keys.dart';

abstract class PaymentManager {
  
  static Future<bool> makePayment(int amount, String currency) async {
    try {
      String clientSecret = await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
    
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(paymentIntentClientSecret: clientSecret, merchantDisplayName: 'Mai'));
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();

    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {'Authorization': "Bearer ${PaymentKeys.secretKeys}", 'Content-Type': 'application/x-www-form-urlencoded'},
        ),
        data: {'amount': amount, 'currency': currency, 'automatic_payment_methods[enabled]': 'true'},
      );

      // Must use 'client_secret' not 'clientSecret'
      return response.data['client_secret'];
    } catch (e) {
      if (e is DioException) {
        print(" Strip is not working  ${e.response?.data}");
      }
      rethrow;
    }
  }
}
