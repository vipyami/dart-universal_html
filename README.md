# Introduction

This package implements a subset of _dart:html_ in all platforms (browser, VM, and Flutter).

We aim to test that the APIs behave identically to _dart:html_ code running in Chrome. 

__The project contains known bugs__. Contributions are welcome.

## Features
### Main APIs
  * HTML/XML nodes (`Node`, `Element`, `CheckboxInputElement`, etc.)
    * DOM parsing
    * DOM printing
    * DOM queries
  * Most other APIs either throw `UnimplementedError` or fail
    silently when used in non-browser environment.

### Additional APIs in VM/Flutter
You get two additional APIs that `dart:html` does not provide:
  * `HtmlIsolate` - Global state variables of _dart:html_ such as `document`, `navigator`, and `window` delegate implementation to `HtmlIsolate.current`.
    A single heap can have an arbitrary number of "browser processes" by using `HtmlIsolate.zoneLocal`.
  * `HtmlDriver` - APIs such as `window.locale` delegate implementation to `HtmlDriver.current`.
    A single heap can have an arbitrary number of browser configurations by using `HtmlDriver.zoneLocal`.

## Related packages
  * [csslib](https://github.com/dart-lang/csslib) - A package by Dart SDK team that we use for parsing.
  * [html](https://github.com/dart-lang/html) - A package by Dart SDK team that we use for parsing.
  * [universal_flutter](https://github.com/betterbook/universal_flutter) - Cross-platform version of _'package:flutter'_.
  * [universal_io](https://github.com/betterbook/universal_io) - Cross-platform version of _'dart:io'_.
  
# Getting started
Use this in your _pubspec.yaml_:
```yaml
dependencies:
  git:
    url: https://github.com/betterbook/universal_html
```