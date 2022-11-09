import 'package:flutter/material.dart';

import '../pages/pages.dart';

final Map<String, dynamic> appRoutes = {
  'usuarios': (BuildContext context) => UsuariosPage(),
  'chat': (BuildContext context) => ChatPage(),
  'loading': (BuildContext context) => LoadingPage(),
  'login': (BuildContext context) => LoginPage(),
  'register': (BuildContext context) => RegisterPage(),
};
