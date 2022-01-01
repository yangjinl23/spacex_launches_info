import 'package:flutter/material.dart';
import 'package:spacex_launches_info/model/launch.dart';
import 'package:spacex_launches_info/repo/api_status.dart';
import 'package:spacex_launches_info/repo/launches_repository.dart';

class LaunchesViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Launch?>? _launchListModel = [];
  Launch? _selectedLaunch;

  bool get loading => _loading;
  List<Launch?>? get launchListModel => _launchListModel;
  Launch? get selectedLaunch => _selectedLaunch;

  LaunchesViewModel() {
    getLaunches();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLaunchListModel(List<Launch> launchListModel) {
    _launchListModel = launchListModel;
  }

  setselectedLaunch(Launch launch) {
    _selectedLaunch = launch;
  }

  getLaunches() async {
    setLoading(true);

    var response = await LaunchesRepository.getLaunches();

    if (response is Success) {
      setLaunchListModel(response.response as List<Launch>);
    }

    setLoading(false);
  }
}
