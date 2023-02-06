import 'dart:convert';

List<IdentitasDesa> identitasDesaFromJson(String str) =>
    List<IdentitasDesa>.from(
        json.decode(str).map((x) => IdentitasDesa.fromJson(x)));

String identitasDesaToJson(List<IdentitasDesa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IdentitasDesa {
  IdentitasDesa({
    required this.id,
    required this.namaDesa,
    required this.jalan,
    required this.kodePos,
    required this.kecamatan,
    required this.kabupaten,
    required this.provinsi,
    required this.namaKades,
    required this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String namaDesa;
  String jalan;
  String kodePos;
  String kecamatan;
  String kabupaten;
  String provinsi;
  String namaKades;
  String deskripsi;
  dynamic createdAt;
  dynamic updatedAt;

  factory IdentitasDesa.fromJson(Map<String, dynamic> json) => IdentitasDesa(
        id: json["id"],
        namaDesa: json["nama_desa"],
        jalan: json["jalan"],
        kodePos: json["kode_pos"],
        kecamatan: json["kecamatan"],
        kabupaten: json["kabupaten"],
        provinsi: json["provinsi"],
        namaKades: json["nama_kades"],
        deskripsi: json["deskripsi"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_desa": namaDesa,
        "jalan": jalan,
        "kode_pos": kodePos,
        "kecamatan": kecamatan,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "nama_kades": namaKades,
        "deskripsi": deskripsi,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
