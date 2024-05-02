// Estado para manejar un booleano
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// UN SIMPLE BOOLEANO
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// LISTADO DE COLORES INMUTABLE
final colorListProvider = Provider((ref) => colorList);

// UN SIMPLE ENTERO
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// UN OBJETO DE TIPO APPTHEME (CUSTOM)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// puede ser controller o notifier ambos nombres estan bien
class ThemeNotifier extends StateNotifier<AppTheme> {
  // state o estado sera una nueva instancia del AppTheme
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
