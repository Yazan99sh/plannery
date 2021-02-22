class AppointmentsResponse {
  List users;
  String date;

  AppointmentsResponse({this.date,this.users});

  AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['users'] = this.users;
    return data;
  }
}
