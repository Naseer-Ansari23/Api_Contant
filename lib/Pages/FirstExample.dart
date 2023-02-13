import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/PostModels.dart';
import 'package:http/http.dart' as http;

class FirstExample_API extends StatefulWidget {
  const FirstExample_API({Key? key}) : super(key: key);

  @override
  State<FirstExample_API> createState() => _FirstExample_APIState();
}

class _FirstExample_APIState extends State<FirstExample_API> {

  List<postModels> postList=[];
  Future<List<postModels>> getPostApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(postModels.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('First Example Api'),),
        body: FutureBuilder(
          future: getPostApi(),
          builder: (context , snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                 itemCount: postList.length,
                  itemBuilder: (context , index){
                    return FirstApiDesign(
                        postList[index].title.toString(),
                        postList[index].body.toString(),
                    );
                  }
              );
            }else{
              return Center(child: Text('Loading'));
            }
          },
        ),
      ),
    );
  }
}

    // Api Widget Design

    Widget FirstApiDesign(String title,body){
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

