import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stripe_app/models/payment_intent_response.dart';
import 'package:stripe_app/models/stripe_custom_response.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  StripeService._privateConstructor();
  static final StripeService instance = StripeService._privateConstructor();
  factory StripeService() => instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  static String secretKey =
      'sk_test_51M216IHW6htYAoeGPKsJLSlTDS5RnsvDCHjfi5KWjQIOMBewdOfSwNoDvbuxcPKndyTD34N83KSupu0NXqaj0iuN00lXkQ402S';
  final String _apiKey =
      'pk_test_51M216IHW6htYAoeGvUTUg6jMi5n3LpZOrlEOFQRTr3k8289iTii9FDsr14QcfadHFY4VHWNefud4c2CIiQAJVA9r004rjTl4YS';

  final headerOptions = Options(
    contentType: Headers.formUrlEncodedContentType,
    headers: {
      'Authorization': 'Bearer ${StripeService.secretKey}',
    },
  );

  void init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: _apiKey,
        merchantId: 'test',
        androidPayMode: 'test',
      ),
    );
  }

  Future<StripeCustomResponse> pagarConTarjetaExiste(
      {required String amount,
      required String currency,
      required CreditCard card}) async {
    try {
      final paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest(card: card),
      );
      final resp = await _realizarPago(
          amount: amount, currency: currency, paymentMethod: paymentMethod);
      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, message: e.toString());
    }
  }

  Future<StripeCustomResponse> pagarConNuevaTarjeta({
    required String amount,
    required String currency,
  }) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      );
      final resp = await _realizarPago(
          amount: amount, currency: currency, paymentMethod: paymentMethod);
      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, message: e.toString());
    }
  }

  Future pagarConApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {}

  Future<PaymentIntentResponse> _crearPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final dio = Dio();
      final data = {
        'amount': amount,
        'currency': currency,
      };
      final resp = await dio.post(_paymentApiUrl,
          data: jsonEncode(data), options: headerOptions);
      return PaymentIntentResponse.fromJson(resp.data);
    } catch (e) {
      print(e);
      return PaymentIntentResponse(status: '400');
    }
  }

  Future<StripeCustomResponse> _realizarPago(
      {required String amount,
      required String currency,
      required PaymentMethod paymentMethod}) async {
    try {
      final paymentIntent = await _crearPaymentIntent(
        amount: amount,
        currency: currency,
      );
      final paymentResult = await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntent.clientSecret,
          paymentMethodId: paymentMethod.id,
        ),
      );

      if (paymentResult.status == 'succeeded') {
        return StripeCustomResponse(ok: true);
      } else {
        return StripeCustomResponse(
            ok: false, message: 'Fallo al realizar el pago');
      }
    } catch (e) {
      return StripeCustomResponse(ok: false, message: e.toString());
    }
  }
}
