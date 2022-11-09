import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/services/stripe_services.dart';

import 'bloc/pagar/pagar_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {

    //inicializamos stripe service
    StripeService()..init();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PagarBloc()),
      ],
      child: MaterialApp(
        title: 'Stripe App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'pago_completo': (_) => PagoCompletoPage(),
        },
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff284879),
          scaffoldBackgroundColor: Color(0xff21232A),
        ),
      ),
    );
  }
}
