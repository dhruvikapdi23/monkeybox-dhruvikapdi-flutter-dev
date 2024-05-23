
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/common/extension/widget_extension.dart';

import '../../config.dart';

class ButtonCommon extends StatelessWidget {
  final String title;
  final double? padding, margin, radius, height, fontSize, width;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color, fontColor, borderColor;
  final Widget? icon;
  final FontWeight? fontWeight;
  final bool isShadow;


  const ButtonCommon(
      {super.key,
      required this.title,
      this.padding,
      this.margin = 0,
      this.radius = Sizes.s10,
      this.height = 50,
      this.fontSize = Sizes.s30,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.borderColor,
      this.width,
      this.fontWeight = FontWeight.w700,this.isShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: margin!),
        decoration: BoxDecoration(

          color: color ?? appColor(context).buttonColor,
boxShadow: isShadow ?[
  BoxShadow(
    color: appColor(context).darkText.withOpacity(.1),
    blurRadius: 12
  )
]:[],
borderRadius: BorderRadius.circular(radius ??10),
          border: Border.all(color: borderColor ?? appColor(context).trans),
        ),/*BoxDecoration(
            border: Border.all(color: borderColor ?? appColor(context).trans),
            color: appColor(context).primary,
            borderRadius: BorderRadius.circular(radius!))*/
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [

          Text(title,
              textAlign: TextAlign.center,
              style: style ??
                  appCss.dmSansSemiBold16.textColor(fontColor ?? appColor(context).darkText)),
          if (icon != null)
            Row(children: [const HSpace(Sizes.s2),icon ?? const HSpace(0), ]).paddingOnly(left: Sizes.s8),
        ])).inkWell(onTap: onTap);
  }
}
