
import 'package:esales_training/Model/StatusModel.dart';
import 'package:esales_training/View/home_page.dart';
import 'package:esales_training/bloc/StatusBloc.dart';
import 'package:esales_training/event/StatusEvent.dart';
import 'package:esales_training/state/StatusState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListStatus extends StatefulWidget {
  @override
  _ListStatusState createState() => _ListStatusState();
}


class _ListStatusState extends State<ListStatus> {
  List<StatusModel> datalist = StatusModel.list;

  StatusBloc bloc ;
  int value;
  int selectedRadioTile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child:ListView.builder(
          itemCount: datalist.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              child: RadioListTile(
                  groupValue: selectedRadioTile,
                  title: Text(
                    datalist[index].statusName,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  value: index,
                  onChanged: (val) {
                    setState(() {
                      setSelectedRadioTile(val);
                    });
                  }),
            );
          },
        ),);
  }
}
