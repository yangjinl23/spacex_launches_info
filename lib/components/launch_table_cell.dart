import 'package:flutter/material.dart';
import 'package:spacex_launches_info/model/launch.dart';

class LaunchTableCell extends StatelessWidget {
  final Launch? launch;
  final VoidCallback? onTap;

  LaunchTableCell({this.launch, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              launch!.missionName!,
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            Text(
              launch!.launchSuccess.toString(),
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
