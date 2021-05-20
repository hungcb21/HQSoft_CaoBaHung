import 'package:equatable/equatable.dart';
import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';

class WarrantyState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WarrantyInit extends WarrantyState{

}

class WarrantyLoaded extends WarrantyState{
  List<ReceiveWarrantyCardModel> data;
  WarrantyLoaded(this.data);

}