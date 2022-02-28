import 'dart:convert';

// class CoinModel {
//   String? name;
//   String? last_updated;
//   String? image;
//   int? current_price;
//   CoinModel({
//     this.name,
//     this.last_updated,
//     this.image,
//     this.current_price,
//   });

//   CoinModel copyWith({
//     String? name,
//     String? last_updated,
//     String? image,
//     int? current_price,
//   }) {
//     return CoinModel(
//       name: name ?? this.name,
//       last_updated: last_updated ?? this.last_updated,
//       image: image ?? this.image,
//       current_price: current_price ?? this.current_price,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'last_updated': last_updated,
//       'image': image,
//       'current_price': current_price,
//     };
//   }

//   factory CoinModel.fromMap(Map<String, dynamic> map) {
//     return CoinModel(
//       name: map['name'],
//       last_updated: map['last_updated'],
//       image: map['image'],
//       current_price: map['current_price']?.toInt(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CoinModel.fromJson(String source) =>
//       CoinModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'CoinModel(name: $name, last_updated: $last_updated, image: $image, current_price: $current_price)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is CoinModel &&
//         other.name == name &&
//         other.last_updated == last_updated &&
//         other.image == image &&
//         other.current_price == current_price;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//         last_updated.hashCode ^
//         image.hashCode ^
//         current_price.hashCode;
//   }
// }

class CoinModel {
  String? name;
  String? last_updated;
  String? image;
  double? current_price;
  CoinModel({
    this.name,
    this.last_updated,
    this.image,
    this.current_price,
  });

  CoinModel copyWith({
    String? name,
    String? last_updated,
    String? image,
    double? current_price,
  }) {
    return CoinModel(
      name: name ?? this.name,
      last_updated: last_updated ?? this.last_updated,
      image: image ?? this.image,
      current_price: current_price ?? this.current_price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'last_updated': last_updated,
      'image': image,
      'current_price': current_price,
    };
  }

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      name: map['name'],
      last_updated: map['last_updated'],
      image: map['image'],
      current_price: map['current_price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinModel.fromJson(String source) =>
      CoinModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinModel(name: $name, last_updated: $last_updated, image: $image, current_price: $current_price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinModel &&
        other.name == name &&
        other.last_updated == last_updated &&
        other.image == image &&
        other.current_price == current_price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        last_updated.hashCode ^
        image.hashCode ^
        current_price.hashCode;
  }
}
