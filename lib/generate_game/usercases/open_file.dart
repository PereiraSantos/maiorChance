import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

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

  Future<List<int>> buildBettingRaffle() async {
    var excel = await _open();

    List<int> list = [];

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        String value = '${int.parse((row[2]?.value).toString())}'
            '${int.parse((row[3]?.value).toString())}'
            '${int.parse((row[4]?.value).toString())}'
            '${int.parse((row[5]?.value).toString())}'
            '${int.parse((row[6]?.value).toString())}'
            '${int.parse((row[7]?.value).toString())}';

        list.add(int.parse(value));
      }
    }

    return list..sort();
  }

  Future<dynamic> buildBettingRaffleLoto() async {
    var excel = await _openLoto();

    List<int> list1 = [];
    List<int> list2 = [];

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        List<int> listTemp = [];

        listTemp.add(int.parse((row[2]?.value).toString()));
        listTemp.add(int.parse((row[3]?.value).toString()));
        listTemp.add(int.parse((row[4]?.value).toString()));
        listTemp.add(int.parse((row[5]?.value).toString()));
        listTemp.add(int.parse((row[6]?.value).toString()));
        listTemp.add(int.parse((row[7]?.value).toString()));
        listTemp.add(int.parse((row[8]?.value).toString()));
        listTemp.add(int.parse((row[9]?.value).toString()));

        listTemp.add(int.parse((row[10]?.value).toString()));
        listTemp.add(int.parse((row[11]?.value).toString()));
        listTemp.add(int.parse((row[12]?.value).toString()));
        listTemp.add(int.parse((row[13]?.value).toString()));
        listTemp.add(int.parse((row[14]?.value).toString()));
        listTemp.add(int.parse((row[15]?.value).toString()));
        listTemp.add(int.parse((row[16]?.value).toString()));

        listTemp.sort();

        String value = '${int.parse((listTemp[0]).toString())}'
            '${int.parse((listTemp[1]).toString())}'
            '${int.parse((listTemp[2]).toString())}'
            '${int.parse((listTemp[3]).toString())}'
            '${int.parse((listTemp[4]).toString())}'
            '${int.parse((listTemp[5]).toString())}'
            '${int.parse((listTemp[6]).toString())}'
            '${int.parse((listTemp[7]).toString())}';

        list1.add(int.parse(value));

        value = '${num.parse((listTemp[8]).toString())}'
            '${num.parse((listTemp[9]).toString())}'
            '${num.parse((listTemp[10]).toString())}'
            '${num.parse((listTemp[11]).toString())}'
            '${num.parse((listTemp[12]).toString())}'
            '${num.parse((listTemp[13]).toString())}'
            '${num.parse((listTemp[14]).toString())}';

        list2.add(int.parse(value));
      }
    }

    return [list1..sort(), list2..sort()];
  }
}
