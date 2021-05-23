import 'package:equatable/equatable.dart';

class WarrantyEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class getWarrantyEvent extends WarrantyEvent{
  DateTime time1;
  DateTime time2;
  String warrantyCode;
  String status;
  getWarrantyEvent(this.time1, this.time2, this.status,this.warrantyCode);
}

class changeWarrantyEvent extends WarrantyEvent{
}