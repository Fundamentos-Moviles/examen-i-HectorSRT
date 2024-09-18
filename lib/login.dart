import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Color(0xFF004A4F),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF005963),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    SizedBox(width: size.width * .25),
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF003740),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF00AEAE),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF00AEAE),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF003740),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF005963),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF003740),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF00AEAE),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    SizedBox(width: size.width * .25),
                    Container(
                      width: size.width * .25,
                      height: size.height * .33,
                      decoration: BoxDecoration(
                        color: Color(0xFF005963),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * 0.80,
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50),
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF908600),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: size.width * 0.70,
                      child: TextFormField(
                        controller: user,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Correo/Usuario',
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .025),
                    SizedBox(
                      width: size.width * 0.70,
                      child: TextFormField(
                        controller: pass,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .025),

                    // Muestra el mensaje de error
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),

                    SizedBox(height: size.height * .025),
                    SizedBox(
                      width: size.width * 0.63,
                      height: size.height * 0.04,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (user.text.isEmpty || pass.text.isEmpty) {
                              errorMessage = 'Datos incompletos';
                            } else if (user.text != 'test') {
                              errorMessage = 'Usuario incorrecto';
                            } else if (pass.text != 'FDM1') {
                              errorMessage = 'Contraseña incorrecta';
                            } else {
                              errorMessage = '';
                              print('Iniciando sesión...');
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .060),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Mi primer examen, ¿estará sencillo?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}