// To parse this JSON data, do
//
//     final employee = employeeFromMap(jsonString);

import 'dart:convert';

import 'package:employee_viewer/models/serializable_base.dart';

class Employee implements ISerializable<Employee> {
  Employee({
    this.id = 0,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  final int id;
  final String? name;
  final String? username;
  final String? email;
  final String? profileImage;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  factory Employee.fromJson(String str) => Employee.fromMap(json.decode(str));

  @override
  Map<String, dynamic> toJson() => toMap();

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profileImage: json["profile_image"],
        address: Address.fromMap(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: json["company"] == null ? null : Company.fromMap(json["company"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "profile_image": profileImage,
        "address": address?.toMap(),
        "phone": phone,
        "website": website,
        "company": company?.toMap(),
      };

  @override
  Employee fromJson(Map<String, dynamic> json) => Employee.fromMap(json);
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromMap(json["geo"]),
      );

  Map<String, dynamic> toMap() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toMap(),
      };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  final String? lat;
  final String? lng;

  factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  final String? name;
  final String? catchPhrase;
  final String? bs;

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
