class Court {
  String? court;
  String? date;
  String? user;

  Court({this.court, this.date, this.user});

  Court.fromJson(Map<String, dynamic> json) {
    court = json['court'];
    date = json['date'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['court'] = court;
    data['date'] = date;
    data['user'] = user;
    return data;
  }
}
