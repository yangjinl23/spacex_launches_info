import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:spacex_launches_info/model/launch.dart';
import 'package:spacex_launches_info/repo/api_status.dart';
import 'package:spacex_launches_info/utils/constants.dart';

class LaunchesRepository {
  static Future<Object?> getLaunches() async {
    try {
      var response = await http.get(Uri.parse(launchesList));

      if (SUCCESS == response.statusCode) {
        return Success(response: dataFromJson(response.body));
      }
      return Failure(
          code: LAUNCH_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
