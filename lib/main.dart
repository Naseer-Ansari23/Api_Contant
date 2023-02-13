import 'package:contant/Pages/FirstExample.dart';
import 'package:contant/Pages/First_post.dart';
import 'package:contant/Pages/Update_Post.dart';
import 'package:contant/Pages/UserExample.dart';
import 'package:flutter/material.dart';

import 'Pages/Delete_Post.dart';
import 'Pages/SecondExp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const Delete_Post_Api(),
    );
  }
}
