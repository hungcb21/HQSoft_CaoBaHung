import 'package:esales_training/Component/list_warranty.dart';
import 'package:esales_training/Component/searchBar.dart';
import 'package:esales_training/Dialog/status_dialog.dart';
import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';
import 'package:esales_training/Model/StatusModel.dart';
import 'package:esales_training/bloc/StatusBloc.dart';
import 'package:esales_training/bloc/WarrantyBLoc.dart';
import 'package:esales_training/event/StatusEvent.dart';
import 'package:esales_training/event/WarrantyEvent.dart';
import 'package:esales_training/state/StatusState.dart';
import 'package:esales_training/state/WarrantyState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime pickedDate;
  DateTime pickedDate2;
  int selectedRadioTile;
  List<ReceiveWarrantyCardModel> datalist = ReceiveWarrantyCardModel.list;
  WarrantyBLoc bloc = WarrantyBLoc();
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
    selectedRadioTile = 0;
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
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
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
                        title: Text(
                          status ?? "Tất cả",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.black,
                          size: 30,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context1) {
                                return BlocProvider(
                                  create: (_) => WarrantyBLoc(),
                                  child: Dialog(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100))),
                                      height: 400,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            color: Colors.indigo,
                                            child: Center(
                                              child: Text(
                                                "Chọn trạng thái",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          StatefulBuilder(
                                              builder: (context, setState) {
                                            return Container(
                                              height: 300,
                                              child: ListView.builder(
                                                itemCount: datalist1.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    height: 100,
                                                    child: RadioListTile(
                                                        groupValue:
                                                            selectedRadioTile,
                                                        title: Text(
                                                          datalist1[index]
                                                              .statusName,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18),
                                                        ),
                                                        value: index,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            selectedRadioTile =
                                                                val;
                                                            status =
                                                                datalist1[index]
                                                                    .statusName;
                                                            print(datalist1[
                                                                    index]
                                                                .statusName);
                                                          });
                                                        }),
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                          BlocBuilder<WarrantyBLoc,
                                                  WarrantyState>(
                                              builder: (context1, state) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: 140,
                                                  child: RaisedButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Text(
                                                      "Đồng ý",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    color: Colors.indigo,
                                                    onPressed: () {
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop(true);
                                                      context
                                                          .read<WarrantyBLoc>()
                                                          .add(
                                                              changeWarrantyEvent());
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 140,
                                                  child: RaisedButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Text(
                                                      "Đóng",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ),
                                                    color: Colors.white60,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SearchBar(),
              ListWattanty(pickedDate, pickedDate2, status),
            ],
          ),
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
      setState(() {});
    }
  }
}
