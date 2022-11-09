import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('AuthApp-Google-Apple'),
            actions: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.doorOpen),
                onPressed: () {},
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    splashColor: Colors.transparent,
                    minWidth: double.infinity,
                    height: 50,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        Text('   Sign in with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
