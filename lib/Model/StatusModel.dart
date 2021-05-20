class StatusData{
  List<StatusModel> statusitems;
  StatusData(this.statusitems);
}
class StatusModel{
  int statusCodel;
  String statusName;
  bool isSelected;
  StatusModel(this.statusCodel, this.statusName, this.isSelected);
  static List<StatusModel> list = [
    StatusModel(-1, "Tất cả", false),
    StatusModel(1, "Đã tiếp nhận", false),
    StatusModel(2, "Đã hoàn tất", false),
    StatusModel(3, "Đã hủy", false),
  ];
}