import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': 'Francisco',
      'apellido': 'García',
      'email': 'francisco123@gmail.com',
      'password': '123456',
      'role': 'Admin',
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text("inputs"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                onChanged: () {
                  print("Form changed");
                },
                child: Column(
                  children: [
                    CustomImputField(
                        labelText: 'Nombre',
                        hintText: 'Ingrese su nombre',
                        helperText: 'Solo letras',
                        icon: Icons.person,
                        suffixIcon: Icons.accessibility_new,
                        formProperty: 'nombre',
                        formValues: formValues),
                    const SizedBox(height: 20),
                    CustomImputField(
                        labelText: 'Apellido',
                        hintText: 'Ingrese su apellido',
                        helperText: 'Solo letras',
                        icon: Icons.person,
                        suffixIcon: Icons.person,
                        formProperty: 'apellido',
                        formValues: formValues),
                    const SizedBox(height: 20),
                    CustomImputField(
                        labelText: 'Email',
                        hintText: 'Ingrese su email',
                        icon: Icons.email,
                        suffixIcon: Icons.alternate_email,
                        keyboardType: TextInputType.emailAddress,
                        formProperty: 'email',
                        formValues: formValues),
                    const SizedBox(height: 20),
                    CustomImputField(
                      labelText: 'Password',
                      hintText: 'Ingrese su password',
                      icon: Icons.lock,
                      suffixIcon: Icons.lock_person_rounded,
                      obscureText: true,
                      formProperty: 'password',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      value: formValues['role'],
                      items: const [
                        DropdownMenuItem(
                          value: 'Admin',
                          child: Text('Admin'),
                        ),
                        DropdownMenuItem(
                          value: 'Superuser',
                          child: Text('Superuser'),
                        ),
                        DropdownMenuItem(
                          value: 'Dev',
                          child: Text('Dev'),
                        ),
                        DropdownMenuItem(
                          value: 'Guest',
                          child: Text('Guest'),
                        ),
                      ],
                      onChanged: (value) {
                        formValues['role'] = value ?? 'Admin';
                      },
                      decoration: const InputDecoration(
                        labelText: 'Role',
                        hintText: 'Seleccione un rol',
                        icon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (!_formKey.currentState!.validate()) {
                          print('fomulario no valido');
                          return;
                        }
                        print(formValues);
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Enviar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
