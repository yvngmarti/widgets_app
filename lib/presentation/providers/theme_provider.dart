// Estado para manejar un booleano
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// UN SIMPLE BOOLEANO
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// LISTADO DE COLORES INMUTABLE
final colorListProvider = Provider((ref) => colorList);

// UN SIMPLE ENTERO
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);
