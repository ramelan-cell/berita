import 'package:flutter/material.dart';

class DetailHomePage extends StatelessWidget {
  List list;
  int index;
  DetailHomePage(this.list, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(list);
    // ignore: unused_local_variable
    var urlToImage = list[index]['urlToImage'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: urlToImage != null
                        ? NetworkImage(urlToImage)
                        : const NetworkImage(
                            'https://source.unsplash.com/weekly?coding'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(list[index]['description'])
          ],
        ),
      ),
    );
  }
}
