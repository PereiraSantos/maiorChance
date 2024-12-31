import 'dart:math';

class Betting {
  final int _size;
  final int _limit;

  Betting({required int size, required int limit})
      : _size = size,
        _limit = limit;

  create() => _buildBetting([])..sort();

  List<int> _buildBetting(List<int> list) {
    if (list.length > _limit) return list;

    int value = _nextNumber();

    if (!list.contains(value)) list.add(value);

    return _buildBetting(list);
  }

  _nextNumber() => Random().nextInt(_size) + 1;
}
