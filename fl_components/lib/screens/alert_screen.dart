import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      //builder es un codigo que construye un widget
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Este es el contenido de la caja de la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      //builder es un codigo que construye un widget
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Titulo'),
          content: const Text('Este es el contenido de la caja de la alerta'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          /*style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            shape: const StadiumBorder(),
            elevation: 100
          ),*/
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Mostrar alerta',
              style: TextStyle(fontSize: 20),
            ),
          ),
          onPressed: () =>
              (Theme.of(context).platform == TargetPlatform.android)
                  ? displayDialogAndroid(context)
                  : displayDialogIOS(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
