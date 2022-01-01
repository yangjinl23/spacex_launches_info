import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_launches_info/utils/constants.dart';
import 'package:spacex_launches_info/view_models/launches_view_model.dart';

class LaunchDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LaunchesViewModel launchesViewModel = context.watch<LaunchesViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          launchesViewModel.selectedLaunch!.missionName!,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      launchDetailLabel,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      flightNumberLabel,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Text(
                      launchesViewModel.selectedLaunch!.flightNumber.toString(),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      launchYearLabel,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Text(
                      launchesViewModel.selectedLaunch!.launchYear!,
                    ),
                  ),
                  Center(
                    child: Text(
                      detailsDescriptionLabel,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      launchesViewModel.selectedLaunch!.details == null
                          ? "null"
                          : launchesViewModel.selectedLaunch!.details!,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          rocketDetailLabel,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          rocketIdLabel,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          launchesViewModel.selectedLaunch!.rocket!.rocketId!,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          rocketNameLabel,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          launchesViewModel.selectedLaunch!.rocket!.rocketName!,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          rocketTypeLabel,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          launchesViewModel.selectedLaunch!.rocket!.rocketType!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
