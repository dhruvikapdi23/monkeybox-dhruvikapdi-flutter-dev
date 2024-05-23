

import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

part 'scale.dart';


FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.normal;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
FontWeight extraThickBold = FontWeight.bold;

//bold studio font

//sans font
TextStyle dmSans({double? fontsize, fontWeight}) =>
    GoogleFonts.dmSans(fontSize: fontsize, fontWeight: fontWeight);


class AppCss {

//Text Style dmSans extra bold
  TextStyle dmSansExtraBold70 = dmSans( fontWeight: extraBold,fontsize:Sizes.s70);
  TextStyle dmSansExtraBold65 = dmSans( fontWeight:extraBold ,fontsize:Sizes.s65);
  TextStyle dmSansExtraBold60 = dmSans( fontWeight: extraBold,fontsize:Sizes.s60);
  TextStyle dmSansExtraBold40 = dmSans( fontWeight: extraBold,fontsize:Sizes.s40);
  TextStyle dmSansExtraBold20 = dmSans( fontWeight: extraBold,fontsize:Sizes.s20);
  TextStyle dmSansExtraBold25 = dmSans( fontWeight:extraBold ,fontsize:Sizes.s25);
  TextStyle dmSansExtraBold30 = dmSans( fontWeight: extraBold,fontsize:Sizes.s30);

  //Text Style dmSans bold
  TextStyle dmSansblack28 = dmSans(fontWeight: black,fontsize:Sizes.s28);
  TextStyle dmSansblack24 = dmSans(fontWeight: black,fontsize:Sizes.s24);
  TextStyle dmSansblack20 = dmSans(fontWeight: black,fontsize:Sizes.s20);
  TextStyle dmSansblack18 = dmSans(fontWeight: black,fontsize:Sizes.s18);
  TextStyle dmSansblack16 = dmSans(fontWeight: black,fontsize:Sizes.s16);
  TextStyle dmSansblack14 = dmSans(fontWeight: black,fontsize:Sizes.s14);
  TextStyle dmSansblack13 = dmSans(fontWeight: black,fontsize:Sizes.s13);


  //Text Style dmSans bold
  TextStyle dmSansExtraBold22 = dmSans(fontWeight: extraBold,fontsize:Sizes.s22);
  TextStyle dmSansExtraBold18 = dmSans(fontWeight: extraBold,fontsize:Sizes.s18);
  TextStyle dmSansExtraBold16 = dmSans(fontWeight: extraBold,fontsize:Sizes.s16);
  TextStyle dmSansExtraBold14 = dmSans(fontWeight: extraBold,fontsize:Sizes.s14);
  TextStyle dmSansExtraBold12 = dmSans(fontWeight: extraBold,fontsize:Sizes.s12);

  //Text Style semi dmSans bold
  TextStyle dmSansBold50 = dmSans(fontWeight: bold,fontsize:Sizes.s50);
  TextStyle dmSansBold38 = dmSans(fontWeight: bold,fontsize:Sizes.s38);
  TextStyle dmSansBold35 = dmSans(fontWeight: bold,fontsize:Sizes.s35);
  TextStyle dmSansBold24 = dmSans(fontWeight: bold,fontsize:Sizes.s24);
  TextStyle dmSansBold20 = dmSans(fontWeight: bold,fontsize:Sizes.s20);
  TextStyle dmSansBold18 = dmSans(fontWeight: bold,fontsize:Sizes.s18);
  TextStyle dmSansBold16 = dmSans(fontWeight: bold,fontsize:Sizes.s16);
  TextStyle dmSansBold15 = dmSans(fontWeight: bold,fontsize:Sizes.s15);
  TextStyle dmSansBold17 = dmSans(fontWeight: bold,fontsize:Sizes.s17);
  TextStyle dmSansBold14 = dmSans(fontWeight: bold,fontsize:Sizes.s14);
  TextStyle dmSansBold12 = dmSans(fontWeight: bold,fontsize:Sizes.s12);
  TextStyle dmSansBold10 = dmSans(fontWeight: bold,fontsize:Sizes.s10);

  TextStyle dmSansSemiBold24= dmSans(fontWeight: semiBold,fontsize:Sizes.s24);
  TextStyle dmSansSemiBold22= dmSans(fontWeight: semiBold,fontsize:Sizes.s22);
  TextStyle dmSansSemiBold20= dmSans(fontWeight: semiBold,fontsize:Sizes.s20);
  TextStyle dmSansSemiBold18= dmSans(fontWeight: semiBold,fontsize:Sizes.s18);
  TextStyle dmSansSemiBold16= dmSans(fontWeight: semiBold,fontsize:Sizes.s16);
  TextStyle dmSansSemiBold15= dmSans(fontWeight: semiBold,fontsize:Sizes.s15);
  TextStyle dmSansSemiBold13= dmSans(fontWeight: semiBold,fontsize:Sizes.s13);
  TextStyle dmSansSemiBold14= dmSans(fontWeight: semiBold,fontsize:Sizes.s14);
  TextStyle dmSansSemiBold12= dmSans(fontWeight: semiBold,fontsize:Sizes.s12);
  TextStyle dmSansSemiBold10= dmSans(fontWeight: semiBold,fontsize:Sizes.s10);


  //Text Style dmSans medium
  TextStyle dmSansMedium28 = dmSans(fontWeight: medium,fontsize:Sizes.s28);
  TextStyle dmSansMedium22 = dmSans(fontWeight: medium,fontsize:Sizes.s22);
  TextStyle dmSansMedium20 = dmSans(fontWeight: medium,fontsize:Sizes.s20);
  TextStyle dmSansMedium18 = dmSans(fontWeight: medium,fontsize:Sizes.s18);
  TextStyle dmSansMedium16 = dmSans(fontWeight: medium,fontsize:Sizes.s16);
  TextStyle dmSansMedium15 = dmSans(fontWeight: medium,fontsize:Sizes.s15);
  TextStyle dmSansMedium14 = dmSans(fontWeight: medium,fontsize:Sizes.s14);
  TextStyle dmSansMedium13 = dmSans(fontWeight: medium,fontsize:Sizes.s13);
  TextStyle dmSansMedium12 = dmSans(fontWeight: medium,fontsize:Sizes.s12);
  TextStyle dmSansMedium11 = dmSans(fontWeight: medium,fontsize:Sizes.s11);
  TextStyle dmSansMedium10 = dmSans(fontWeight: medium,fontsize:Sizes.s10);
  TextStyle dmSansMedium8 = dmSans(fontWeight: medium,fontsize:Sizes.s8);

  //Text Style dmSans regular
  TextStyle dmSansRegular18 = dmSans(fontWeight: regular,fontsize:Sizes.s18);
  TextStyle dmSansRegular16 = dmSans(fontWeight: regular,fontsize:Sizes.s16);
  TextStyle dmSansRegular14 = dmSans(fontWeight: regular,fontsize:Sizes.s14);
  TextStyle dmSansRegular13 = dmSans(fontWeight: regular,fontsize:Sizes.s13);
  TextStyle dmSansRegular12 = dmSans(fontWeight: regular,fontsize:Sizes.s12);
  TextStyle dmSansRegular11 = dmSans(fontWeight: regular,fontsize:Sizes.s11);


  TextStyle dmSansLight16 = dmSans(fontWeight: light,fontsize:Sizes.s16);
  TextStyle dmSansLight14 = dmSans(fontWeight: light,fontsize:Sizes.s14);
  TextStyle dmSansLight12 = dmSans(fontWeight: light,fontsize:Sizes.s12);

  //TextStyle dmSansMedium16 = sans(fontWeight: medium,fontsize:Sizes.s16);

}
