
import 'package:figma_squircle/figma_squircle.dart';

import '../../config.dart';

extension FixitUserExtensions on Widget {


  Widget bottomSheetExtension(context) => Container(
      decoration: ShapeDecoration(
          color: appColor(context).whiteBg,
          shape: const SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.only(
                  topLeft: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
                  topRight:
                  SmoothRadius(cornerRadius: 20, cornerSmoothing: 1)))),
      child: this);

}
