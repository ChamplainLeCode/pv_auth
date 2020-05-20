import 'package:flutter/material.dart';

import 'User.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User _user;


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
        actions: <Widget>[
          FlatButton(
            child: Text('Deconnexion', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w200)),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: this._user),
          )
        ],
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: getField(),
        ),
      ),
    );
  }

  List<Widget> getField(){
    List<Widget> l = [];
    this._user
      .access
      .where( (rt) => rt != '/home')
      .forEach((route){
      l.add(GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(route, arguments: this._user),
        child: Container(
          child: Center(child: Text(route.substring(1))),
        ),
      ));
    });
    return l;
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class PrivilegesPage extends StatefulWidget {
  @override
  _PrivilegesPageState createState() => _PrivilegesPageState();
}

class _PrivilegesPageState extends State<PrivilegesPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class Publication extends StatefulWidget {
  @override
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User _user;

  @override
  Widget build(BuildContext context) {
    this._user = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(_user.matricule),
      ),
      body: Center(
        child: Text(ModalRoute.of(context).settings.name),
      ),
    );
  }
}