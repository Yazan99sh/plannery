import 'package:plannery/module_home/ui/screens/home_screen/home_screen.dart';
import 'package:plannery/module_init/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

abstract class HomeState {
  final HomeScreenState screen;

  HomeState(this.screen);

  Widget getUI(BuildContext context);
}

class HomeStateInit extends HomeState {
  final data;
  HomeStateInit(screen, this.data) : super(screen);
  TextEditingController controller = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.maxFinite,
            color: Theme.of(context).primaryColor,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'PLANNERY',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 25,
            ),
          ),
          Expanded(
            flex: 15,
                      child: Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8,
              ),
              child: Container(
                child: GridView.builder(
                    padding: EdgeInsets.only(top: 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 22,
                        crossAxisCount: 2,
                        mainAxisSpacing: 22,
                        childAspectRatio:
                            (MediaQuery.of(context).size.width / 2) / 150),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (_, int index) {
                      return InkWell(
                        onTap: () {
                          screen.selectedAppointment(
                              index, data, data[index]['users']);
                        },
                        child: Container(
                          color:Theme.of(context).primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '${index + 1} Appointment',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '${data[index]['date'].toString().substring(0, 10)}',
                                    style: TextStyle(
                                        color:Theme.of(context).primaryColorDark, fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime.now(),
              onChanged: (date) {}, onConfirm: (date) {
            screen.createAppointments(date.toString());
          }, currentTime: DateTime.now(), locale: LocaleType.en);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomeStateLoading extends HomeState {
  HomeStateLoading(screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Center(
        child: Container(
          width: 45,
          height: 45,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class HomeStateError extends HomeState {
  final String errorMsg;

  HomeStateError(
    this.errorMsg,
    HomeScreenState screen,
  ) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset('assets/images/error.png',
                  width: 125, height: 125)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Text('$errorMsg')),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                screen.refresh();
              },
              child: Text(
                'Refresh',
                style: TextStyle(
                  fontSize: 16,
                  color: AppBarTheme.of(context).color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeStateSelected extends HomeState {
  final int selectedIndex;
  final List users;
  final data;
  HomeStateSelected(screen, this.data, this.selectedIndex, this.users)
      : super(screen);
  TextEditingController controller = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    return GestureDetector(
      onTap: () {
        screen.unselectedAppointment(data);
      },
      child: Scaffold(
        appBar: appbar(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
                  child: Column(
            children: [
              Container(
                height: 60,
                width: double.maxFinite,
                color: Theme.of(context).primaryColor,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'PLANNERY',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 25,
                ),
              ),
              Expanded(
                flex: 21,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8,
                  ),
                  child: Container(
                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 22,
                            crossAxisCount: 2,
                            mainAxisSpacing: 22,
                            childAspectRatio:
                                (MediaQuery.of(context).size.width / 2) / 150),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (_, int index) {
                          return InkWell(
                            onTap: () {
                              if (index == selectedIndex) {
                                screen.unselectedAppointment(data);
                              } else {
                                screen.selectedAppointment(
                                    index, data, data[index]['users']);
                              }
                            },
                            child: Container(
                              color: selectedIndex == index
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      '${index + 1} Appointment',
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? AppBarTheme.of(context).color
                                              : Theme.of(context).primaryColorDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        '${data[index]['date'].toString().substring(0, 10)}',
                                        style: TextStyle(
                                            color: selectedIndex == index
                                                ? AppBarTheme.of(context).color
                                                : Theme.of(context).primaryColorDark,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 25,
                ),
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                color: Theme.of(context).primaryColor,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'PARTICIPENTS',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color:Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 25,
                ),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    return Container(
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:Theme.of(context).primaryColor),
                            child: Center(
                                child: Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColorDark,
                              size: 30,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '${users[index]}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColorDark,
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime.now(),
                onChanged: (date) {}, onConfirm: (date) {
              screen.createAppointments(date.toString());
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
