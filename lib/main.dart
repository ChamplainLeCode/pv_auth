import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pv_auth/User.dart';

import 'pages.dart';

Map<String, Widget> routes = {
  '/' : LoginPage(),
  "/admin": AdminPage(),
  "/friends": FriendsPage(),
  "/home": HomePage(),
  "/photos": PhotoPage(),
  "/privileges": PrivilegesPage(),
  "/profile": ProfilePage(),
  "/publication": Publication(),
  "/setting": SettingPage(),
  "/story": StoryPage(),
  "/users": UserPage()
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_c) => routes[_.name], settings: _),
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double hauteur = 250;
  Size size;
  int step = 0;
  StreamController<Color> colorsStream = StreamController.broadcast();
  List<Color> colors = [
    Colors.white, Colors.red, Colors.teal, Colors.limeAccent, Colors.orange
  ];
  Random generator;// = Random(colors.length);
  TextEditingController passController, matController;
  String error = '';

  @override
  void initState(){
    super.initState();
    passController = TextEditingController();
    matController = TextEditingController();
    generator = Random(colors.length);
    Future.delayed(Duration(seconds: 2)).then((_) async {
      while(true){
        int ind = generator.nextInt(colors.length);;
        colorsStream.add(colors[ind]);
        await Future.delayed(Duration(seconds: 2));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset("images/bg1.jpg").image,
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: hauteur,
                padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
                color: Colors.transparent,
                child: Center(child:  step == 0 ? Text("LE MEILLEUR DE LA LITTÉRATURE", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 34, color: Colors.white), textAlign: TextAlign.justify) :
                (step == 1 ? Text("Connectez-vous pour accéder à vos livres favoris", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 24, color: Colors.white)) : 
                  Text("Votre inscription, LA VOIE DU SALUT!!!", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white))
                ))
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: size.width,
                color: Colors.transparent,
                height: step == 1 ? (size.height - 2*hauteur) : step == 2 ? size.height - hauteur - 100:  (size.height - hauteur)/2,
                child: step == 0 ? Center(child: Text("NE MANQUEZ RIEN !!!", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 34, color: Colors.white), textAlign: TextAlign.justify)) : 
                (
                  step == 1 ? 
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: size.width,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Matricule",
                              border: InputBorder.none
                            ),
                            controller: matController
                          ),
                        ),
                        Container(
                          height: 40,
                          width: size.width,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Mot de passe",
                              border: InputBorder.none
                            ),
                            controller: passController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text("N'oubliez pas que la lecture est la clé de toute science littéraire",
                            style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.w200),
                            textAlign: TextAlign.justify,
                          ),
                          width: size.width,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: RaisedButton(
                            child: Text("Se connecter"),
                            onPressed: connexion,
                          ),
                          width: size.width,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(error, style: TextStyle(color: Colors.red),),
                          width: size.width,
                        )
                        
                      ],
                    ),
                  ):
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text("SEND ME AN ORANGE MONEY :) to 698 128 155", style: TextStyle(color: Colors.white60, fontSize: 30), textAlign: TextAlign.justify,),
                    )
                  )
                )
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: step == 1 ? size.height - (size.height - 2*hauteur) - hauteur : step == 2 ? 100 : (size.height - hauteur)/2,
                child: Center(
                  child: StreamBuilder<Color>(
                    stream: colorsStream.stream,
                    initialData: Colors.white,
                    builder: (_, snap){

                        return Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(color: snap.data, blurRadius: 30),
                            ]
                          ),
                          child: FlatButton(
                            onPressed: () => Future.delayed(Duration(milliseconds: 5))
                                    .then(((_) {
                                      setState(() {
                                        switch(step){
                                          case 0: hauteur = 150; step = 1; break;
                                          case 1: hauteur = 100; step = 2; break;
                                          case 2: hauteur = 250; step = 0; break;
                                        }
                                      });
                                    })),
                            child: Text(step == 0 ? "Commençons !!!" : step == 1 ? "Passer" : "S'inscrire")
                          )
                        );
                    },
                  )
                )
              )
          ],
        )
      )
    );
  }

  void connexion(){
    if(matController.text.trim().length != 0 && passController.text.trim().length != 0)
      http.get("http://51.83.97.203/pv_auth?matricule="+matController.text+"&password="+passController.text).then((res){
        Map response = jsonDecode(res.body);
        print("status = "+response.toString());

        if(response['status'] == 100){
          setState(() {
            error = response['error'];
          });
        }else{
          User u = User.builder()
                       .matricule(matController.text)
                       .password(passController.text)
                       .access(response['access'])
                       .build();
          Navigator.of(context).pushReplacementNamed('/home', arguments: u);
        }
      });
    }
}
