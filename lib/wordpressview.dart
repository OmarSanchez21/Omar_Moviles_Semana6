import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class WordPressPage extends StatefulWidget {
  @override
  _WordPressPageState createState() => _WordPressPageState();
}

class _WordPressPageState extends State<WordPressPage> {
  late List<dynamic> _news = [];

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('https://public-api.wordpress.com/wp/v2/sites/techcrunch.com/posts?per_page=3'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _news = data;
      });
    } else {
      throw Exception('Fallo al cargar las noticias');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de TechCrunch'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final newsItem = _news[index];
          final title = parseHtmlString(newsItem['title']['rendered']);
          final description = newsItem['excerpt'] != null ? parseHtmlString(newsItem['excerpt']['rendered']) : 'No hay descripción disponible';
          return ListTile(
            title: Text(
              parseHtmlString(title),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            onTap: () {
              launchUrl(newsItem['link']);
            },
          );
        },
      ),
    );
  }

  String parseHtmlString(String htmlString) {
    final regex = RegExp(r'<[^>]+>');
    return htmlString.replaceAll(regex, '').replaceAll('&amp;', '&');
  }
}
