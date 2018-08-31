part of universal_html;

/*
Some source code in this file was adopted from 'dart:html' in Dart SDK. See:
  https://github.com/dart-lang/sdk/tree/master/tools/dom

The source code adopted from 'dart:html' had the following license:

  Copyright 2012, the Dart project authors. All rights reserved.
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

class DomError implements Exception {
  final String message;
  final String name;

  DomError(this.name, [this.message]);

  String toString() => "${name}: ${message}";
}

class DomException implements Exception {
  static const ABORT = 'AbortError';
  static const DATA_CLONE = 'DataCloneError';
  static const HIERARCHY_REQUEST = 'HierarchyRequestError';
  static const INDEX_SIZE = 'IndexSizeError';
  static const INVALID_ACCESS = 'InvalidAccessError';
  static const INVALID_CHARACTER = 'InvalidCharacterError';
  static const INVALID_MODIFICATION = 'InvalidModificationError';
  static const INVALID_NODE_TYPE = 'InvalidNodeTypeError';
  static const INVALID_STATE = 'InvalidStateError';
  static const NAMESPACE = 'NamespaceError';
  static const NETWORK = 'NetworkError';
  static const NO_MODIFICATION_ALLOWED = 'NoModificationAllowedError';
  static const NOT_FOUND = 'NotFoundError';
  static const NOT_SUPPORTED = 'NotSupportedError';
  static const QUOTA_EXCEEDED = 'QuotaExceededError';
  static const SECURITY = 'SecurityError';
  static const SYNTAX = 'SyntaxError';
  static const TIMEOUT = 'TimeoutError';
  static const TYPE_ERROR = 'TypeError';
  static const TYPE_MISMATCH = 'TypeMismatchError';
  static const URL_MISMATCH = 'URLMismatchError';
  static const WRONG_DOCUMENT = 'WrongDocumentError';

  final String message;
  final String name;

  DomException._(this.name, [this.message]);

  factory DomException._failedToExecute(
      String name, String type, String method, String message) {
    return DomException._(
        name, "Failed to execute '$method' on '$type': $message");
  }

  factory DomException._mayNotBeInsertedInside(
      String type, String method, Node node, Node parent) {
    return DomException._failedToExecute(
        DomException.HIERARCHY_REQUEST,
        type,
        method,
        "Nodes of type '#${node._nodeTypeName}' may not be inserted inside nodes of type '#${parent._nodeTypeName}'.");
  }

  factory DomException._invalidMethod(String type, String method) {
    return DomException._failedToExecute(
      DomException.INVALID_MODIFICATION,
      type,
      method,
      "This node type does not support this method.",
    );
  }

  String toString() => "${name}: ${message}";
}
