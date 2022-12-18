import 'dart:convert';

List<Barang> barangFromJson(String str) =>
    List<Barang>.from(json.decode(str).map((x) => Barang.fromJson(x)));

String barangToJson(List<Barang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Barang {
  Barang({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.imagePath,
    required this.harga,
    required this.deskripsi,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.category,
  });

  int id;
  String name;
  int categoryId;
  String image;
  String imagePath;
  int harga;
  String deskripsi;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Category category;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        id: json["id"] ?? 0,
        name: json["name"] ?? "null",
        categoryId: json["category_id"] ?? 0,
        image: json["image"] ?? "null",
        imagePath: json["image_path"] ?? "null",
        harga: json["harga"] ?? 0,
        deskripsi: json["deskripsi"] ?? "null",
        stock: json["stock"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] ?? "null",
        category: json['category'] != null
            ? Category.fromJson(json['category'])
            : Category(
                id: 0,
                name: 'null',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                deletedAt: null,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "image": image,
        "image_path": imagePath,
        "harga": harga,
        "deskripsi": deskripsi,
        "stock": stock,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? "null",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] ?? "null",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
