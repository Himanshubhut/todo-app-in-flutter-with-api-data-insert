import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tododata extends StatefulWidget {
  const Tododata({super.key});

  @override
  State<Tododata> createState() => _TododataState();
}

class _TododataState extends State<Tododata> {
  Future? mydata;
  var mydatalist = [];

  Future<List> fetchData() async {
    try {
      var url = Uri.https('akashsir.in', '/myapi/crud/todo-list-api.php');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map<String, dynamic> mymap = json.decode(response.body);
      mydatalist = mymap['todo_list'];

      return mydatalist;
    } catch (error) {
      throw error;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    mydata = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: mydata,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        if (snapshot.hasError)
          return Center(child: Text('Somthing went wrong'));
        return Scaffold(
          body: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(
                      'ID : ${snapshot.data[index]['todo_id'].toString()}'),
                  title: Text(
                      'Username : ${snapshot.data[index]['todo_title'].toString()}'),
                  subtitle: Text(
                      'Name : ${snapshot.data[index]['todo_details'].toString()}'),
                  trailing: Text(
                      'Time : ${snapshot.data[index]['todo_datetime'].toString()}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
