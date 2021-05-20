import 'dart:async';

import 'package:esales_training/Model/StatusModel.dart';
import 'package:esales_training/Repository/StatusData.dart';
import 'package:esales_training/event/StatusEvent.dart';
import 'package:esales_training/state/StatusState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusBloc extends Bloc<StatusEvent,StatusState>
{
  ValueNotifier<String> status = ValueNotifier("Tat car");
  StreamController<String> _statusController =new  StreamController();
  StatusBloc() : super(StatusInit());
  Stream get statusStream=>_statusController.stream;
  StatusRepository data = StatusRepository();
  void dispose(){
    _statusController.close();
  }
  @override
  Stream<StatusState> mapEventToState(StatusEvent event) async*{
    // TODO: implement mapEventToState
    if(event is getStatus){
      StatusData model = await data.getStatusItems();
      yield StatusLoaded(model);
      _statusController.sink.add("ádasd");
      print(status);
    }
    else if(event is setStatus)
      {
        yield StatusChange(event.status.toString());
        _statusController.sink.add(event.status.toString());
        print(event.status.toString());
        status =event.status.toString() as ValueNotifier<String>;
      }
  }

}
