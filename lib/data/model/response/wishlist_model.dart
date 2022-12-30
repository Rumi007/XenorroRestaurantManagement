import 'package:flutter_grocery/data/model/response/product_model.dart';
class WishListModel {
  int _totalSize;
  String _limit;
  String _offset;
  List<Product> _products;

  WishListModel(
      {int totalSize,
        String limit,
        String offset,
        List<Product> products}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (limit != null) {
      this._limit = limit;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (products != null) {
      this._products = products;
    }
  }

  int get totalSize => _totalSize;
  set totalSize(int totalSize) => _totalSize = totalSize;
  String get limit => _limit;
  set limit(String limit) => _limit = limit;
  String get offset => _offset;
  set offset(String offset) => _offset = offset;
  List<Product> get products => _products;
  set products(List<Product> products) => _products = products;

  WishListModel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _limit = json['limit'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Product>[];
      json['products'].forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this._totalSize;
    data['limit'] = this._limit;
    data['offset'] = this._offset;
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


