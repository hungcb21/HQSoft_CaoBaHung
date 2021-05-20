import 'package:esales_training/Model/StatusModel.dart';

class StatusRepository{
  Future<StatusData> getStatusItems() async{
    List<StatusModel> statusItems=[
      StatusModel(1, "Tất cả", true),
      StatusModel(2, "Đã tiếp nhận", false),
      StatusModel(3, "Đã hoàn tất", false),
      StatusModel(4, "Đã hủy", false),
    ];
    return StatusData(statusItems);
  }
}