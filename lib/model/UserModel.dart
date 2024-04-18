import 'package:hive_flutter/hive_flutter.dart';
part 'UserModel.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  UserModel(this.email, this.username);
}
