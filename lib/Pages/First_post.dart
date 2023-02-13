
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FirstPost_Api extends StatefulWidget {
  const FirstPost_Api({Key? key}) : super(key: key);

  @override
  State<FirstPost_Api> createState() => _FirstPost_ApiState();
}

class _FirstPost_ApiState extends State<FirstPost_Api> {

  // Post Api First Example

  var nameController=TextEditingController();
  var jobController=TextEditingController();

  void OurFirstPost(String name,job) async {
    try{
      Response response = await post(
        Uri.parse('https://reqres.in/api/users'),
        body: {
          'name': name,
          'job': job,
        }
      );
      var data= jsonDecode(response.body.toString());
      print(data['name']);
      print(data['job']);

      if(response.statusCode == 201){
        print('Post Created');
      }
      else{
        print('post failed');
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Post Api'),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                hintText: 'Enter Job',
              ),
            ),
              SizedBox(height: 15,),
            ElevatedButton(
              child: Text('ADD POST'),
              onPressed: (){
                OurFirstPost(nameController.text.toString(), jobController.text.toString());
              },
            )

          ],),
        ),
      ),
    );
  }
}
