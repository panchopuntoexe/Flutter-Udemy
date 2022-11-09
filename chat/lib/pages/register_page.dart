import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/mostrar_alerta.dart';
import '../services/auth_service.dart';
import '../widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Logo(titulo: 'Registro'),
                _Form(),
                Labels(
                  titulo: '¿Ya tienes cuenta?',
                  subtitulo: 'Ingresa una ahora!',
                  ruta: 'login',
                ),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
                //_TextFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.supervised_user_circle_sharp,
              placeholder: 'Nombre',
              keyboardType: TextInputType.text,
              textController: nameCtrl),
          CustomInput(
              icon: Icons.mail_outline,
              placeholder: 'Email',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl),
          CustomInput(
              icon: Icons.password,
              isPassword: true,
              placeholder: 'Password',
              textController: passCtrl),
          BotonAzul(
              text: 'Crear Cuenta',
              onPressed: () async {
                final registroOk = await authService.register(
                    nameCtrl.text, emailCtrl.text, passCtrl.text);
                if (registroOk == true) {
                  Navigator.pushReplacementNamed(context, 'usuarios');
                } else {
                  mostrarAlerta(context, 'Registro incorrecto', registroOk);
                }
              })
        ],
      ),
    );
  }
}
