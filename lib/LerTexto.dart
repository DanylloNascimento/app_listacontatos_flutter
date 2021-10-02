import 'dart:async';
import 'package:flutter/services.dart';

class  LerTexto {
  static Future<String> lerTexto(String diretorio) async {
  return await rootBundle.loadString(diretorio);
}
}

