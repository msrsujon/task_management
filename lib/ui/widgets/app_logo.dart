import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../utilies/asset_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPath.logoSvg,
      width: 120,
    );
  }
}
