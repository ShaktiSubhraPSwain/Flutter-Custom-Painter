import 'package:custom_paint_login/utils/utils_public.dart';
import 'package:flutter/material.dart';

import 'login_painter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            child: Container(
              height:MediaQuery.of(context).size.height/1.3,
            ),
            painter: CurvePainter(),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/12, left: 20),
            child: Text(kLogin,
            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
          ),

          Center(
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: <Widget>[
                  _inputUserName,
                  _inputPassword,
                  Container(
                    margin: const EdgeInsets.only(top: 10),
//                    padding: EdgeInsets.only(bottom: 5),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: _onTapLogin,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget get _inputUserName {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: kUserName,
          contentPadding: padding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        validator: _userNameValidator,
      ),
    );
  }

  Widget get _inputPassword {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: kPassword,
            contentPadding: padding,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
        validator: _passwordValidator,
      ),
    );
  }

  void _onTapLogin() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  String? _userNameValidator(String? value) {
    if (Validators.isValidUserName(value!)) {
      return null;
    } else {
      return kEmptyUserNameNote;
    }
  }

  String? _passwordValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return kEmptyPasswordNote;
    } else if (value!.length < 4) {
      return kValidPasswordNote;
    }
    return null;
  }
}
