import 'package:plannery/consts/urls.dart';
import 'package:plannery/module_home/request/create_request/create_request.dart';
import 'package:plannery/module_home/response/appointments_response/appointments_response.dart';
import 'package:plannery/module_network/http_client/http_client.dart';
import 'package:inject/inject.dart';

@provide
class HomeRepository {
  final ApiClient _apiClient;

  HomeRepository(this._apiClient);

  Future<bool> createAppointment(CreateRequest request) async {
    var result =
        await _apiClient.post(Urls.CRETE_APPOINTMENT, request.toJson());
    return result != null;
  }

  Future<dynamic> getAppointments() async {
    var result = await _apiClient.get(Urls.BASE_API);
print(result);
    if (result == null) {
      return null;
    }
    return result;
  }

  Future<bool> addUser(String id,String name) async {
    var result = await _apiClient.put(Urls.BASE_API,{'name':'$name'});

    return result != null;
  }

  Future<bool> deleteAppointments(String id) async {
    var result = await _apiClient.delete(Urls.BASE_API);

    return result != null;
  }
}
