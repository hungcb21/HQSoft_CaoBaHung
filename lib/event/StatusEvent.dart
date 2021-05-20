import 'package:equatable/equatable.dart';
import 'package:esales_training/Model/StatusModel.dart';

class StatusEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class getStatus extends StatusEvent{
}

class setStatus extends StatusEvent{
  String status;
  setStatus(this.status);
}