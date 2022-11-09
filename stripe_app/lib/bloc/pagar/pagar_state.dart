part of 'pagar_bloc.dart';

@immutable
class PagarState {
  final double montoPagar;
  final String moneda;
  final bool tarjetaActiva;
  final TarjetaCredito? tarjeta;

  String get montoPagarString => montoPagar.toStringAsFixed(2);

  PagarState(
      {this.montoPagar = 375.55,
      this.moneda = 'USD',
      this.tarjetaActiva = false,
      this.tarjeta});

  PagarState copyWith(
          {double montoPagar = 375.55,
          String moneda = 'USD',
          bool tarjetaActiva = false,
          TarjetaCredito? tarjeta}) =>
      PagarState(
          montoPagar: montoPagar ?? this.montoPagar,
          moneda: moneda ?? this.moneda,
          tarjetaActiva: tarjetaActiva ?? this.tarjetaActiva,
          tarjeta: tarjeta ?? this.tarjeta);
}
