import 'package:flutter/material.dart';
import 'package:flutter_home_work10/utils/validate_email.dart';

import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: Key('fieldRegName'),
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldRegLastName'),
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return 'Введите фамилию';
              return null;
            },
          ),
          TextFormField(
            key: const Key('fieldRegPhone'),
            keyboardType: TextInputType.number,

            // inputFormatters: <TextInputFormatter>[
            //   WhitelistingTextInputFormatter.digitsOnly
            // ],
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value == '') return 'Заполните поле телефон';
              return null;
            },
          ),
          TextFormField(
            key: const Key('fieldRegEmail'),
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value!)) return 'Емейл не корректный';
              return null;
            },
          ),
          ElevatedButton(
              key: const Key('btmRegistr'),
              onPressed: _handleSubmit,
              child: const Text('Регистрация')),
          if (_isSuccess) const Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
