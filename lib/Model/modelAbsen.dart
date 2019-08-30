class ModelAbsence {
  String status;
  List<DataAbsence> data;
  String message;

  ModelAbsence({this.status, this.data, this.message});

  ModelAbsence.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<DataAbsence>();
      json['data'].forEach((v) {
        data.add(new DataAbsence.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataAbsence {
  String id;
  String presence;
  String date;
  Null time;

  DataAbsence({this.id, this.presence, this.date, this.time});

  DataAbsence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    presence = json['presence'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['presence'] = this.presence;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
