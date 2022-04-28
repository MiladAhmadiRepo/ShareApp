import 'package:flutter/material.dart';
import 'package:key_global_example/main.dart';
import 'package:key_global_example/widget/button_widget.dart';
import 'package:key_global_example/widget/text_row_widget.dart';

class FormKeyPage extends StatefulWidget {
  @override
  _FormKeyPageState createState() => _FormKeyPageState();
}

class _FormKeyPageState extends State<FormKeyPage> {
  /// --1--
  //یک global key از توع کلاس state فرزندی که میخواهیم
  //به مقادیرش دسترسی داشته باشیم میسازیم
  // در اینجا از توع FormState است
  // که کلاس sate کلاس form از ویجت های خود فلاتر هست
  final formKey = GlobalKey<FormState>();

  bool isSignedIn = false;
  String email = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: isSignedIn ? buildHome() : buildLogin(),
      );

  Widget buildLogin() =>
      ///--2--
  //در زمان نمونه ساختن از کلاس فرزند کلید global
  // را به عتوان key به آن پاس میدهیم
      Form(
        ///--3--
        //در سازنده فرزند کلید global رو گرفته و به super
        //پاس میدهیم
        //که در اینجا کلاس داخلی فلاتر هست
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && !value.contains('@')
                  ? 'Not a Valid Email!'
                  : null,
              ///--4--
              //مقداری که کاربر وارد کرده در داخل متغییر ذخیره کرده
              onSaved: (value) => email = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Username needs 3 characters.'
                  : null,
              ///--4--
              //مقداری که کاربر وارد کرده در داخل متغییر ذخیره کرده
              onSaved: (value) => username = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Password needs 3 characters.'
                  : null,
              ///--4--
              //مقداری که کاربر وارد کرده در داخل متغییر ذخیره کرده
              onSaved: (value) => password = value!,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Submit',
              onClicked: submit,
            ),
          ],
        ),
      );

  Widget buildHome() => Container(
        padding: EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextRowWidget(title: 'Email', value: email),
            TextRowWidget(title: 'User', value: username),
            TextRowWidget(title: 'Password', value: password),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Sign Out',
              onClicked: () => setState(() => isSignedIn = false),
            ),
          ],
        ),
      );

  void submit() {
    ///--5--
    //حالا میتوان به وسیله کلید به
    //متغییرها و توابع در کلاس state فرزند دسترسی داشت
    final form = formKey.currentState!;

    if (form.validate()) {
      ///--6--
      //برای دریافت مقادیری که کاربر وارد کرده باید متد save
      //را صدا بزنیم
      form.save();

      setState(() => isSignedIn = true);
    }
  }
}
