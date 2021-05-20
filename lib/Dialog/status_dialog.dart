import 'package:esales_training/Component/list_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusDialog {
  static void showStatusDialog(BuildContext context,Function function,String status) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                  ListStatus(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 140,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Đồng ý",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: Colors.indigo,
                          onPressed: () {function();},
                        ),
                      ),
                      Container(
                        width: 140,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Đóng",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          color: Colors.white60,
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
