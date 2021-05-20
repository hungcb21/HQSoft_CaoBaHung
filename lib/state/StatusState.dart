import 'package:equatable/equatable.dart';
import 'package:esales_training/Model/StatusModel.dart';

class StatusState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StatusInit extends StatusState{

}
// ignore: must_be_immutable
class StatusLoaded extends StatusState{
  StatusData data;
  StatusLoaded(this.data);
}

class StatusChange extends StatusState{
  String status;
  StatusChange(this.status);
}