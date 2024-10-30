import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  Login({super.key});
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _Title(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: 364,
              height: 60,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEBF0F0),
                      width: 4.0,
                    ),
                  ),
                  label: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: SizedBox(
              width: 364,
              height: 60,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFFEBF0F0),
                        width: 4.0,
                      ),
                    ),
                    label: Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Color(0xFF5250E1),
                    )),
              ),
            ),
          ),
          Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Color(0xFF5250E1)), // Define a cor de fundo
          ),
          onPressed: () async {
                  var client = http.Client();
                  var url = 'http://10.92.198.38:4000/user/login';
                  var bodyReigster = {
                    "email": "LucasSantana@gmail.com",
                    "password": "1234567890"
                  };

                  try {
                    var response = await client.post(Uri.parse(url),
                        headers: {"Content-Type": "application/json"},
                        body: json.encode(bodyReigster));
                    print(response.body);
                  } finally {
                    client.close();
                  }
                },
          child: Text(
            "Entrar",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
          _NaoPossuiConta()
        ],
      ),
    );
  }
}

class _NaoPossuiConta extends StatelessWidget {
  const _NaoPossuiConta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ainda não possui uma conta?",
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => (Login()),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cadastro",
                style: TextStyle(fontSize: 16, color: Color(0xFF5250E1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}




class _Title extends StatelessWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 40),
      child: Text(
        "Login",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
