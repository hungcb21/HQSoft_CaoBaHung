class ReceiveWarrantyCardData{
List<ReceiveWarrantyCardModel> dataWarranty;
ReceiveWarrantyCardData(this.dataWarranty);
}
class ReceiveWarrantyCardModel{
  String codeWarranty;
  String address;
  String phone;
  int statusCode;
  String statusName;
  String createDate;
  String content;

  ReceiveWarrantyCardModel(this.codeWarranty, this.address, this.phone,
      this.statusCode, this.statusName, this.createDate, this.content);
  static List<ReceiveWarrantyCardModel> list = [
    ReceiveWarrantyCardModel("12344", "72/24 Phan Đăng Lưu, quận Phú Nhuận TPHCM áddsadas", "0947312419",  1, "Đã tiếp nhận", "2021-05-09 00:00:00.000", "Kiểm tra cục lạnh k mát"),
    ReceiveWarrantyCardModel("12345", "72/24 Phan Đăng Lưu, quận Phú Nhuận TPHCM áddsadas", "0947312419",  1, "Đã tiếp nhận", "2021-05-10 00:00:00.000", "Kiểm tra nguồn thông tin"),
    ReceiveWarrantyCardModel("12346", "72/24 Phan Đăng Lưu", "0947312419",  1, "Đã hoàn tất", "2021-05-11 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12347", "72/24 Phan Đăng Lưu", "0947312418",  1, "Đã hủy", "2021-05-12 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12348", "72/24 Phan Đăng Lưu", "0947312419",  1, "Đã hủy", "2021-05-13 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12349", "72/24 Phan Đăng Lưu", "0947312419",  1, "Đã tiếp nhận", "2021-05-10 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12351", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã tiếp nhận", "2021-05-15 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12352", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã tiếp nhận", "2021-05-16 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12353", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã tiếp nhận", "2021-05-17 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12354", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã hủy", "2021-05-20 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12354", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã hủy", "2021-05-21 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12354", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã hủy", "2021-05-23 00:00:00.000", "Ok"),
    ReceiveWarrantyCardModel("12354", "20/6/4a đường số 13 phường Bình Thọ Quận Thủ Đức TPHCM", "0947312419",  1, "Đã hủy", "2021-05-27 00:00:00.000", "Ok"),
  ];
}

