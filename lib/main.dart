import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form-TextFormField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TextFormField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _texteditingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _texteditingcontroller,
              decoration: InputDecoration(labelText: 'Username'),
              validator: (val) {
                if (val.length < 6) {
                  if (val.isEmpty) {
                    return 'Kullanıcı Adınızı Giriniz';
                  } else {
                    return 'Kullanıcı Uzunluğu Min.6 Karakter Uzunluğunda Olmalıdır';
                  }
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Şifrenizi Girin';
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState.reset(); //Login olduktan sonra state sıfırlamak için kullanılıyor.
                if (_formKey.currentState.validate()) {
                  print("Giriş Yapıldı");
                } else {
                  print("Error");
                }
              },
              child: Text("Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState.dispose();
    super.dispose();
  }
}
