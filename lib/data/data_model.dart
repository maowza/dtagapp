class Order {
  String tagId,order,mat,bat;
  int qty;
 
  Order.fromJson(Map json)
      : tagId = json['tagId'],
        order = json['order'],
        mat = json['mat'],
        bat = json['bat'],
        qty = json['qty'];

  Map toJson() {
    return {'tagId': tagId, 'order': order, 'mat': mat, 'bat': bat,'qty': qty};
  }
}

