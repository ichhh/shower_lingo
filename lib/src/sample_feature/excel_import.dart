import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

Future<void> readExcelFile() async {
  print('223');
  final byteData = await rootBundle.load('assets/data/shower_lingo.xlsx');
  print(byteData.buffer.asUint8List().runtimeType); //
  // Now you can use to get the file's bytes
}

readExcel() async {
  final bytes = await rootBundle.load('assets/data/shower_lingo.xlsx');
  // print(byteData.buffer.asUint8List().runtimeType);
  Uint8List bytesList = bytes.buffer.asUint8List();
  var excel = Excel.decodeBytes(bytesList);
  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table]?.maxColumns);
    print(excel.tables[table]?.maxRows);

    var rows = excel.tables[table]?.rows ?? [];

    for (var row in rows) {
      for (var cell in row) {
        print('cell ${cell?.rowIndex}/${cell?.columnIndex}');
        final value = cell?.value;
        final numFormat = cell?.cellStyle?.numberFormat ?? NumFormat.standard_0;
        switch (value) {
          case null:
            print('  empty cell');
            print('  format: ${numFormat}');
          case TextCellValue():
            print('  text: ${value.value}');
          case FormulaCellValue():
            print('  formula: ${value.formula}');
            print('  format: ${numFormat}');
          case IntCellValue():
            print('  int: ${value.value}');
            print('  format: ${numFormat}');
          case BoolCellValue():
            print('  bool: ${value.value ? 'YES!!' : 'NO..'}');
            print('  format: ${numFormat}');
          case DoubleCellValue():
            print('  double: ${value.value}');
            print('  format: ${numFormat}');
          case DateCellValue():
            print(
                '  date: ${value.year} ${value.month} ${value.day} (${value.asDateTimeLocal()})');
          case TimeCellValue():
            print(
                '  time: ${value.hour} ${value.minute} ... (${value.asDuration()})');
          case DateTimeCellValue():
            print(
                '  date with time: ${value.year} ${value.month} ${value.day} ${value.hour} ... (${value.asDateTimeLocal()})');
        }

        print('$row');
      }
    }
  }
}
