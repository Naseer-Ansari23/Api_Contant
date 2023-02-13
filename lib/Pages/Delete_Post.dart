import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Delete_Post_Api extends StatefulWidget {
  const Delete_Post_Api({Key? key}) : super(key: key);

  @override
  State<Delete_Post_Api> createState() => _Delete_Post_ApiState();
}

class _Delete_Post_ApiState extends State<Delete_Post_Api> {

  // Post Api 3RD Example / Delete post with Api

  var nameController=TextEditingController();
  var jobController=TextEditingController();


  void UpdatePost(String name,job)async {

    try{
      Response response= await  put(
          Uri.parse('https://reqres.in/api/users/2'),
          body: {
            'name': name,
            'job': job,
          }
      );

      var data= jsonDecode(response.body.toString());
      print(data);

      if(response.statusCode == 200){
        print('Your Post is Deleted');
      }
      else{
        print('Failed');
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
                child: Text('Delete Post'),
                onPressed: (){
                  UpdatePost(nameController.text.toString(), jobController.text.toString());
                },
              )

            ],),
        ),
      ),
    );
  }
}
