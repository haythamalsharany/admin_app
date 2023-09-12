class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersRating;
  String? ordersComment;
  String? ordersDatetime;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersRating,
      this.ordersComment,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_user_id'];
    ordersAddress = json['orders_address_id'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon_id'];
    ordersPaymentmethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rate'];
    ordersComment = json['orders_comment'];
    ordersDatetime = json['orders_date'];
    addressId = json['addresses_id'];
    addressUsersid = json['addresses_user_id'];
    addressName = json['addresses_name'];
    addressCity = json['addresses_city'];
    addressStreet = json['addresses_street'];
    addressLat = json['addresses_lat'];
    addressLong = json['addresses_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_user_id'] = ordersUsersid;
    data['orders_address_id'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_price_delivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon_id'] = ordersCoupon;
    data['orders_payment_method'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_rate'] = ordersRating;
    data['orders_comment'] = ordersComment;
    data['orders_date'] = ordersDatetime;
    data['addresses_id'] = addressId;
    data['addresses_usersid'] = addressUsersid;
    data['addresses_name'] = addressName;
    data['addresses_city'] = addressCity;
    data['addresses_street'] = addressStreet;
    data['addresses_lat'] = addressLat;
    data['addresses_long'] = addressLong;
    return data;
  }
}
