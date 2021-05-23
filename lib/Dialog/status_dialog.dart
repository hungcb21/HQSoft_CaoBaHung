import 'package:esales_training/Model/StatusModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusDialog {

  static void showStatusDialog(BuildContext context, Function(String) function) {
    List<StatusModel> datalist1 = StatusModel.list;
    int selectedRadioTile;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String status;
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              height: 400,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.indigo,
                    child: Center(
                      child: Text(
                        "Chọn trạng thái",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  StatefulBuilder(builder: (context, setState) {
                    // context.read<StatusBloc>().add(getStatus(status));
                    return Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: datalist1.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            child: RadioListTile(
                                groupValue: selectedRadioTile,
                                title: Text(
                                  datalist1[index].statusName,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                value: index,
                                onChanged: (val) {
                                  setState(() {
                                    selectedRadioTile = val;
                                    status = datalist1[index].statusName;
                                    // print(status);
                                  });
                                }),
                          );
                        },
                      ),
                    );
                  }),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Container(
                        width: 140,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Đồng ý",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          color: Colors.indigo,
                          onPressed: () {
                            function(status);
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ),
                          Container(
                            width: 140,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Đóng",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              color: Colors.white60,
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
