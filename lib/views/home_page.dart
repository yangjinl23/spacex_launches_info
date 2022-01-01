import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_launches_info/components/app_loading.dart';
import 'package:spacex_launches_info/components/launch_table_cell.dart';
import 'package:spacex_launches_info/components/launch_table_title.dart';
import 'package:spacex_launches_info/components/search_text_field.dart';
import 'package:spacex_launches_info/model/launch.dart';
import 'package:spacex_launches_info/utils/constants.dart';
import 'package:spacex_launches_info/utils/navigation_utils.dart';
import 'package:spacex_launches_info/view_models/launches_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String query = '';
  List<Launch?>? launches = [];
  bool isDescending = false;
  // final _successTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LaunchesViewModel launchesViewModel = context.watch<LaunchesViewModel>();
    launches = launchesViewModel.launchListModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          appName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              icon: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.compare_arrows,
                  size: 28,
                ),
              ),
              label: Text(
                isDescending ? 'Descending' : 'Ascending',
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                setState(() {
                  isDescending = !isDescending;
                });
              },
            ),
            // buildFilterSearch(),
            launchTableTitle(),
            launchTable(launchesViewModel),
          ],
        ),
      ),
    );
  }

  // Widget buildFilterSearch() {
  //   return SearchTextField(
  //     successTextController: _successTextController,
  //     text: query,
  //     hintText: successStatusLabel,
  //   );
  // }

  Widget launchTableTitle() {
    return LaunchTableTitle();
  }

  Widget launchTable(LaunchesViewModel launchesViewModel) {
    if (launchesViewModel.loading) {
      return AppLoading();
    }

    return Expanded(
      child: ListView.separated(
        itemCount: launchesViewModel.launchListModel!.length,
        itemBuilder: (context, index) {
          final soretedLaunches = isDescending
              ? (launches!
                ..sort((a, b) => a!.missionName!.compareTo(b!.missionName!)))
              : launches!.reversed.toList();
          final launch = soretedLaunches[index]!;

          return LaunchTableCell(
            launch: launch,
            onTap: () async {
              launchesViewModel.setselectedLaunch(launch);
              openLaunchDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
