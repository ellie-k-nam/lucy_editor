part of re_editor;

class _Trace {

  static final Map<String, DateTime> _timestamps = {};

  static void begin(String name) {
    _timestamps[name] = DateTime.now();
  }

  static void end(String name, [bool microsecond = false]) {
    final DateTime? time = _timestamps.remove(name);
    if (time != null) {
      if (microsecond) {
        //print('[${DateTime.now()}] $name costs ${DateTime.now().microsecondsSinceEpoch - time.microsecondsSinceEpoch} us');
      } else {
        //print('[${DateTime.now()}] $name costs ${DateTime.now().millisecondsSinceEpoch - time.millisecondsSinceEpoch} ms');
      }
    }
  }

}

class StopWatch {
  var _milliseconds = 0;
  static final StopWatch _instance = StopWatch._();
  final Stopwatch _watch = Stopwatch();

  StopWatch._();

  factory StopWatch.start()  {
    _instance._watch.start();
    return _instance;
  }

  int get milliseconds => _milliseconds;

  String stop() {
    _watch.stop();
    _milliseconds = _watch.elapsedMilliseconds;
    return formatTime();
  }

  void resetStart() {
    _watch.reset();
    _watch.start();
  }

  String formatTime() {
    int seconds = (_milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

}