class SaleNote {
  String nombreEmpresa;
  String rut;
  String direccion;
  String giro;
  double neto;
  double iva;
  double total;
  List<SaleDetail> detalles;

  SaleNote({
    required this.nombreEmpresa,
    required this.rut,
    required this.direccion,
    required this.giro,
    required this.neto,
    required this.iva,
    required this.total,
    required this.detalles,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombreEmpresa': nombreEmpresa,
      'rut': rut,
      'direccion': direccion,
      'giro': giro,
      'neto': neto,
      'iva': iva,
      'total': total,
      'detalles': detalles.map((detalle) => detalle.toJson()).toList(),
    };
  }

  factory SaleNote.fromJson(Map<String, dynamic> json) {
    return SaleNote(
      nombreEmpresa: json['nombreEmpresa'],
      rut: json['rut'],
      direccion: json['direccion'],
      giro: json['giro'],
      neto: json['neto'],
      iva: json['iva'],
      total: json['total'],
      detalles: (json['detalles'] as List).map((i) => SaleDetail.fromJson(i)).toList(),
    );
  }
}

class SaleDetail {
  String sku;
  String nombreProducto;
  int cantidad;
  double neto;
  double iva;
  double total;

  SaleDetail({
    required this.sku,
    required this.nombreProducto,
    required this.cantidad,
    required this.neto,
    required this.iva,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    return {
      'sku': sku,
      'nombreProducto': nombreProducto,
      'cantidad': cantidad,
      'neto': neto,
      'iva': iva,
      'total': total,
    };
  }

  factory SaleDetail.fromJson(Map<String, dynamic> json) {
    return SaleDetail(
      sku: json['sku'],
      nombreProducto: json['nombreProducto'],
      cantidad: json['cantidad'],
      neto: json['neto'],
      iva: json['iva'],
      total: json['total'],
    );
  }
}
