/// Implements essential APIs of "dart:html" for rendering browser apps in the VM or Flutter.
///
/// Behavior:
///   * In the browser environment, exports 'dart:html'.
///   * Elsewhere exports its own implementations essential APIs (DOM nodes, window.location, etc.).
export 'src/html.dart' if (dart.library.html) 'dart:html'
    hide HtmlIsolate, HtmlDriver, NodeParserDriver, ZoneLocal;
