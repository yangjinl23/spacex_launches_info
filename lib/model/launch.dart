import 'dart:convert';

List<Launch> dataFromJson(String str) =>
    List<Launch>.from(json.decode(str).map((x) => Launch.fromJson(x)));

String dataToJson(List<Launch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Launch {
  Launch({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.upcoming,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.tentativeMaxPrecision,
    this.tbd,
    this.launchWindow,
    this.rocket,
    this.ships,
    this.telemetry,
    this.launchSite,
    this.launchSuccess,
    this.launchFailureDetails,
    this.details,
    this.timeline,
  });

  int? flightNumber;
  String? missionName;
  List<dynamic>? missionId;
  bool? upcoming;
  String? launchYear;
  int? launchDateUnix;
  DateTime? launchDateUtc;
  DateTime? launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;
  int? launchWindow;
  Rocket? rocket;
  List<dynamic>? ships;
  Telemetry? telemetry;
  LaunchSite? launchSite;
  bool? launchSuccess;
  LaunchFailureDetails? launchFailureDetails;
  String? details;
  Timeline? timeline;

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        flightNumber: json["flight_number"],
        missionName: json["mission_name"],
        missionId: List<dynamic>.from(json["mission_id"].map((x) => x)),
        upcoming: json["upcoming"],
        launchYear: json["launch_year"],
        launchDateUnix: json["launch_date_unix"],
        launchDateUtc: DateTime.parse(json["launch_date_utc"]),
        launchDateLocal: DateTime.parse(json["launch_date_local"]),
        isTentative: json["is_tentative"],
        tentativeMaxPrecision: json["tentative_max_precision"],
        tbd: json["tbd"],
        launchWindow: json["launch_window"],
        rocket: Rocket.fromJson(json["rocket"]),
        ships: List<dynamic>.from(json["ships"].map((x) => x)),
        telemetry: Telemetry.fromJson(json["telemetry"]),
        launchSite: LaunchSite.fromJson(json["launch_site"]),
        launchSuccess: json["launch_success"],
        launchFailureDetails: json["launch_failure_details"] == null
            ? null
            : LaunchFailureDetails.fromJson(json["launch_failure_details"]),
        details: json["details"],
        timeline: Timeline.fromJson(json["timeline"]),
      );

  Map<String, dynamic> toJson() => {
        "flight_number": flightNumber,
        "mission_name": missionName,
        "mission_id": List<dynamic>.from(missionId!.map((x) => x)),
        "upcoming": upcoming,
        "launch_year": launchYear,
        "launch_date_unix": launchDateUnix,
        "launch_date_utc": launchDateUtc!.toIso8601String(),
        "launch_date_local": launchDateLocal!.toIso8601String(),
        "is_tentative": isTentative,
        "tentative_max_precision": tentativeMaxPrecision,
        "tbd": tbd,
        "launch_window": launchWindow,
        "rocket": rocket!.toJson(),
        "ships": List<dynamic>.from(ships!.map((x) => x)),
        "telemetry": telemetry!.toJson(),
        "launch_site": launchSite!.toJson(),
        "launch_success": launchSuccess,
        "launch_failure_details": launchFailureDetails == null
            ? null
            : launchFailureDetails!.toJson(),
        "details": details,
        "timeline": timeline!.toJson(),
      };
}

class LaunchFailureDetails {
  LaunchFailureDetails({
    this.time,
    this.altitude,
    this.reason,
  });

  int? time;
  int? altitude;
  String? reason;

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) =>
      LaunchFailureDetails(
        time: json["time"],
        altitude: json["altitude"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "altitude": altitude,
        "reason": reason,
      };
}

class LaunchSite {
  LaunchSite({
    this.siteId,
    this.siteName,
    this.siteNameLong,
  });

  String? siteId;
  String? siteName;
  String? siteNameLong;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: json["site_id"],
        siteName: json["site_name"],
        siteNameLong: json["site_name_long"],
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteId,
        "site_name": siteName,
        "site_name_long": siteNameLong,
      };
}

class Rocket {
  Rocket({
    this.rocketId,
    this.rocketName,
    this.rocketType,
  });

  String? rocketId;
  String? rocketName;
  String? rocketType;

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: json["rocket_id"],
        rocketName: json["rocket_name"],
        rocketType: json["rocket_type"],
      );

  Map<String, dynamic> toJson() => {
        "rocket_id": rocketId,
        "rocket_name": rocketName,
        "rocket_type": rocketType,
      };
}

class Telemetry {
  Telemetry({
    this.flightClub,
  });

  dynamic flightClub;

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        flightClub: json["flight_club"],
      );

  Map<String, dynamic> toJson() => {
        "flight_club": flightClub,
      };
}

class Timeline {
  Timeline({
    this.webcastLiftoff,
  });

  int? webcastLiftoff;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        webcastLiftoff: json["webcast_liftoff"],
      );

  Map<String, dynamic> toJson() => {
        "webcast_liftoff": webcastLiftoff,
      };
}
