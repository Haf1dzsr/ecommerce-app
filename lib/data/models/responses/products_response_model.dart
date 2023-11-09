// ignore_for_file: constant_identifier_names

import 'dart:convert';

class ProductsResponseModel {
  final List<ProductsResponseModelDatum>? data;
  final Meta? meta;

  ProductsResponseModel({
    this.data,
    this.meta,
  });

  ProductsResponseModel copyWith({
    List<ProductsResponseModelDatum>? data,
    Meta? meta,
  }) =>
      ProductsResponseModel(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory ProductsResponseModel.fromJson(String str) =>
      ProductsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductsResponseModel(
        data: json["data"] == null
            ? []
            : List<ProductsResponseModelDatum>.from(json["data"]!
                .map((x) => ProductsResponseModelDatum.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class ProductsResponseModelDatum {
  final int? id;
  final PurpleAttributes? attributes;

  ProductsResponseModelDatum({
    this.id,
    this.attributes,
  });

  ProductsResponseModelDatum copyWith({
    int? id,
    PurpleAttributes? attributes,
  }) =>
      ProductsResponseModelDatum(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory ProductsResponseModelDatum.fromJson(String str) =>
      ProductsResponseModelDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModelDatum.fromMap(Map<String, dynamic> json) =>
      ProductsResponseModelDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : PurpleAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class PurpleAttributes {
  final String? name;
  final String? description;
  final String? price;
  final int? stock;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final Images? images;
  final Categories? categories;

  PurpleAttributes({
    this.name,
    this.description,
    this.price,
    this.stock,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.images,
    this.categories,
  });

  PurpleAttributes copyWith({
    String? name,
    String? description,
    String? price,
    int? stock,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Images? images,
    Categories? categories,
  }) =>
      PurpleAttributes(
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        images: images ?? this.images,
        categories: categories ?? this.categories,
      );

  factory PurpleAttributes.fromJson(String str) =>
      PurpleAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PurpleAttributes.fromMap(Map<String, dynamic> json) =>
      PurpleAttributes(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        categories: json["categories"] == null
            ? null
            : Categories.fromMap(json["categories"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "images": images?.toMap(),
        "categories": categories?.toMap(),
      };
}

class Categories {
  final List<CategoriesDatum>? data;

  Categories({
    this.data,
  });

  Categories copyWith({
    List<CategoriesDatum>? data,
  }) =>
      Categories(
        data: data ?? this.data,
      );

  factory Categories.fromJson(String str) =>
      Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        data: json["data"] == null
            ? []
            : List<CategoriesDatum>.from(
                json["data"]!.map((x) => CategoriesDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class CategoriesDatum {
  final int? id;
  final FluffyAttributes? attributes;

  CategoriesDatum({
    this.id,
    this.attributes,
  });

  CategoriesDatum copyWith({
    int? id,
    FluffyAttributes? attributes,
  }) =>
      CategoriesDatum(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory CategoriesDatum.fromJson(String str) =>
      CategoriesDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesDatum.fromMap(Map<String, dynamic> json) => CategoriesDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : FluffyAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class FluffyAttributes {
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  FluffyAttributes({
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  FluffyAttributes copyWith({
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
  }) =>
      FluffyAttributes(
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
      );

  factory FluffyAttributes.fromJson(String str) =>
      FluffyAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FluffyAttributes.fromMap(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class Images {
  final List<ImagesDatum>? data;

  Images({
    this.data,
  });

  Images copyWith({
    List<ImagesDatum>? data,
  }) =>
      Images(
        data: data ?? this.data,
      );

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        data: json["data"] == null
            ? []
            : List<ImagesDatum>.from(
                json["data"]!.map((x) => ImagesDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ImagesDatum {
  final int? id;
  final TentacledAttributes? attributes;

  ImagesDatum({
    this.id,
    this.attributes,
  });

  ImagesDatum copyWith({
    int? id,
    TentacledAttributes? attributes,
  }) =>
      ImagesDatum(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory ImagesDatum.fromJson(String str) =>
      ImagesDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImagesDatum.fromMap(Map<String, dynamic> json) => ImagesDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : TentacledAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class TentacledAttributes {
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final Ext? ext;
  final Mime? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TentacledAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  TentacledAttributes copyWith({
    String? name,
    dynamic alternativeText,
    dynamic caption,
    int? width,
    int? height,
    Formats? formats,
    String? hash,
    Ext? ext,
    Mime? mime,
    double? size,
    String? url,
    dynamic previewUrl,
    String? provider,
    dynamic providerMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TentacledAttributes(
        name: name ?? this.name,
        alternativeText: alternativeText ?? this.alternativeText,
        caption: caption ?? this.caption,
        width: width ?? this.width,
        height: height ?? this.height,
        formats: formats ?? this.formats,
        hash: hash ?? this.hash,
        ext: ext ?? this.ext,
        mime: mime ?? this.mime,
        size: size ?? this.size,
        url: url ?? this.url,
        previewUrl: previewUrl ?? this.previewUrl,
        provider: provider ?? this.provider,
        providerMetadata: providerMetadata ?? this.providerMetadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TentacledAttributes.fromJson(String str) =>
      TentacledAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TentacledAttributes.fromMap(Map<String, dynamic> json) =>
      TentacledAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toMap(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Ext { JPEG, JPG }

final extValues = EnumValues({".jpeg": Ext.JPEG, ".JPG": Ext.JPG});

class Formats {
  final Large? thumbnail;
  final Large? medium;
  final Large? small;
  final Large? large;

  Formats({
    this.thumbnail,
    this.medium,
    this.small,
    this.large,
  });

  Formats copyWith({
    Large? thumbnail,
    Large? medium,
    Large? small,
    Large? large,
  }) =>
      Formats(
        thumbnail: thumbnail ?? this.thumbnail,
        medium: medium ?? this.medium,
        small: small ?? this.small,
        large: large ?? this.large,
      );

  factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        thumbnail:
            json["thumbnail"] == null ? null : Large.fromMap(json["thumbnail"]),
        medium: json["medium"] == null ? null : Large.fromMap(json["medium"]),
        small: json["small"] == null ? null : Large.fromMap(json["small"]),
        large: json["large"] == null ? null : Large.fromMap(json["large"]),
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail?.toMap(),
        "medium": medium?.toMap(),
        "small": small?.toMap(),
        "large": large?.toMap(),
      };
}

class Large {
  final String? name;
  final String? hash;
  final Ext? ext;
  final Mime? mime;
  final dynamic path;
  final int? width;
  final int? height;
  final double? size;
  final String? url;

  Large({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.path,
    this.width,
    this.height,
    this.size,
    this.url,
  });

  Large copyWith({
    String? name,
    String? hash,
    Ext? ext,
    Mime? mime,
    dynamic path,
    int? width,
    int? height,
    double? size,
    String? url,
  }) =>
      Large(
        name: name ?? this.name,
        hash: hash ?? this.hash,
        ext: ext ?? this.ext,
        mime: mime ?? this.mime,
        path: path ?? this.path,
        width: width ?? this.width,
        height: height ?? this.height,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Large.fromMap(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
      };
}

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({"image/jpeg": Mime.IMAGE_JPEG});

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  Meta copyWith({
    Pagination? pagination,
  }) =>
      Meta(
        pagination: pagination ?? this.pagination,
      );

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination?.toMap(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  Pagination copyWith({
    int? page,
    int? pageSize,
    int? pageCount,
    int? total,
  }) =>
      Pagination(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        pageCount: pageCount ?? this.pageCount,
        total: total ?? this.total,
      );

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
