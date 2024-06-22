class SalesDetail {
  String sku;
  String productName;
  int quantity;
  double neto;
  double iva;
  double total;

  SalesDetail({
    required this.sku,
    required this.productName,
    required this.quantity,
    required this.neto,
    required this.iva,
    required this.total,
  });

  factory SalesDetail.fromJson(Map<String, dynamic> json) => SalesDetail(
    sku: json['sku'],
    productName: json['productName'],
    quantity: json['quantity'],
    neto: json['neto'],
    iva: json['iva'],
    total: json['total'],
  );

  Map<String, dynamic> toJson() => {
    'sku': sku,
    'productName': productName,
    'quantity': quantity,
    'neto': neto,
    'iva': iva,
    'total': total,
  };
}
