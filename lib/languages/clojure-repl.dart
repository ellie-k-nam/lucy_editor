// GENERATED CODE - DO NOT MODIFY BY HAND

import '../../src/re_highlight.dart';

final langClojureRepl = Mode(
    refs: {},
    name: "Clojure REPL",
    contains: <Mode>[
      Mode(
          className: 'meta.prompt',
          begin: "^([\\w.-]+|\\s*#_)?=>",
          starts: Mode(end: "\$", subLanguage: "clojure"))
    ]);
