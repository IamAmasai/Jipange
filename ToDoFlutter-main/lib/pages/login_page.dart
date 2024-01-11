import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    // Create animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Create animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    // Start animation
    _animationController.forward();
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Add your form submission logic here
      void _submit() {
  if (_formKey.currentState.validate()) {
    setState(() {
      _isLoading = true;
    });

    // Form submission logic
    String username = _usernameController.text;
    String email = _emailController.text;

    print('Username: $username');
    print('Email: $email');

    // Simulate a delay for the form submission
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Form submitted')),
      );
    });
  }
}

      setState(() {
        _isLoading = false;
      });

      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Form submitted')),
      );
    }
  }

  Widget _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more complex email validation here
                return null;
              },
            ),
            // Add the rest of your TextFormFields here
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
            if (_isLoading)
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _buildLoginForm(),
    );
  }
}