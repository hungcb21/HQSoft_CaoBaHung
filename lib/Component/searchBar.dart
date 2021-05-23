import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';
import 'package:esales_training/bloc/WarrantyBLoc.dart';
import 'package:esales_training/event/WarrantyEvent.dart';
import 'package:esales_training/state/WarrantyState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
class SearchBar extends StatefulWidget {
  Function(String) warrantyCode;

  SearchBar(this.warrantyCode);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<ReceiveWarrantyCardModel> datalist = ReceiveWarrantyCardModel.list;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocProvider(
      create: (_)=>WarrantyBLoc(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.blueAccent,
            ),
           BlocBuilder<WarrantyBLoc,WarrantyState>(builder: (context,state){
             return  Container(
               width: sizeWidth - 50,
               child: TypeAheadField(
                   textFieldConfiguration: TextFieldConfiguration(
                       decoration: InputDecoration(
                           hintText: "Nhập thông tin để tìm kiếm",
                           hintStyle: TextStyle(color: Colors.black)),
                       autofocus: false,
                       style: DefaultTextStyle
                           .of(context)
                           .style
                           .copyWith(
                           fontStyle: FontStyle.italic,
                           fontSize: 18,
                           color: Colors.black)),
                   suggestionsCallback: (searchString) async {
                     return await searchWarranty(searchString);
                   },
                   itemBuilder: (context, warranty) {
                     return Container(
                       padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                           text: "${warranty.codeWarranty}",
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
                                             text: "${warranty.address}",
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
                                           text:  "${DateFormat("dd/MM/yyyy").format(DateTime.parse(warranty.createDate.toString()))}",
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
                                           text: "${warranty.content}",
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
                                           text: "${warranty.statusName}",
                                           style: TextStyle(
                                               fontWeight: FontWeight.normal))
                                     ]),
                               ),
                             ],
                           )
                         ],
                       ),
                     );
                   },
                   onSuggestionSelected: (comic) {
                     widget.warrantyCode(comic.codeWarranty);
                   }),
             );
           }),
          ],
        ),
      ),
    );
  }

  Future<List<ReceiveWarrantyCardModel>> searchWarranty(
      String searchString) async {
    return datalist
        .where((comic) =>
    comic.codeWarranty
        .toLowerCase()
        .contains(searchString.toLowerCase()) ||
        comic.address.toLowerCase().contains(searchString.toLowerCase()) ||
        comic.statusName.toLowerCase().contains(searchString.toLowerCase())||
        comic.createDate.toLowerCase().contains(searchString.toLowerCase())||
        comic.content.toLowerCase().contains(searchString.toLowerCase())||
        comic.createDate.toLowerCase().contains(searchString.toLowerCase()))
        .toList();
  }
}
