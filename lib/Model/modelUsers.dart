class ModelData {
  List<Data> data;

  ModelData({this.data});

  ModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
 
class Data {
  String id;
  String password;
  String name;
  String date;
  String time;

  Data({this.id, this.password, this.name, this.date, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    name = json['name'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['name'] = this.name;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
