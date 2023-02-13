import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/Post_Models.dart';
import 'package:http/http.dart' as http;


class SecondExp_Api extends StatefulWidget {
  const SecondExp_Api({Key? key}) : super(key: key);

  @override
  State<SecondExp_Api> createState() => _SecondExp_ApiState();
}

class _SecondExp_ApiState extends State<SecondExp_Api> {

  List<Post_Models> listPost=[];
  Future<List<Post_Models>> getPostApi() async {
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data= jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        listPost.add(Post_Models(title: i['title'], body: i['body']));
      }
      return listPost;
    }
    else{
      return listPost;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Second Example'),),
        body:  FutureBuilder(
          future: getPostApi(),
          builder: (context, AsyncSnapshot<List<Post_Models>> snapshot){

            if(snapshot.hasData){
              return ListView.builder(
                itemCount: listPost.length,
                  itemBuilder: (context,index){
                    return SecondApiDesign(
                        snapshot.data![index].title.toString(),
                        snapshot.data![index].body.toString(),
                    );
                  }
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }

          },
        ),
      ),
    );
  }
}


  // Api Widget Design

  Widget SecondApiDesign(String title,body){
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.indigo[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text('Title',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
          SizedBox(height: 4,),
          Text(title),
          SizedBox(height: 4,),
          Text('Description',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
          SizedBox(height: 4,),
          Text(body),
        ],),
      ),
    );
  }

