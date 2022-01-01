import 'package:flutter/material.dart';
import 'package:spacex_launches_info/views/launch_details_page.dart';

void openLaunchDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LaunchDetailPage(),
    ),
  );
}
