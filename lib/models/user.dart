class UserObj {
  // User Object used to store instances of signed-in users
  final String uid;

  UserObj({this.uid});

  String toString() => "User ID: ${this.uid}";
}

class UserData {
  // User Data object used for database streams

  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid, this.name, this.strength, this.sugars});
}
