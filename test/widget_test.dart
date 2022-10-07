import 'package:flutter/material.dart';
import 'package:flutter_home_work10/components/register_form.dart';
import 'package:flutter_home_work10/utils/validate_email.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_home_work10/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      final fieldFinderEmail = find.byKey(const Key('fieldEmail'));
      final fieldFinderPhone = find.byKey(const Key('fieldPhone'));
      final fieldFinderSubmit = find.text('Отправить');
      String email = '';
      expect(fieldFinderEmail, findsOneWidget);
      expect(fieldFinderSubmit, findsOneWidget);
      expect(fieldFinderPhone, findsOneWidget);

      bool isValid = validateEmail(email);
      await tester.enterText(fieldFinderEmail, email);
      await tester.tap(fieldFinderSubmit);
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);

      email = 'text@text.com';
      isValid = validateEmail(email);
      await tester.enterText(fieldFinderEmail, email);
      await tester.tap(fieldFinderSubmit);
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'),
          isValid ? findsNothing : findsOneWidget);

      String phone = '';
      await tester.enterText(fieldFinderPhone, phone);
      await tester.tap(fieldFinderSubmit);
      await tester.pump();
      expect(find.text('Введите телефон'), findsOneWidget);

      phone = '2';
      email = 'text@text.com';
      await tester.enterText(fieldFinderPhone, phone);
      await tester.enterText(fieldFinderEmail, email);
      await tester.tap(fieldFinderSubmit);
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
    });
  });

  group('Register view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));
/*
      FormType _formtyprv = FormType.register;

      RegisterForm;

      final fieldFinderEmailR = find.byKey(const Key('fieldRegEmail'));
      final fieldFinderPhoneR = find.byKey(const Key('fieldRegPhone'));
      final fieldFinderRegNameR = find.byKey(const Key('fieldRegName'));
      final fieldFinderRegLastNameR = find.byKey(const Key('fieldRegLastName'));

      final fieldFinderSubmitR = find.text('Регистрация');
      String email = '';
      expect(fieldFinderEmailR, findsOneWidget);
      expect(fieldFinderSubmitR, findsOneWidget);
      expect(fieldFinderPhoneR, findsOneWidget);

      bool isValid = validateEmail(email);
      await tester.enterText(fieldFinderEmailR, email);
      await tester.tap(fieldFinderSubmitR);
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);

      email = 'text@text.com';
      isValid = validateEmail(email);
      await tester.enterText(fieldFinderEmailR, email);
      await tester.tap(fieldFinderSubmitR);
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'),
          isValid ? findsNothing : findsOneWidget);

      String phone = '';
      await tester.enterText(fieldFinderPhoneR, phone);
      await tester.tap(fieldFinderSubmitR);
      await tester.pump();
      expect(find.text('Введите телефон'), findsOneWidget);

      phone = '2';
      email = 'text@text.com';
      await tester.enterText(fieldFinderPhoneR, phone);
      await tester.enterText(fieldFinderEmailR, email);
      await tester.tap(fieldFinderSubmitR);
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
      */
    });
  });
}
