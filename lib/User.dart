class User{

  final String matricule, password;
  final List<String> access;

  User(this.matricule, this.password, this.access);

  static UserBuilder builder(){
    return new UserBuilder();
  }

  String toString(){
    return {
      'matricule': matricule,
      'password': password,
      'access': access
    }.toString();
  }
}

class UserBuilder{

  String _matricule, _password;
  List<String> _access;

  UserBuilder matricule(String matricule){
    this._matricule = matricule;
    return this;
  }
  UserBuilder password(String password){
    this._password = password;
    return this;
  }
  UserBuilder access(List<dynamic> access){
    _access = [];
    access.forEach(this._access.add);
    return this;
  }
  User build() => User(this._matricule, this._password, this._access);
}