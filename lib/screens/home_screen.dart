import 'dart:convert';

import 'package:api_app/api_models/api_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ApiModels> getApiList = [];
  bool _isLoding = false;


  @override
  void initState() {
    getApi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Practice', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: _isLoding ?Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: getApiList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(getApiList[index].title ?? ''),
                leading:ClipOval(
                  child: Container(
                    color: Colors.white,
                    height: 50,
                    width: 50,
                    child: Image.network(getApiList[index].thumbnailUrl??'Image isnt show'),
                  ),
                ) ,
              ),
            ),
          );
        },
      ),
    );
  }


  Future getApi() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    Uri uri = Uri.parse(url);

    Response response = await get(uri);
    print(response.toString());

    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);
      print(responseBody);
      for (var apiData in responseBody) {
        ApiModels apiModels = ApiModels.fromJson(apiData);
        getApiList.add(apiModels);
      }
      _isLoding = false;
      setState(() {});
    }
  }
}
