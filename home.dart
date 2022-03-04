import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as mahttp;
import '../widgets/summeryItem.dart';

import '../models/summery.dart';

class homePage extends StatelessWidget {
  static const root = "/One";

  late Summery dataSummery;

  Future summer() async {
    var resp = await mahttp.get(
      Uri.parse(
        "https://covid19.mathdro.id/api",
      ),
    );
    var data = json.decode(resp.body) as Map<String, dynamic>;
    dataSummery = Summery.fromJson(data);

    print(dataSummery.confirmed.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("COVID APPS"),
      ),
      body: FutureBuilder(
          future: summer(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(
                  "Sedang Loading Data...",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                itemCovid(
                  "Confirmed",
                  "${dataSummery.confirmed.value}",
                ),
                itemCovid(
                  "Deaths",
                  "${dataSummery.deaths.value}",
                ),
              ],
            );
          }),
    );
  }
}
