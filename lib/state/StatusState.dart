import 'package:equatable/equatable.dart';
import 'package:esales_training/Model/StatusModel.dart';

class StatusState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StatusInit extends StatusState{

}

class StatusChange extends StatusState{
  String status;
  StatusChange(this.status);
}