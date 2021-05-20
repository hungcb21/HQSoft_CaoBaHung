import 'package:esales_training/Model/ReceiveWarrantyCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBar extends StatelessWidget {
  List<ReceiveWarrantyCardModel> datalist = ReceiveWarrantyCardModel.list;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.blueAccent,
          ),
          Container(
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
                  return ListTile(
                    leading: FlutterLogo(size: 30,),

                    title: Text("${warranty.codeWarranty}"),
                    subtitle: Text("${warranty.address}"),
                  );
                },
                onSuggestionSelected: (comic) {}),
          )
        ],
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
        comic.createDate.toLowerCase().contains(searchString.toLowerCase()))
        .toList();
  }
}
