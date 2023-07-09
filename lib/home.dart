import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:berita/detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Http')),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(_posts[index]['urlToImage'])
                  : const Center(),
            ),
            title: Text('${_posts[index]['title']}'),
            subtitle: Text('${_posts[index]['description']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => Detail(articleData: _posts[index])),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _getData() async {
    try {
      const baseUrl =
          'https://newsapi.org/v2/everything?q=tesla&from=2023-06-09&sortBy=publishedAt&apiKey=fee65d12298e44e4aa3aa44e0f02f6be';
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _posts = List<Map<String, dynamic>>.from(data['articles']);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
