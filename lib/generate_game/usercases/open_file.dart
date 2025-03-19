import 'dart:collection';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:maior_chance/utils/hash.dart';

class OpenFile {
  Future<Excel> _open() async {
    ByteData data = await rootBundle.load('assets/mega_sena.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return Excel.decodeBytes(bytes);
  }

  Future<Excel> _openLoto() async {
    ByteData data = await rootBundle.load('assets/loto_facil.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return Excel.decodeBytes(bytes);
  }

  Future<Map<String, String>> buildBettingRaffle() async {
    var excel = await _open();

    Map<String, String> list = HashMap();

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        String value = '${(row[2]?.value)}${(row[3]?.value)}${(row[4]?.value)}${(row[5]?.value)}${(row[6]?.value)}${(row[7]?.value)}';

        final hash = getHash(value);

        list.addAll({hash: value});
      }
    }

    return list;
  }

  Future<Map<String, String>> buildBettingRaffleLoto() async {
    var excel = await _openLoto();

    Map<String, String> list = HashMap();

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        String value = '${(row[2])}${(row[3])}${(row[4])}${(row[5])}${(row[6])}${(row[7])}${(row[8])}${(row[9])}${(row[10])}${(row[11])}${(row[12])}'
            '${(row[13])}${(row[14])}${(row[16])}${(row[16])}';

        final hash = getHash(value);

        list.addAll({hash: value});
      }
    }

    return list;
  }

  String getHash(String value) => Hash().textToMd5(value);
}
