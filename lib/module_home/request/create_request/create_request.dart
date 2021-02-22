class CreateRequest {
  String username;
  String appointmentDate;

  CreateRequest({this.username, this.appointmentDate});

  CreateRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    appointmentDate = json['appointmentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['appointmentDate'] = this.appointmentDate;
    return data;
  }
}
