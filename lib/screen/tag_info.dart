import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dtagapp/data/data_api.dart';
import 'package:dtagapp/data/data_model.dart';
import 'package:dtagapp/components/button.dart';
import '../color_utils.dart';
import '../components/inputbox.dart';

List<Order> orderList = [];
TextEditingController orderController = new TextEditingController();
TextEditingController matController = new TextEditingController();
TextEditingController batController = new TextEditingController();
TextEditingController qtyController = new TextEditingController();

class TagInfo extends StatefulWidget {
  @override
  _TagInfoState createState() => _TagInfoState();
}

class _TagInfoState extends State<TagInfo> {
  int found = 0;

  void getOrdersfromApi() async {
    OrderApi.getOrders().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        orderList = list.map((model) => Order.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getOrdersfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bgtag.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('< Back',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                  ShowDate(),
                ]),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            InputBox(
              label: 'TagID',
              hint: 'TagID',
              width: 210,
              ctrl: inputController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InputBox(
                  label: 'Order',
                  hint: 'Order',
                  width: 110,
                  ctrl: orderController,
                ),
                InputBox(label: 'Plant', hint: 'Plant', width: 55),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InputBox(
                  label: 'Batch',
                  hint: 'Batch',
                  width: 110,
                  ctrl: batController,
                ),
                InputBox(label: 'SLOC', hint: 'SLOC', width: 55),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InputBox(
                  label: 'Mat',
                  hint: 'Material',
                  width: 110,
                  ctrl: matController,
                ),
                InputBox(label: 'UOM', hint: 'UOM', width: 55),
              ],
            ),
            InputBox(
              label: 'Desc',
              hint: 'Description',
              width: 210,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                QtyBox(
                  label: 'Qty',
                  ctrl: qtyController,
                ),
                QtyBox(label: 'Confirm Qty')
              ],
            ),
            Button(
              onPressed: () {
                for (int i = 0; i < orderList.length; i++) {
                  if (orderList[i].tagId == inputController.text) {
                    found = 1;
                    orderController.text = orderList[i].order;
                    matController.text = orderList[i].mat;
                    batController.text = orderList[i].bat;
                    qtyController.text = orderList[i].qty.toString();
                  }
                }
                if (found == 0) {
                  orderController.text = 'N/A';
                  matController.text = 'N/A';
                  batController.text = 'N/A';
                  qtyController.text = 'N/A';
                }
                found = 0;
              },
              text: 'ENTER',
              color: ColorUtils.sblue,
              borderRadius: 10,
              height: 55,
              width: 100,
              top: 20,
              bottom: 60,
            )
          ],
        ),
      ),
    );
  }
}
