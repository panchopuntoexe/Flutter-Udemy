part of 'pagar_bloc.dart';

@immutable
abstract class PagarEvent {}

class OnSeleccionarTarjeta extends PagarEvent {
  final TarjetaCredito tarjeta;

  OnSeleccionarTarjeta(this.tarjeta);
}

class OnDesactivarTarjeta extends PagarEvent {}

class OnCambiarMonto extends PagarEvent {
  final double monto;

  OnCambiarMonto(this.monto);
}

class OnPagar extends PagarEvent {}

class OnMostrarTarjeta extends PagarEvent {}

class OnDesactivarTarjetaManualmente extends PagarEvent {}

class OnActivarTarjetaManualmente extends PagarEvent {}

class OnDesactivarBotonPagar extends PagarEvent {}

class OnActivarBotonPagar extends PagarEvent {}

class OnDesactivarBotonManualmente extends PagarEvent {}

class OnActivarBotonManualmente extends PagarEvent {}


