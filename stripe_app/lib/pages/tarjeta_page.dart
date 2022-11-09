import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

import '../models/tarjeta_credito.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TarjetaCredito? tarjeta = context.read<PagarBloc>().state.tarjeta;

    return Scaffold(
        appBar: AppBar(
          title: Text('Pagar'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.read<PagarBloc>().add(OnDesactivarTarjeta());
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: tarjeta!.cardNumberHidden,
              child: CreditCardWidget(
                cardNumber: tarjeta.cardNumber,
                expiryDate: tarjeta.expiracyDate,
                cardHolderName: tarjeta.cardHolderName,
                cvvCode: tarjeta.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
