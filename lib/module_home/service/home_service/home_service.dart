import 'package:plannery/module_home/manager/home_manager/home_manager.dart';
import 'package:plannery/module_home/request/create_request/create_request.dart';
import 'package:plannery/module_home/response/appointments_response/appointments_response.dart';
import 'package:plannery/module_init/presistance/init_prefs_helper.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/subjects.dart';

@provide
class HomeService {
  final InitPrefsHelper _prefsHelper;
  final HomeManager _homeManager;
  final PublishSubject _authSubject = PublishSubject();
  Stream get onAuthorized => _authSubject.stream;

  HomeService(
    this._prefsHelper,
    this._homeManager,
  );
  Future <dynamic> getAppointments() async {
    var data = await _homeManager.getAppointments();
    print(data);
    return data;
  }

  Future <dynamic> createAppointment(String date) async {
    String user = await _prefsHelper.getUsername();
    var data = await _homeManager.createAppointment(CreateRequest(username: user,appointmentDate:date));
    return data;
  }

  Future<void> logout() async {
    await _prefsHelper.clearPrefs();
  }
}
