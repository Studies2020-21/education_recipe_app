import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:education_recipe_app/widgets/app_drawer.dart';

Future<Api> fetchApi() async {
  final response = await http.get('https://virtserver.swaggerhub.com/tilman82/Educational_Recipes/1.0.1/recipes/search/pizza');

  if (response.statusCode == 200) {
    return Api.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load api');
  }
}

class Api {
  final int id;
  final String title;

  Api({this.id, this.title});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      id: json['id'],
      title: json['title'],
    );
  }
}

class SwaggerScreen extends StatefulWidget {
  static const routeName = '/swagger';

  @override
  _SwaggerScreenState createState() => _SwaggerScreenState();
}

class _SwaggerScreenState extends State<SwaggerScreen> {
  Future<Api> futureApi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('swagger.io API'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child:
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Click the button to send a GET request to the swagger API endpoint with a (mocked) search for "pizza"...'),
              SizedBox(height: 15),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    setState((){
                      futureApi = fetchApi();
                    });
                  },
                  child: new Text("Send request"),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: FutureBuilder<Api>(
                  future: futureApi,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text('ID: ' + snapshot.data.id.toString()),
                          Text('Title: ' + snapshot.data.title),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
