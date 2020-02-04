import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

BuildContext applicontext;

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomePage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/ScanPage': (context) => Scanpage(),
    },
  ));
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    applicontext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child:connectionSection
      ),
    );
  }
}

class Scanpage extends StatefulWidget {
  @override
  ScanpageState createState() {
    return new ScanpageState();
  }
}

class ScanpageState extends State<Scanpage> {
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget connectionSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Identifiant :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                  labelText: 'Identifiant',
                  hintText: 'Entrer votre identifiant',
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez saisir un texte';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
              'Mot de passe :',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
              ),
            ),
            ),
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Entrer votre mot de passe',
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez saisir un texte';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: FloatingActionButton.extended(
                heroTag: 'conn',
                icon: Icon(Icons.touch_app),
                label: Text("Connexion"),
                onPressed: (){
                  Navigator.pushNamed(applicontext, '/ScanPage');
                }
              ),
            ),
            FloatingActionButton.extended(
              heroTag: 'register',
              icon: Icon(Icons.book),
              label: Text("Inscription"),
              onPressed: (){}
            ),
          ],
        ),
      ),
    ],
  ),
);