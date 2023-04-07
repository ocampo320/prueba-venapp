class Court {
  String? court;
  String? date;
  String? user;
  int? count;

  Court({this.court, this.date, this.user,this.count});

  Court.fromJson(Map<String, dynamic> json) {
    court = json['court'];
    date = json['date'];
    user = json['user'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['court'] = court;
    data['date'] = date;
    data['user'] = user;
    data['count'] = count;
    return data;
  }
}
