class UserObj {
  // User Object used to store instances of signed-in users
  final String uid;

  UserObj({this.uid});

  String toString() => "User ID: ${this.uid}";
}
