import 'dart:js' as js;
import 'package:flutter/foundation.dart' show kIsWeb;

/// Анхны өнгөнүүдийг тохируулах
void initGarageColors() {
  if (!kIsWeb) return;
  js.context.callMethod('initGarageColors');
}

/// Материалын өнгө солих
void setMatColor(String matName, double r, double g, double b, double a) {
  if (!kIsWeb) return;
  js.context.callMethod('setMatColor', [matName, r, g, b, a]);
}

/// Улаан өнгө
void applyCodeColor(String code) {
  if (code.length != 4) return;
  setMatColor(code, 1.0, 0.0, 0.0, 1.0);
}

/// Код байхгүй үед бүгдийг анхны (default) өнгөөр нь болгох
void resetGarageColors() {
  initGarageColors();
}
