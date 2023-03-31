/*
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class City {
  final String? username;
  final String? email;
  final String? contact;
  final String? country;
  final String? state;
  final String? city;
  final String? address1;
  final String? address2;
  final String? user_id;
  final String? date;
  final String? latitude;
  final String? longitude;


*/
/*  final List<String>? regions;*//*


  City({this.latitude, this.longitude,
    this.username,
    this.email,
    this.contact,
    this.city,
    this.address1,
    this.address2,
    this.user_id,
    this.date,
    this.state,
    this.country,


  });

  factory City.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return City(
      username: data?['username'],
      state: data?['state'],
      country: data?['country'],
      contact: data?['contact'],
      city: data?['city'],
      address1: data?['address1'],
      address2: data?['address2'],
      user_id: data?['user_id'],
      date: data?['date'],
      latitude: data?['latitude'],
      longitude: data?['longitude'],


    );
  }
  */
/*    regions:
      data?['regions'] is Iterable ? List.from(data?['regions']) : null,*//*


  Map<String, dynamic> toFirestore()
  {
    return {
      if (username != null) "name": username,
      if (state != null) "state": state,
      if (country != null) "country": country,
      if (contact != null) "country": contact,
      if (city != null) "country": city,
      if (address1 != null) "country": address1,
      if (address2 != null) "country": address2,
      if (user_id != null) "country": user_id,
      if (date != null) "country": date,
      if (latitude != null) "country": latitude,
      if (longitude != null) "country": longitude,

    };
  }
}
*/
// To parse this JSON data, do
//
//     final userProfileData = userProfileDataFromJson(jsonString);

import 'dart:convert';

UserProfileData userProfileDataFromJson(String str) => UserProfileData.fromJson(json.decode(str));

String userProfileDataToJson(UserProfileData data) => json.encode(data.toJson());

class UserProfileData
{
  UserProfileData({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String ?message;
  Data ?data;

  factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.userLogin,
    this.userEmail,
    this.roleMasterId,
    this.uType,
    this.userUrl,
    this.userRegistered,
    this.userStatus,
    this.displayName,
    this.mobileNo,
    this.zipCode,
    this.block,
    this.regBy,
    this.profile,
  });

  String ?id;
  String ?userLogin;
  String ?userEmail;
  String ?roleMasterId;
  String ?uType;
  String ?userUrl;
  String ?userRegistered;
  String ?userStatus;
  String ?displayName;
  String ?mobileNo;
  String ?zipCode;
  String ?block;
  String ?regBy;
  String ?profile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"],
    userLogin: json["user_login"]??"",
    userEmail: json["user_email"]??"",
    roleMasterId: json["role_master_id"]??"",
    uType: json["u_type"]??"",
    userUrl: json["user_url"]??"",
    userRegistered: json["user_registered"]??"",
    userStatus: json["user_status"]??"",
    displayName: json["display_name"]??"",
    mobileNo: json["mobile_no"]??"",
    zipCode: json["zip_code"]??"",
    block: json["block"]??"",
    regBy: json["reg_by"]??"",
    profile: json["profile"]??"",
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "user_login": userLogin,
    "user_email": userEmail,
    "role_master_id": roleMasterId,
    "u_type": uType,
    "user_url": userUrl,
    "user_registered": userRegistered,
    "user_status": userStatus,
    "display_name": displayName,
    "mobile_no": mobileNo,
    "zip_code": zipCode,
    "block": block,
    "reg_by": regBy,
    "profile": profile,
  };
}
