

import 'package:flutter/material.dart';

void main(){
  String mesaj = "Merhaba İlk Uygulamam!";
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Sonucu Gör"),
          onPressed: (){
            var alert = AlertDialog(
              title: Text("Sınav Sonucu"),
              content: Text("Geçti"),
            );
            showDialog(context: context, builder: (BuildContext context)=>alert);
          },
        ),
      ),
    ),
  ));
}

class MyApp extends StatelessWidgets{

}