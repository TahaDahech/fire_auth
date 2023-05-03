import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/HomeScreen");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        if (userCredential != null) {
          await userCredential.user!.sendEmailVerification();
          Navigator.of(context).pop();
          Navigator.pushNamed(context, "/LoginScreen");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter Email';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          onSaved: (input) => _email = input!,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              return 'Provide Minimum 6 Character';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input!,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: signUp,
                          child: Text('Sign up'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
