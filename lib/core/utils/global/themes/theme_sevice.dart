import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends Equatable {
  final GetStorage _box = GetStorage();
  final String _key = "isDarKMode";

  Future<void> _saveThemeToBox({required bool isDark}) async {
    await _box.write(_key, isDark);
  }

  bool _loadThemeFromBox() {
    return _box.read<bool>(_key) ?? true;
  }

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  Future<void> switchTheme() async {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    await _saveThemeToBox(isDark: !_loadThemeFromBox());
  }

  @override
  List<Object> get props => [_box, _key];
}
