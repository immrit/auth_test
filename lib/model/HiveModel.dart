import 'package:hive_flutter/hive_flutter.dart';
part 'HiveModel.g.dart';

@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String email;

  HiveModel(this.username, this.email);
}
