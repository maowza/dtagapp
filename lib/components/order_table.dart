import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dtagapp/screen/home.dart';
import 'package:dtagapp/data/data_api.dart';
import 'package:dtagapp/data/data_model.dart';
import 'package:dtagapp/color_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  const ScrollableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        //child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: child,
        //),
      );
}

class Ordertable extends StatefulWidget {
  @override
  _OrdertableState createState() => _OrdertableState();
}

class _OrdertableState extends State<Ordertable> {
  int? sortColumnIndex;
  bool isAscending = false;
  List<Order> orderList = [];
  List<Order> filteredOrders = [].cast<Order>().toList();
  bool isSearching = false;

  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  Future getOrdersfromApi() async {
    //keyRefresh.currentState?.show();
    // await Future.delayed((Duration(milliseconds: 500)));
    OrderApi.getOrders().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        filteredOrders =
            orderList = list.map((model) => Order.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    getOrdersfromApi();
    setState(() {
      filteredOrders = orderList;
    });
    super.initState();
  }

  void _filteredOrders(value) {
    setState(() {
      filteredOrders = orderList
          .where((ordered) =>
              ordered.order.contains(value) ||
              ordered.bat.contains(value) ||
              ordered.qty.toString().contains(value) ||
              ordered.mat.contains(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: ScrollableWidget(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
            Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  color: ColorUtils.blue,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 80, top: 15),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Text('< Back',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 80, top: 15),
                            child: IconButton(
                              onPressed: getOrdersfromApi,
                              icon: Icon(Icons.refresh),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: 240,
                            height: 30,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _filteredOrders(value);
                                });
                              },
                              style: GoogleFonts.nunito(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.search),
                                  hintText: 'Search',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none)),
                            ),
                          )),
                    ],
                  ),
                )),
            Padding(padding: EdgeInsets.all(0), child: buildDataTable())
          ])));

  Widget buildDataTable() {
    var columns = ['Order', 'Mat', 'Bat', 'Qty'];
    return DataTable(
      headingRowColor:
          MaterialStateColor.resolveWith((states) => ColorUtils.sblue),
      headingRowHeight: 45,
      dataRowHeight: 45,
      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columnSpacing: 30,
      columns: getColumns(columns),
      rows: getRows(filteredOrders),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Order> orders) => orders.map((Order order) {
        final cells = [order.order, order.mat, order.bat, order.qty];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      filteredOrders.sort((order1, order2) =>
          compareString(ascending, order1.order, order2.order));
    } else if (columnIndex == 1) {
      filteredOrders.sort(
          (order1, order2) => compareString(ascending, order1.mat, order2.mat));
    } else if (columnIndex == 2) {
      filteredOrders.sort(
          (order1, order2) => compareString(ascending, order1.bat, order2.bat));
    } else if (columnIndex == 3) {
      filteredOrders.sort(
          (order1, order2) => compareInt(ascending, order1.qty, order2.qty));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  int compareInt(bool ascending, int value1, int value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
