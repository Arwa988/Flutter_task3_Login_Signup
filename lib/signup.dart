import 'package:flutter/material.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
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
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset('images/umberella.png', width: 250),
                const SizedBox(height: 20),

                // Username
                SizedBox(
                  width: 320,
                  child: TextFormField(
                    focusNode: _usernameFocusNode,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Empty Field";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      hintText: 'User Name',
                      prefixIcon: Icon(Icons.person),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 25, 147, 247)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 195, 195, 195),
                            width: 1.0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Email
                SizedBox(
                  width: 320,
                  child: TextFormField(
                    focusNode: _emailFocusNode,
                    autovalidateMode: _emailTouched
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Empty Field";
                      } else if (!value.contains('@')) {
                        return "Invalid email must contain @";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 25, 147, 247)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 195, 195, 195),
                            width: 1.0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Field
                SizedBox(
                  width: 320,
                  child: TextFormField(
                    controller: _passwordController,
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

                // Confirm Password
                SizedBox(
                  width: 320,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    obscureText: _obscurePassword,
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Empty Field";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      } else if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 25, 147, 247)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 195, 195, 195),
                            width: 1.0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Sign Up button
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid
                      print("Valid - perform sign up");
                    }
                  },
                  color: Color.fromARGB(255, 86, 194, 253),
                  textColor: Colors.white,
                  minWidth: 200,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("Sign up"),
                ),
                const SizedBox(height: 10),

                // Back to Login
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
