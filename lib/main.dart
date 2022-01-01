import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spacex_launches_info/utils/constants.dart';
import 'package:spacex_launches_info/view_models/launches_view_model.dart';
import 'package:spacex_launches_info/views/home_page.dart';

void main() {
  runApp(SpacexLaunchesInfo());
}

class SpacexLaunchesInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LaunchesViewModel()),
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
