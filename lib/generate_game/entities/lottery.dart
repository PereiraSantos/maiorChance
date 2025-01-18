import 'package:floor/floor.dart';

@Entity(tableName: 'lottery')
class Lottery {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;

  @ColumnInfo(name: 'type')
  int? type;

  @ColumnInfo(name: 'one')
  int? one;

  @ColumnInfo(name: 'two')
  int? two;

  @ColumnInfo(name: 'three')
  int? three;

  @ColumnInfo(name: 'four')
  int? four;

  @ColumnInfo(name: 'five')
  int? five;

  @ColumnInfo(name: 'six')
  int? six;

  @ColumnInfo(name: 'seven')
  int? seven;

  @ColumnInfo(name: 'eight')
  int? eight;

  @ColumnInfo(name: 'nine')
  int? nine;

  @ColumnInfo(name: 'ten')
  int? ten;

  @ColumnInfo(name: 'eleven')
  int? eleven;

  @ColumnInfo(name: 'twelve')
  int? twelve;

  @ColumnInfo(name: 'thirteen')
  int? thirteen;

  @ColumnInfo(name: 'fourteen')
  int? fourteen;

  @ColumnInfo(name: 'fifteen')
  int? fifteen;

  Lottery({
    this.id,
    this.type,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
    this.six,
    this.seven,
    this.eight,
    this.nine,
    this.ten,
    this.eleven,
    this.twelve,
    this.thirteen,
    this.fourteen,
    this.fifteen,
  });

  @override
  String toString() {
    var result = '';
    if (one != null) result += '$one ';
    if (two != null) result += '- $two ';
    if (three != null) result += '- $three ';
    if (four != null) result += '- $four ';
    if (five != null) result += '- $five ';
    if (six != null) result += '- $six ';
    if (seven != null) result += '- $seven ';
    if (eight != null) result += '- $eight';
    if (nine != null) result += '- $nine ';
    if (ten != null) result += '- $ten ';
    if (eleven != null) result += '- $eleven ';
    if (twelve != null) result += '- $twelve ';
    if (thirteen != null) result += '- $thirteen ';
    if (fourteen != null) result += '- $fourteen ';
    if (fifteen != null) result += '- $fifteen ';

    return result;
  }
}
