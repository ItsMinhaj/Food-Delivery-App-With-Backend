// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:food_delivery/model/popular_product_model.dart';

class CartListItemModel {
  final ProductsModel product;
  final int quantity;
  CartListItemModel({
    required this.product,
    required this.quantity,
  });

  CartListItemModel copyWith({
    ProductsModel? product,
    int? quantity,
  }) {
    return CartListItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartListItemModel.fromMap(Map<String, dynamic> map) {
    return CartListItemModel(
      product: ProductsModel.fromJson(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartListItemModel.fromJson(String source) =>
      CartListItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CartListItemModel(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartListItemModel &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
