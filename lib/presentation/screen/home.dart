import 'package:flutter/material.dart';
import 'package:news_app/data/api/models/news_model.dart';
import 'package:news_app/logic/services/news_services.dart';
import 'package:news_app/presentation/screen/views.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Services.getData().then((value) {
      setState(() {
        list = value!;
      });
    });
  }

  List<NewsModel> list = <NewsModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          centerTitle: true,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewPage(
                          body: list[index].body,
                          title: list[index].title,
                        )));
              },
              child: Card(
                child: ListTile(
                  title: Text(list[index].title),
                  subtitle: Text(list[index].body),
                ),
              ),
            );
          },
        ));
  }
}
