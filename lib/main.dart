import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseOptions = const FirebaseOptions(
      apiKey: 'AIzaSyBl26KzZh8XfNnjWN-JSPQaOeVK7fuuFds',
      appId: '1:894359376187:android:fa22f9b2ec4c0547d9a71e',
      messagingSenderId: '894359376187',
      projectId: 'flutterauthenticationdemofr');
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPageState(),
    );
  }
}

class LoginPageState extends StatefulWidget {
  const LoginPageState({super.key});

  @override
  LoginPageBody createState() => LoginPageBody();
}

class LoginPageBody extends State<LoginPageState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> f() async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SignedPage(credential: userCredential)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN PAGE'),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image:
                  AssetImage('assets/set-background-image-flutter-hero.webp'),
              fit: BoxFit.cover,
            )),
            child: Form(
                child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: SizedBox(
                        width: 300,
                        height: 70,
                        child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email--',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                            ))
                            
                            
                            
                            )),
                SizedBox(
                    width: 300,
                    height: 70,
                    child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password--',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ))),
                ElevatedButton(
                  onPressed: f,
                  child: const Text('Sign In'),
                ),
              ],
            ))));
  }
}

// ignore: camel_case_types
class SignedPage extends StatelessWidget {
  SignedPage({super.key, credential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGINED PAGE'),
      ),
      body: const Center(child: Text('Logined SuccesFully!')),
    );
  }
}
