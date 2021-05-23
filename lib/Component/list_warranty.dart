import 'dart:ui';

import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';
import 'package:esales_training/bloc/WarrantyBLoc.dart';
import 'package:esales_training/event/WarrantyEvent.dart';
import 'package:esales_training/state/WarrantyState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListWattanty extends StatefulWidget {
  DateTime time1,time2;
  String status,warrantyCode;
  ListWattanty(this.time1, this.time2, this.status,this.warrantyCode);
  @override
  _ListWattantyState createState() => _ListWattantyState();
}

class _ListWattantyState extends State<ListWattanty> {
  ReceiveWarrantyCardModel model;
  List<ReceiveWarrantyCardModel> datalist ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarrantyBLoc,WarrantyState>(
      builder: (context,state){
        context.read<WarrantyBLoc>().add(getWarrantyEvent(widget.time1,widget.time2,widget.status,widget.warrantyCode));
        if(state is WarrantyInit)
          {
            return Center(child: CircularProgressIndicator(),);
          }
        else if(state is WarrantyLoaded)
          {
            datalist = state.data;
            return ListView.builder(
                itemCount: datalist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      // context.read<WarrantyBLoc>().add(changeWarrantyEvent());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        color: index%2==0?Colors.white12:Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.save,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "Mã phiếu:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: "${datalist[index].codeWarranty}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal))
                                      ]),
                                ),
                                Container(
                                  width: 300,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Địa chỉ:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: "${datalist[index].address}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal))
                                        ]),
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "Ngày:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text:  "${DateFormat("dd/MM/yyyy").format(DateTime.parse(datalist[index].createDate.toString()))}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal))
                                      ]),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "Nội dung",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: "${datalist[index].content}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal))
                                      ]),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "Trạng thái:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: "${datalist[index].statusName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal))
                                      ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        else{
          return Center(child: Text("No data"),);
        }
      },
    );
  }
}
