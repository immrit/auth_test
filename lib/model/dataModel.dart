class DataModel {
  final String id;
  final String username;
  DataModel(this.id, this.username);

  factory DataModel.fromMapJson(Map<String, dynamic> json) {
    return DataModel(
      json['id'],
      json['username'],
    );
  }
}
