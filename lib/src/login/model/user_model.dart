class User {
  String email;
  String password;
  String imageProfile;
  String name;
  String id;

  User(
      {required this.email,
      required this.password,
      required this.imageProfile,
      required this.name,
      required this.id});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'imageProfile': imageProfile,
      'name': name,
      'id': id,
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : email = map['email'],
        password = map['password'],
        imageProfile = map['imageProfile'],
        name = map['name'],
        id = map['id']; 
            
}
