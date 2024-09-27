import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => LoginState();
}

class LoginState extends State<SignIn> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  final Color lightgrey = const Color.fromRGBO(220, 220, 220, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.lightGreenAccent)),
                  child: Image.asset('assets/logo.png'),

                ),
              ),
            ),
            const Padding (
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text('Sign In', style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Enter email address'),
                                    EmailValidator(
                                        errorText:
                                        'Fill in with the correct email address'),
                                  ]).call,
                                  decoration: InputDecoration(
                                      hintText: 'Valid email address',
                                      hintStyle: const TextStyle(
                                        color: Colors.grey
                                      ),
                                      labelText: 'Email',
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.green,
                                      ),
                                      fillColor: lightgrey,
                                      filled: true,
                                      errorStyle: const TextStyle(fontSize: 18.0),
                                      border: const OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9.0)))))),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Enter your password'),
                                MinLengthValidator(8,
                                    errorText:
                                    'Must have at least 8 digits'),
                                PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                    errorText:
                                    'Must have at least one special character')
                              ]).call,
                              decoration: InputDecoration(
                                hintText: 'At least 8 digits and one special character',
                                hintStyle: const TextStyle(
                                    color: Colors.grey
                                ),
                                labelText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                                fillColor: lightgrey,
                                filled: true,
                                errorStyle: const TextStyle(fontSize: 18.0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    print('Submitted');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Center(
                                child: Text(
                                  'Or Sign In with',
                                  style: TextStyle(
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color: lightgrey,
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        height: 70,
                                        width: 90,
                                        child: Image.asset(
                                          'assets/facebook.png',
                                          height: 60,
                                          width: 60,
                                        )),
                                    const SizedBox(width: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: lightgrey,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      height: 70,
                                      width: 90,
                                      child: Image.asset(
                                        'assets/twitter.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: lightgrey,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      height: 70,
                                      width: 90,
                                      child: Image.asset(
                                        'assets/google.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.only(top: 50),
                              child: const Text(
                                'SIGN UP!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
