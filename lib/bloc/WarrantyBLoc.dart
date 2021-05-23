import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';
import 'package:esales_training/Repository/ReceiveWarrantyData.dart';
import 'package:esales_training/event/WarrantyEvent.dart';
import 'package:esales_training/state/WarrantyState.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarrantyBLoc extends Bloc<WarrantyEvent, WarrantyState> {
  WarrantyDataRepository repository = WarrantyDataRepository();

  WarrantyBLoc() : super(WarrantyInit());

  @override
  Stream<WarrantyState> mapEventToState(WarrantyEvent event) async* {
    // TODO: implement mapEventToState
    if (event is getWarrantyEvent) {
      if (state is WarrantyInit) {
        if(event.warrantyCode == null)
          {
            if (event.status == "Tất cả") {
              List<ReceiveWarrantyCardModel> data = ReceiveWarrantyCardModel.list
                  .where((element) =>
              (DateTime.parse(element.createDate).isAfter(event.time1) &&
                  DateTime.parse(element.createDate).isBefore(event.time2)))
                  .toList();
              yield (WarrantyLoaded(data));
            } else {
              List<ReceiveWarrantyCardModel> data = ReceiveWarrantyCardModel.list
                  .where((element) =>
              DateTime.parse(element.createDate).isAfter(event.time1) &&
                  DateTime.parse(element.createDate).isBefore(event.time2) &&
                  element.statusName.contains(event.status.toString()))
                  .toList();
              yield (WarrantyLoaded(data));
            }
          }
        else
          {
            List<ReceiveWarrantyCardModel> data = ReceiveWarrantyCardModel.list
                .where((element) =>
            (element.codeWarranty==event.warrantyCode))
                .toList();
            yield (WarrantyLoaded(data));
          }


      }
    }
    if (event is changeWarrantyEvent) {
      yield (WarrantyInit());
    }
  }
}
