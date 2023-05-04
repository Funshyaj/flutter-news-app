import 'package:hive/hive.dart';

part 'user.g.dart';


@HiveType(typeId: 0)
class UserModel extends HiveObject {

  @HiveField(0)
  late String fullName;

  @HiveField(1)
  late String userName;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String password;

  UserModel({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password});

}