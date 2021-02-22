import 'package:plannery/module_home/service/home_service/home_service.dart';
import 'package:plannery/module_home/ui/screens/home_screen/home_screen.dart';
import 'package:plannery/module_home/ui/state/home_state/home_state.dart';
import 'package:plannery/module_init/presistance/init_prefs_helper.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class HomeStateManager {
  final InitPrefsHelper _initPrefsHelper;
  final HomeService _homeService;
  final PublishSubject<HomeState> _stateSubject =
  PublishSubject<HomeState>();

  Stream<HomeState> get stateStream => _stateSubject.stream;

  HomeStateManager(
   this._initPrefsHelper,
      this._homeService
      );

  void getAppointments(HomeScreenState screenState)async{
    try{
      _stateSubject.add(HomeStateLoading(screenState));
       await Future.wait([_homeService.getAppointments()]).then((value){
         if (value!=null) {
           _stateSubject.add(HomeStateInit(screenState, value[0]));
         }
         else {
           _stateSubject.add(HomeStateError('There is no Appointments',screenState));
         }
       });
    } catch(e){
      print(e);
      _stateSubject.add(HomeStateError(e.toString(),screenState));
    }
  }
  void createAppointments(String date,HomeScreenState screenState)async{
    try{
      _stateSubject.add(HomeStateLoading(screenState));
      await _homeService.createAppointment(date).then((value){
        if (value != null && value != false){
       getAppointments(screenState);
        }
        else {
          _stateSubject.add(HomeStateError('$value',screenState));
        }
      });

    } catch(e){
      print(e);
      _stateSubject.add(HomeStateError(e.toString(),screenState));
    }
  }

  void selectedAppointment(int index,var data,List users,HomeScreenState screenState)async{
    try{
     // _stateSubject.add(HomeStateLoading(screenState));
      _stateSubject.add(HomeStateSelected(screenState,data,index,users));

    } catch(e){
      print(e);
      _stateSubject.add(HomeStateError(e.toString(),screenState));
    }
  }
  void unselectedAppointment(data,HomeScreenState screenState){
    try{
      _stateSubject.add(HomeStateInit(screenState,data));
    }
    catch (e){
      _stateSubject.add(HomeStateError(e.toString(),screenState));
    }
  }

}
