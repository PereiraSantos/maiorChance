import 'dart:isolate';
import 'dart:math';

class BuildGame {
  final int _size;
  final List<int> _list = [];

  BuildGame(int size) : _size = size;

  get listGame => _list;

  List<int> buildList() {
    for (var i = 0; i < _size; i++) {
      int element = _generate();

      if (!_list.contains(element)) _list.add(element);
    }
    return _list;
  }

  void getList(SendPort sendPort) => sendPort.send(buildList());

  int _generate() => Random().nextInt(_size);
}
