import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';


class Education extends StatefulWidget {


  @override
  EducationPageState createState() => EducationPageState();
}

class EducationPageState extends State<Education> {

  @override
  Widget build(BuildContext context) {

    Card research_report() {
      var heading = 'EDUCATION FOR EVERY CHILD';
      var subheading = 'Evron’s work is grounded in empirical data, rigorous research and thoughtful analysis.';
      var cardImage = NetworkImage(
          'https://cbsnews1.cbsistatic.com/hub/i/2017/01/06/22b7dc6b-43db-415c-b367-29b75bad2bc1/chbok.jpg');
      var supportingText ='Evron combines its experience, research and analysis to create programmes, campaigns and initiatives wherever they are needed most. Explore our reports to see how data can lead to change.';
      return Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Text(heading),
                subtitle: Text(subheading),
                trailing: Icon(Icons.favorite_outline),
              ),
              Container(
                height: 200.0,
                child: Ink.image(
                  image: cardImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(supportingText),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    child: const Text(''),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: const Text('LEARN MORE'),
                    onPressed: () {/* ... */},
                  )
                ],
              )
            ],
          ));
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome To Envron",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => HomePage(),
                  )
              );

            }

        ),
        actions: <Widget>[],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  research_report(),
                  SizedBox(
                    height: 20,
                  ),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
