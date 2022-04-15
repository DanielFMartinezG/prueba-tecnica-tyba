class UserModel {
  UserModel({
    name,
    lastName,
    email,
    password,
  })  : _name = name,
        _lastName = lastName,
        _email = email,
        _password = password;

  UserModel.fromJson(Map json) {
    _name = json['name'];
    _lastName = json['lastName'];
    _email = json['email'];
    _password = json['password'];
  }

  String? _name;
  String? _lastName;
  String? _email;
  String? _password;

  Map<String, dynamic> toJson() => {
        'name': _name,
        'lastName': _lastName,
        'email': _email,
      };

  String? get name => _name;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
}
