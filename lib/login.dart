import 'package:flutter/material.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _emailTouched = false;
  bool _passwordTouched = false;

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus && !_emailTouched) {
        setState(() {
          _emailTouched = true;
        });
      }
    });

    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus && !_passwordTouched) {
        setState(() {
          _passwordTouched = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset('images/umberella.png', width: 250),
                const SizedBox(height: 20),

                // Email Field
                SizedBox(
                  width: 320,
                  //Email Validator
                  child: TextFormField(
                    focusNode: _emailFocusNode,
                    autovalidateMode: _emailTouched
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Empty Field";
                      } else if (!value.contains('@')) {
                        return "Invalid email must conatin @";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 195, 195, 195)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 25, 147, 247)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                SizedBox(
                  width: 320,
                  //Password Validator
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    obscureText: _obscurePassword,
                    autovalidateMode: _passwordTouched
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Empty Field";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 195, 195, 195)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 25, 147, 247)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login Button
                MaterialButton(
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                  color: const Color.fromARGB(255, 86, 194, 253),
                  textColor: Colors.white,
                  minWidth: 200,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("Login"),
                ),
                const SizedBox(height: 10),

                // Navigate to SignUp
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignScreen()),
                    );
                  },
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



