class User {
  late final String id;
  late final String fullName;
  late final String userName;
  late final String email;
  late final String password;

  User({required this.id,
    this.fullName = '',
    this.userName = '',
    this.email = '',
    this.password = ''});
}