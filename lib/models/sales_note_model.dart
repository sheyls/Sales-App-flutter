import 'sales_detail_model.dart';

class SalesNote {
  String companyName;
  String rut;
  String address;
  String giro;
  double neto;
  double iva;
  double total;
  List<SalesDetail> details;

  SalesNote({
    required this.companyName,
    required this.rut,
    required this.address,
    required this.giro,
    required this.neto,
    required this.iva,
    required this.total,
    required this.details,
  });

  factory SalesNote.fromJson(Map<String, dynamic> json) => SalesNote(
    companyName: json['companyName'],
    rut: json['rut'],
    address: json['address'],
    giro: json['giro'],
    neto: json['neto'],
    iva: json['iva'],
    total: json['total'],
    details: List<SalesDetail>.from(json['details'].map((x) => SalesDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'companyName': companyName,
    'rut': rut,
    'address': address,
    'giro': giro,
    'neto': neto,
    'iva': iva,
    'total': total,
    'details': List<dynamic>.from(details.map((x) => x.toJson())),
  };
}
