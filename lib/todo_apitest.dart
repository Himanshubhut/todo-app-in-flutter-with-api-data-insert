import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/todo_api.dart';

class TodoApi extends StatefulWidget {
  const TodoApi({super.key});

  @override
  State<TodoApi> createState() => _TodoApiState();
}

class _TodoApiState extends State<TodoApi> {
  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();

  void setdata() async {
    try {
      String title = txt.text;
      String details = txt1.text;

      var uri = Uri.https('akashsir.in', '/myapi/crud/todo-add-api.php');
      var response = await http
          .post(uri, body: {'todo_title': title, 'todo_details': details});
      print('Response Status : ${response.statusCode}');
      print('Response Body : ${response.body}');
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txt,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Title',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: txt1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Details',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                setdata();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tododata()),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
