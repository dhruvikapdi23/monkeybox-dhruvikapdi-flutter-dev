//app file


import 'package:monkeybox_dhruvi/screens/home/home.dart';

import '../config.dart';
import 'index.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {

    routeName.home: (p0) => const HomePage(),

  };
}
