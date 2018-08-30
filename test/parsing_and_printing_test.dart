import 'package:test/test.dart';
import 'package:universal_html/html.dart';

void main() {
  group("Parsing nodes: ", () {
    group("Example 1 (HTML):", () {
      test("`DocumentFragment.html", () {
        final contentType = "text/html";
        final Document expected = newExampleDom(contentType);

        // Parse
        final DocumentFragment actual = DocumentFragment.html(exampleSource);

        // document.contentType
        expect(actual.ownerDocument.contentType, contentType);
        expect(expected.ownerDocument.contentType, contentType);

        // Print
        expect(documentToString(actual), equals(documentToString(expected)));
      });

      test("`DomParser, 'text/html'", () {
        final contentType = "text/html";
        final expected = newExampleDom(contentType);

        // Parse
        final actual = DomParser()
            .parseFromString(exampleSource, contentType)
            .firstChild as Element;

        // document.contentType
        expect(actual.ownerDocument.contentType, contentType);
        expect(expected.ownerDocument.contentType, contentType);

        // Print
        expect(documentToString(actual), equals(documentToString(expected)));
      });
    });

    group("Example 1 (XHTML):", () {
      // We test:
      // - attribute, normal
      // - attribute, with namespace
      // - child text
      // - child comment
      // - child element
      // - child element, without ending
      const exampleSource =
          """<example name="value" namespace:name="value2">a<!--b--><div></div><img></example>""";

      Document newExampleDom(String contentType) {
        final document = new DomParser().parseFromString(
            "<html><body></body></html>", "application/xhtml+xml");
        document.firstChild.firstChild.append(document.createElement("example")
          ..setAttribute("xmlns", "http://www.w3.org/1999/xhtml")
          ..setAttribute("name", "value")
          ..setAttributeNS("namespace", "name", "value2")
          ..appendText("a")
          ..append(Comment("b"))
          ..append(new DivElement())
          ..append(new ImageElement()));
        return document;
      }

      test("DomParser, 'application/xhtml+xml", () {
        final contentType = "application/xhtml+xml";
        final Document expected = newExampleDom(contentType);

        // Parse
        final Document actual =
            DomParser().parseFromString(exampleSource, contentType);

        // document.contentType
        expect(actual.contentType, contentType);
        expect(expected..contentType, contentType);

        // Print
        expect(documentToString(actual), equals(documentToString(expected)));
      });
    });
  });

  group("Example 2 (XML):", () {
    test("DomParser, 'text/xml'", () {
      final contentType = "text/xml";
      final Document expected = _xmlExampleDom();

      // Parse
      final Document actual =
          DomParser().parseFromString(_xmlExampleSource, contentType);

      // document.contentType
      expect(actual.contentType, contentType);
      expect(expected.contentType, contentType);

      // Print
      expect(documentToString(actual), equals(documentToString(expected)));
    });

    test("DomParser, contentType", () {
      final input = "<!doctype html>";
      final actual = DomParser().parseFromString(input, "text/html");
      expect(actual.firstChild.nodeType, equals(Node.DOCUMENT_TYPE_NODE));
    });
  });
}

String documentToString(Node document) {
  return (document.firstChild as Element).outerHtml;
}

// HTML test checks the following cases:
// - attribute, with no value
// - attribute, normal
// - attribute, with namespace
// - child text
// - child comment
// - child element
// - child element, without ending
const exampleSource =
    """<example emptyname name="value" namespace:name="value2">a<!--b--><div></div><img></example>""";

Document newExampleDom(String contentType) {
  final document =
      new DomParser().parseFromString("<html></html>", "text/html");
  document.createElement("example")
    ..setAttribute("emptyname", "")
    ..setAttribute("name", "value")
    ..setAttributeNS("namespace", "name", "value2")
    ..appendText("a")
    ..append(Comment("b"))
    ..append(new DivElement())
    ..append(new ImageElement());
  return document;
}

// XML test checks the following cases:
// - attribute, normal
// - attribute, with namespace
// - child text
// - child comment
// - child element
// - child element, without ending
const _xmlExampleSource =
    """<example name="value" namespace:name="value2">a<!--b--><div></div><img></example>""";

Document _xmlExampleDom() {
  final document = new DomParser().parseFromString("<xml></xml>", "text/xml");
  document.firstChild.append(
    document.createElement("example")
      ..setAttribute("name", "value")
      ..setAttributeNS("namespace", "name", "value2")
      ..appendText("a")
      ..append(Comment("b"))
      ..append(new DivElement())
      ..append(new ImageElement()),
  );
  return document;
}
