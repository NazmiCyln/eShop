import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ConstantsColor {
  static const BottomNavigationBarCircleColor = Color(0xFF1D6C90);
  static const BottomNavigationBarInactiveIconColor = Color(0xFF106182);
  static const BottomNavigationBarBackgroundColor = Color(0xFFE2EEFD);
  static const ProductListTitle = Color(0x9E02266A);
  static const PagesBackgroundColor = Color(0xFFCED8DB);
}

class ConstantSpinkit {
  static const spinkitCircular = SpinKitSpinningLines(
      color: ConstantsColor.BottomNavigationBarCircleColor);
}
