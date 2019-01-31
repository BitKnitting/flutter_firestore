import 'package:flutter/material.dart';
import 'test_icons_icons.dart';

const IconsMap = {
  'keyboard_arrow_right': Icons.keyboard_arrow_right,
  'power': Icons.power,
  'clipboard': TestIcons.clipboard,
};
IconData getIcon({String name}) {
  if (IconsMap[name] != null) {
    return IconsMap[name];
  } else {
    return null;
  }
}
