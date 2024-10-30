import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null) Image.network(image!),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  var url = ("https://fakestoreapi.com/products/1 ");
                  var response = await http.get(Uri.parse(url));
                  var jsonResponse = convert.jsonDecode(response.body);

                  setState(() {
                    image = jsonResponse['image'];
                  });

                  print(jsonResponse['title']);
                  print(jsonResponse['price']);
                  print(jsonResponse['description']);
                  print(jsonResponse['category']);
                  print(jsonResponse['image']);
                  print(jsonResponse['rating']['rate']);
                  print(jsonResponse['rating']['count']);
                },
                child: Text("Get Data")),
          )
        ],
      ),
    );
  }
}
