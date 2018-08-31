part of universal_html;

Window get window => HtmlIsolate.current.window;

typedef void FrameRequestCallback(num highResTime);

abstract class CustomElementRegistry {
  void define(String name, Object constructor, [Map options]);

  Object get(String name);

  Future whenDefined(String name);
}

abstract class Selection {
  Node get anchorNode;

  int get anchorOffset;

  int get baseOffset;

  Node get baserNode;

  Node get extentNode;

  int get extentOffset;

  Node get focusNode;

  int get focusOffset;
}

class Window extends EventTarget with WindowBase {
  static const EventStreamProvider<MessageEvent> messageEvent =
      const EventStreamProvider<MessageEvent>("message");

  static const EventStreamProvider<PopStateEvent> popStateEvent =
      const EventStreamProvider<PopStateEvent>("popstate");

  Navigator _navigator;

  Storage _localStorage;

  Storage _sessionStorage;

  Console _console;

  Location _location;

  History _history;

  bool _closed = false;

  @visibleForTesting
  Window.constructor();

  factory Window._() => HtmlDriver.current.newWindow();

  ApplicationCache get applicationCache => null;

  bool get closed => _closed;

  Console get console => _console ?? (_console = new Console._());

  CustomElementRegistry get customElements => null;

  num get devicePixelRatio => 1;

  int get innerWidth => 1;

  Future<num> get animationFrame {
    final completer = new Completer<num>.sync();
    requestAnimationFrame((num value) {
      completer.complete(value);
    });
    return completer.future;
  }

  int get innerHeight => 1;

  History get history => _history ?? (_history = new History._());

  Storage get localStorage =>
      _localStorage ?? (_localStorage = new Storage._());

  Location get location => _location ?? (_location = new Location._());

  Navigator get navigator => _navigator ?? (_navigator = new Navigator._());

  Stream<MessageEvent> get onMessage => Window.messageEvent.forTarget(this);

  Stream<PopStateEvent> get onPopState => Window.popStateEvent.forTarget(this);

  int get orientation => 0;

  Storage get sessionStorage =>
      _sessionStorage ?? (_sessionStorage = new Storage._());

  void alert([String message]) {}

  void close() {
    _closed = true;
  }

  void confirm([String message]) {
    throw new UnimplementedError();
  }

  Selection getSelection() {
    return null;
  }

  void postMessage(dynamic message, String targetOrigin,
      [List<Object> transfer]) {
    throw new UnimplementedError();
  }

  Future<FileSystem> requestFileSystem(int size, {bool persistent: false}) {
    throw new UnimplementedError();
  }

  int requestIdleCallback(IdleRequestCallback callback, [Map options]) {
    new Timer(const Duration(microseconds: 1), () {
      final idleDeadline = new IdleDeadline._(
          DateTime.now().add(const Duration(microseconds: 10)));
      callback(idleDeadline);
    });
    return 0;
  }

  void requestAnimationFrame(FrameRequestCallback callback) {
    throw new UnimplementedError();
  }

  void scroll([dynamic options_OR_x, dynamic y, Map scrollOptions]) {}

  void scrollBy([dynamic options_OR_x, dynamic y, Map scrollOptions]) {}

  void scrollTo([dynamic options_OR_x, dynamic y, Map scrollOptions]) {}
}

typedef void IdleRequestCallback(IdleDeadline deadline);

class IdleDeadline {
  final DateTime _deadline;

  IdleDeadline._(this._deadline);

  bool get didTimeout => DateTime.now().isAfter(_deadline);

  double get timeRemaining {
    final now = DateTime.now();
    if (now.isAfter(_deadline)) {
      return 0.0;
    }
    return _deadline.difference(now).inMicroseconds / 1e6;
  }
}

abstract class WindowBase {
  bool get closed;

  History get history;

  Location get location;

  WindowBase get opener => null;

  WindowBase get parent => null;

  WindowBase get top => null;

  void close();

  void postMessage(dynamic message, String targetOrigin,
      [List<Object> transfer]);
}
