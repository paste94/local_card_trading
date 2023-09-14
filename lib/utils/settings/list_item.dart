import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SpacingTile extends AbstractSettingsTile {
  final double height;

  const SpacingTile({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class DividerTile extends AbstractSettingsTile {
  @override
  Widget build(BuildContext context) {
    return Divider();
  }
}
