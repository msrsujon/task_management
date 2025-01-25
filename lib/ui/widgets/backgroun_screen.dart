import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/ui/utilies/asset_path.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetPath.backgroundSvg,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
