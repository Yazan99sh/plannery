import 'package:plannery/module_init/presistance/init_prefs_helper.dart';
import 'package:plannery/module_init/ui/screens/init_screen/init_screen.dart';
import 'package:plannery/module_init/ui/state/init_state/init_state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class InitStateManager {
  final InitPrefsHelper _initPrefsHelper;
  final PublishSubject<InitState> _stateSubject =
  PublishSubject<InitState>();

  Stream<InitState> get stateStream => _stateSubject.stream;

  InitStateManager(
   this._initPrefsHelper
      );

  void setUsername(String name,InitScreenState screenState)async{
    try{
      _stateSubject.add(InitStateLoading(screenState));
        await Future.delayed(Duration(milliseconds: 750));
       await _initPrefsHelper.setUsername(name).whenComplete((){
         _stateSubject.add(InitStateSuccess(screenState));
       });
    } catch(e){
      print(e);
      _stateSubject.add(InitStateError(e.toString(),screenState));
    }
  }
  void getInitState(InitScreenState screenState){
    _stateSubject.add(InitStateInit(screenState));
  }

}
