class FeedModel {
  int? id;
  String? title;
  String? body;
  String? timestamp;
  int? user;

  FeedModel({this.id, this.title, this.body, this.timestamp, this.user});

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    timestamp = json['timestamp'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['timestamp'] = this.timestamp;
    data['user'] = this.user;
    return data;
  }
}
