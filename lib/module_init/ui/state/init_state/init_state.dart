import 'package:plannery/module_init/ui/screens/init_screen/init_screen.dart';
import 'package:plannery/module_init/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class InitState {
  final InitScreenState screen;

  InitState(this.screen);

  Widget getUI(BuildContext context);
}

class InitStateInit extends InitState {
  InitStateInit(screen) : super(screen);
  TextEditingController controller = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar:appbar(context,false),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 175,height: 175,color:Theme.of(context).primaryColor,),
            Flexible(
             child:Container(
               height: 150,
             ),
            ),
            Center(
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width*0.75,
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (_) =>
                      node.unfocus(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color:Theme.of(context).primaryColor,
                    ),

                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color:Theme.of(context).primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color:Theme.of(context).primaryColor)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: InkWell(
                  onTap: (){
                    screen.setUsername(controller.text);
                  },
                  child: Container(
                    height: 45,
                    color:Theme.of(context).primaryColor,
                    width:MediaQuery.of(context).size.width*0.75,
                    child: Center(
                      child: Text('save',style: TextStyle(
                        color: AppBarTheme.of(context).color
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class InitStateLoading extends InitState {
  InitStateLoading(screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar:appbar(context,false),
      body:Center(
        child: Container(
          width: 45,
          height: 45,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
class InitStateError extends InitState {
  final String errorMsg;

  InitStateError(
      this.errorMsg,
      InitScreenState screen,
      ) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/error.png',width: 125,height: 125)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Text('$errorMsg')),
          ),
        ],
      ),
    );
  }
}
class InitStateSuccess extends InitState {
  InitStateSuccess(
      InitScreenState screen,
      ) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar:appbar(context,false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/success.png',width: 125,height: 125,)),
          Padding(
            padding: const EdgeInsets.only(top:75.0),
            child: Center(
              child: InkWell(
                onTap: (){
               screen.moveToHome();
                },
                child: Container(
                  height: 45,
                  width:MediaQuery.of(context).size.width*0.75,
                  color: Colors.green,
                  child: Center(
                    child: Text('next',style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}