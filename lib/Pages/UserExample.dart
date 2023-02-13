import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '../Models/UserModel.dart';
import 'package:http/http.dart' as http;


class UserExample_Api extends StatefulWidget {
  const UserExample_Api({Key? key}) : super(key: key);

  @override
  State<UserExample_Api> createState() => _UserExample_ApiState();
}

class _UserExample_ApiState extends State<UserExample_Api> {

  // Get user data form Api

  List<UserModels> userList=[];
  Future<List<UserModels>> getUserApi() async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data=jsonDecode(response.body.toString());

    // print(data);

    if(response.statusCode== 200){
      for(Map i in data){
        userList.add(UserModels.fromJson(i));
      }
      return userList;
    }
    else{
      return userList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User Api'),),
        body: FutureBuilder(
          future: getUserApi(),
          builder: (context ,AsyncSnapshot<List<UserModels>> snapshot){

            if(snapshot.hasData){
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context , index){
                  return UserPageDesign(
                    snapshot.data![index].name.toString(),
                    snapshot.data![index].email.toString(),
                    snapshot.data![index].address.city.toString(),
                    snapshot.data![index].address.street.toString(),
                    snapshot.data![index].address.zipcode.toString(),
                    snapshot.data![index].phone.toString(),
                    snapshot.data![index].website.toString(),
                  );
                },
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

  // User Data Widget Design

  Widget UserPageDesign(String f_name,email,city,streat,zipC,phone,web){
    final GlobalKey<ExpansionTileCardState> cardA= new GlobalKey();
    final GlobalKey<ExpansionTileCardState> cardB= new GlobalKey();
    return Card(
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        key: cardA,
        leading: Icon(Icons.account_circle,size: 40,),
        title: Text(f_name),
        subtitle: Text(email),
        children: <Widget>[
          Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text('User Address',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              SizedBox(height: 8,),
              Row(children: [
                Text('City:'),
                Spacer(),
                Text(city),
              ],),
              SizedBox(height: 8,),
              Row(children: [
                Text('Street:'),
                Spacer(),
                Text(streat),
              ],),
              SizedBox(height: 8,),
              Row(children: [
                Text('ZipCode:'),
                Spacer(),
                Text(zipC),
              ],),
              SizedBox(height: 8,),
              Row(children: [
                Text('Phone:'),
                Spacer(),
                Text(phone),
              ],),
              SizedBox(height: 8,),
              Row(children: [
                Text('WebSite:'),
                Spacer(),
                Text(web),
              ],),
            ],),
          ),
        ],
      ),
    );
  }