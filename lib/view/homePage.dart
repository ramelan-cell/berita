// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'detailHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());
    print(homeC);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home News'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: homeC.dataNews.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: homeC.dataNews[i]['urlToImage'] != null
                                ? NetworkImage(homeC.dataNews[i]['urlToImage'])
                                : const NetworkImage(
                                    'https://source.unsplash.com/weekly?coding'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      homeC.dataNews[i]['title'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //     'dibuat oleh :' + homeC.dataNews[i]['author'] ??
                            //         'Noname'),
                            Text(
                                'tanggal  :' + homeC.dataNews[i]['publishedAt'])
                          ],
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailHomePage(homeC.dataNews, i))),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'readmore',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
              // return Container(
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       backgroundImage:
              //           AssetImage(homeC.dataNews[i]['urlToImage']),
              //     ),
              //     title: Text(homeC.dataNews[i]['title']),
              //   ),
              // );
            }),
      ),
    );
  }
}
