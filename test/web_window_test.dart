import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:yaru_window_platform_interface/yaru_window_platform_interface.dart';
import 'package:yaru_window_web/yaru_window_web.dart';

void main() {
  test('registers itself', () {
    YaruWebWindow.registerWith(null);
    expect(YaruWindowPlatform.instance, isA<YaruWebWindow>());
  });

  test('window controls are accepted and ignored', () async {
    final window = YaruWebWindow();

    await window.setBrightness(0, Brightness.dark);
    await window.setControlButtonsVisible(0, false);
    await window.setResizable(0, false);
    await window.setMinimumSize(0, const Size(100, 100));
    await window.setMaximumSize(0, const Size(800, 600));
    await window.setSize(0, const Size(400, 300));
    await window.setPosition(0, const Offset(10, 20));
    await window.center(0);
    await window.setAlwaysOnTop(0, true);
    await window.setSkipTaskbar(0, true);
  });

  test('state is not controllable', () async {
    final state = await YaruWebWindow().state(0);
    expect(state.isClosable, isFalse);
    expect(state.isMovable, isFalse);
  });
}
