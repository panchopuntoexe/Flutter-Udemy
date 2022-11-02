import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    socketService.socket.on('nuevo-mensaje', (data) {
      print('nuevo-mensaje: $data');
      print('nombre: ${data['nombre']}');
      print('mensaje: ${data['mensaje']}');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${socketService.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.emit('nuevo-mensaje', {
            'nombre': 'Flutter',
            'mensaje': 'Hola desde Flutter',
          });
        },
      ),
    );
  }
}
