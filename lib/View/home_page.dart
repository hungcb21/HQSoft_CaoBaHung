import 'package:esales_training/Component/list_warranty.dart';
import 'package:esales_training/Component/searchBar.dart';
import 'package:esales_training/Dialog/status_dialog.dart';
import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';
import 'package:esales_training/Model/StatusModel.dart';
import 'package:esales_training/bloc/WarrantyBLoc.dart';
import 'package:esales_training/event/WarrantyEvent.dart';
import 'package:esales_training/state/WarrantyState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime pickedDate;
  DateTime pickedDate2;
  String warrantyCode;
  List<ReceiveWarrantyCardModel> datalist = ReceiveWarrantyCardModel.list;
  List<StatusModel> datalist1 = StatusModel.list;
  String status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.utc(
        DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
    pickedDate2 = DateTime.now();
    datalist = ReceiveWarrantyCardModel.list
        .where((element) =>
            DateTime.parse(element.createDate).isAfter(pickedDate) &&
            DateTime.parse(element.createDate).isBefore(pickedDate2))
        .toList();
    datalist.sort((a, b) => a.createDate.compareTo(b.createDate));
    status = "Tất cả";
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Danh Sách Phiếu",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        // constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<WarrantyBLoc, WarrantyState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Từ:",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 160,
                          child: ListTile(
                            title: Text(
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                            trailing: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              await _pickDate();
                              context
                                  .read<WarrantyBLoc>()
                                  .add(changeWarrantyEvent());
                            },
                          ),
                        ),
                        Text(
                          "Đến:",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 160,
                          child: ListTile(
                            title: Text(
                              "${pickedDate2.day}/${pickedDate2.month}/${pickedDate2.year}",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                            trailing: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              await _pickDate2();
                              context
                                  .read<WarrantyBLoc>()
                                  .add(changeWarrantyEvent());
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Trạng thái:",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: sizeWidth - 100,
                    child: ListTile(
                      title:Text(
                        status,
                        style:
                        TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                      trailing: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.black,
                        size: 30,
                      ),
                      onTap: () {
                        StatusDialog.showStatusDialog(context,(val){
                          setState(() {
                            status=val;
                            warrantyCode=null;
                          });
                          context
                              .read<WarrantyBLoc>()
                              .add(changeWarrantyEvent());
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SearchBar((val){
              setState(() {
                warrantyCode=val;
              });
                context
                    .read<WarrantyBLoc>()
                    .add(changeWarrantyEvent());
            }),
            Flexible(
                child: ListWattanty(pickedDate, pickedDate2, status,warrantyCode)),
          ],
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
        warrantyCode=null;
      });
    }
  }

  _pickDate2() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate2,
    );
    if (date != null) {
      setState(() {
        date=pickedDate2;
        warrantyCode=null;
      });
    }
  }
}
