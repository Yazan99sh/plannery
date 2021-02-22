import 'package:plannery/module_home/repository/home/home_repository.dart';
import 'package:plannery/module_home/request/create_request/create_request.dart';
import 'package:plannery/module_home/response/appointments_response/appointments_response.dart';
import 'package:inject/inject.dart';

@provide
class HomeManager {
  final HomeRepository _homeRepository;
  HomeManager(this._homeRepository);

  Future<bool> createAppointment(CreateRequest createRequest) => _homeRepository.createAppointment(createRequest);

  Future<dynamic> getAppointments() => _homeRepository.getAppointments();

  Future<bool> addUser(String id,String name) => _homeRepository.addUser(id,name);

  Future<bool> deleteAppointments(String id) => _homeRepository.deleteAppointments(id);
}
