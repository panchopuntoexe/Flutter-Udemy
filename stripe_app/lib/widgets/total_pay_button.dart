import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/services/stripe_services.dart';
import 'package:stripe_payment/stripe_payment.dart';

import '../helpers/helpers.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final pagarBloc = BlocProvider.of<PagarBloc>(context);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      width: width,
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '${pagarBloc.state.montoPagarString} ${pagarBloc.state.moneda} ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        BlocBuilder<PagarBloc, PagarState>(
          builder: (context, state) {
            return _BtnPay(state: state);
          },
        )
      ]),
    );
  }
}

class _BtnPay extends StatelessWidget {
  final PagarState state;
  const _BtnPay({required this.state});

  @override
  Widget build(BuildContext context) {
    return state.tarjetaActiva
        ? buildBotonTarjeta(context)
        : buildAppleAndGooglePlay(context);
  }

  @override
  Widget buildAppleAndGooglePlay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 150,
        height: 45,
        elevation: 0,
        color: Colors.black,
        shape: StadiumBorder(),
        child: Row(
          children: [
            Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Pagar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget buildBotonTarjeta(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 160,
        height: 45,
        elevation: 0,
        color: Colors.black,
        shape: StadiumBorder(),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.solidCreditCard,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Pagar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        onPressed: () async {
          mostrarLoading(context);
          final stripeService = new StripeService();
          final state = context.read<PagarBloc>().state;
          final mesAnio = state.tarjeta?.expiracyDate.split('/');

          final resp = await stripeService.pagarConTarjetaExiste(
              amount: state.montoPagarString,
              currency: state.moneda,
              card: CreditCard(
                  number: state.tarjeta!.cardNumber,
                  expMonth: int.parse(mesAnio![0]),
                  expYear: int.parse(mesAnio[1])));

          Navigator.pop(context);

          if(resp.ok){
            mostrarAlerta(context, 'Tarjeta OK', 'Todo correcto');
          }else{
            mostrarAlerta(context, 'Algo salio mal', resp.message??' ');
          }
        },
      ),
    );
  }
}
