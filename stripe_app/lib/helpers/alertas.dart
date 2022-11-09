part of 'helpers.dart';

mostrarLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      content: Row(
        children: [
          LinearProgressIndicator(),
          Text('Espere...'),
        ],
      ),
    ),
  );
}

mostrarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(titulo),
      content: Text(mensaje),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () => Navigator.pop(context),
          elevation: 5,
          textColor: Colors.blue,
        ),
      ],
    ),
  );
}
