import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class Detail extends StatelessWidget {
  final Map<String, dynamic> articleData;

  const Detail({Key? key, required this.articleData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                color: Colors.grey[200],
                child: articleData['urlToImage'] != null
                    ? Image.network(
                        articleData['urlToImage'],
                        fit: BoxFit.cover,
                      )
                    : const Center(),
              ),
              const SizedBox(height: 20),
              Text(
                articleData['title'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                articleData['publishedAt'],
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 10),
              ExpandableText(
                articleData['content'],
                expandText: 'Show more',
                collapseText: 'Show less',
                maxLines: 3,
                linkColor: Colors.blue,
                style: TextStyle(fontSize: 16),
              ),
              const Divider(),
              Text('Author: ${articleData['author']}'),
              Text('Source: ${articleData['source']['name']}'),
            ],
          ),
        ),
      ),
    );
  }
}
