import 'package:flutter/material.dart';
import 'package:flutter_home_work10/components/login_form.dart';
import 'package:flutter_home_work10/components/register_form.dart';

enum FormType { login, register }

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FormType _formType = FormType.login;

  _switchForm() {
    setState(() {
      _formType =
          _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _formType == FormType.login ? 'Вход' : 'Регистрация',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      _formType == FormType.login
                          ? const LoginForm()
                          : const RegisterForm(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formType == FormType.login
                          ? 'Уже есть аккаунт?'
                          : 'Еще нет аккаунта? ',
                    ),
                    TextButton(
                      key: const Key('inputButtom'),
                      onPressed: _switchForm,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: _formType == FormType.login
                                ? 'Войти'
                                : 'Регистрация',
                          )
                        ], style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
