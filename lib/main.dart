import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/RegisterPage': (context) => RegisterPage(),
      '/MainPage': (context) => MainPage(),
      '/ScanPage': (context) => Scanpage(),
      '/Promotions': (context) => PromotionsPage(),
    },
  ));
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child:
          Container(
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
                            Navigator.pushNamed(context, '/MainPage');
                          }
                        ),
                      ),
                      FloatingActionButton.extended(
                        heroTag: 'register',
                        icon: Icon(Icons.book),
                        label: Text("Inscription"),
                        onPressed: (){
                          Navigator.pushNamed(context, '/RegisterPage');
                        }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Center(
        child:
          Container(
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
                            fontSize: 20,
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
                            fontSize: 20,
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
                        child: Text(
                          'Email :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        maxLength: 25,
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Entrer votre email',
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
                          heroTag: 'inscription',
                          icon: Icon(Icons.book),
                          label: Text("Inscription"),
                          onPressed: (){}
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoStyle'),
      ),
      body: Center(
        child:
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  /*1*/
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        child:
                        FlatButton(
                        color: Colors.grey[500],
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(16.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          Navigator.pushNamed(context, '/ScanPage');
                        },
                        child: Text(
                          "Scan QRCode",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child:
                      FlatButton(
                        color: Colors.grey[500],
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(16.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          Navigator.pushNamed(context, '/Promotions');
                        },
                        child: Text(
                          "Mes Promotions",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class PromotionsPage extends StatelessWidget{
  Widget _buildCard(String name, String description){
      Card card = new Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text(name),
        subtitle: Text(
          description
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    );
    return card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Promotions'),
      ),
      body: Center(
        child:
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  /*1*/
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(20.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            <Widget>[
                              _buildCard("Mock1","Description1"),
                              _buildCard("Mock2","Description2"),
                              _buildCard("Mock3","Description3"),
                              _buildCard("Mock4","Description4"),
                              _buildCard("Mock5","Description5"),
                              _buildCard("Mock6","Description6"),
                              _buildCard("Mock7","Description7"),
                              _buildCard("Mock8","Description8"),
                              _buildCard("Mock9","Description9"),
                              _buildCard("Mock10","Description10"),
                              _buildCard("Mock11","Description11"),
                              _buildCard("Mock12","Description12"),
                              _buildCard("Mock13","Description13"),
                              _buildCard("Mock14","Description14"),
                              _buildCard("Mock15","Description15"),
                              _buildCard("Mock16","Description16"),            
                            ],
                          ),
                        ),
                      ),
                    ],
                  )               
                ),
              ],
            ),
          ),
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
  String result = "";

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
        label: Text("Scanner"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}