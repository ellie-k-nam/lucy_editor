// GENERATED CODE - DO NOT MODIFY BY HAND

import '../../src/re_highlight.dart';

final langFsharp = Mode(
    refs: {
      '~contains~1~variants~0~contains~2':
          Mode(scope: 'subst', begin: "\\{", end: "\\}", keywords: {
        "keyword": [
          "abstract",
          "and",
          "as",
          "assert",
          "base",
          "begin",
          "class",
          "default",
          "delegate",
          "do",
          "done",
          "downcast",
          "downto",
          "elif",
          "else",
          "end",
          "exception",
          "extern",
          "finally",
          "fixed",
          "for",
          "fun",
          "function",
          "global",
          "if",
          "in",
          "inherit",
          "inline",
          "interface",
          "internal",
          "lazy",
          "let",
          "match",
          "member",
          "module",
          "mutable",
          "namespace",
          "new",
          "of",
          "open",
          "or",
          "override",
          "private",
          "public",
          "rec",
          "return",
          "static",
          "struct",
          "then",
          "to",
          "try",
          "type",
          "upcast",
          "use",
          "val",
          "void",
          "when",
          "while",
          "with",
          "yield"
        ],
        "literal": [
          "true",
          "false",
          "null",
          "Some",
          "None",
          "Ok",
          "Error",
          "infinity",
          "infinityf",
          "nan",
          "nanf"
        ],
        "built_in": [
          "not",
          "ref",
          "raise",
          "reraise",
          "dict",
          "readOnlyDict",
          "set",
          "get",
          "enum",
          "sizeof",
          "typeof",
          "typedefof",
          "nameof",
          "nullArg",
          "invalidArg",
          "invalidOp",
          "id",
          "fst",
          "snd",
          "ignore",
          "lock",
          "using",
          "box",
          "unbox",
          "tryUnbox",
          "printf",
          "printfn",
          "sprintf",
          "eprintf",
          "eprintfn",
          "fprintf",
          "fprintfn",
          "failwith",
          "failwithf"
        ],
        "variable.constant": [
          "__LINE__",
          "__SOURCE_DIRECTORY__",
          "__SOURCE_FILE__"
        ]
      }, contains: <Mode>[
        Mode(
            scope: 'string',
            begin: "(\\\$@|@\\\$)\"",
            end: "\"",
            contains: <Mode>[
              Mode(match: "\\{\\{"),
              Mode(match: "\\}\\}"),
              Mode(match: "\"\""),
              BACKSLASH_ESCAPE,
              Mode(ref: '~contains~1~variants~0~contains~2')
            ]),
        Mode(scope: 'string', begin: "\\\$\"", end: "\"", contains: <Mode>[
          Mode(match: "\\{\\{"),
          Mode(match: "\\}\\}"),
          BACKSLASH_ESCAPE,
          Mode(ref: '~contains~1~variants~0~contains~2')
        ]),
        Mode(
            scope: 'string',
            begin: "@\"",
            end: "\"",
            contains: <Mode>[Mode(match: "\"\""), BACKSLASH_ESCAPE]),
        Mode(
            scope: 'string',
            begin: "\"",
            end: "\"",
            contains: <Mode>[BACKSLASH_ESCAPE]),
        Mode(
            scope: 'string',
            match:
                "'(?:[^\\\\']|\\\\(?:.|\\d{3}|x[a-fA-F\\d]{2}|u[a-fA-F\\d]{4}|U[a-fA-F\\d]{8}))'"),
        Mode(ref: '~contains~0'),
        Mode(variants: <Mode>[
          Mode(
              scope: 'comment',
              begin: "\\(\\*(?!\\))",
              end: "\\*\\)",
              contains: <Mode>[
                Mode(self: true),
                Mode(
                    scope: 'doctag',
                    begin: "[ ]*(?=(TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):)",
                    end: "(TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):",
                    excludeBegin: true,
                    relevance: 0),
                Mode(
                    begin:
                        "[ ]+((?:I|a|is|so|us|to|at|if|in|it|on|[A-Za-z]+['](d|ve|re|ll|t|s|n)|[A-Za-z]+[-][a-z]+|[A-Za-z][a-z]{2,})[.]?[:]?([.][ ]|[ ])){3}")
              ]),
          C_LINE_COMMENT_MODE
        ]),
        Mode(scope: 'variable', begin: "``", end: "``"),
        Mode(
            begin: ":(?=\\s*(?:\\w|'|\\^|#|``|\\(|{\\|))",
            beginScope: 'operator',
            end: "(?=(?:\\n|=))",
            relevance: 0,
            keywords: {
              "keyword": [
                "abstract",
                "and",
                "as",
                "assert",
                "base",
                "begin",
                "class",
                "default",
                "delegate",
                "do",
                "done",
                "downcast",
                "downto",
                "elif",
                "else",
                "end",
                "exception",
                "extern",
                "finally",
                "fixed",
                "for",
                "fun",
                "function",
                "global",
                "if",
                "in",
                "inherit",
                "inline",
                "interface",
                "internal",
                "lazy",
                "let",
                "match",
                "member",
                "module",
                "mutable",
                "namespace",
                "new",
                "of",
                "open",
                "or",
                "override",
                "private",
                "public",
                "rec",
                "return",
                "static",
                "struct",
                "then",
                "to",
                "try",
                "type",
                "upcast",
                "use",
                "val",
                "void",
                "when",
                "while",
                "with",
                "yield"
              ],
              "literal": [
                "true",
                "false",
                "null",
                "Some",
                "None",
                "Ok",
                "Error",
                "infinity",
                "infinityf",
                "nan",
                "nanf"
              ],
              "built_in": [
                "not",
                "ref",
                "raise",
                "reraise",
                "dict",
                "readOnlyDict",
                "set",
                "get",
                "enum",
                "sizeof",
                "typeof",
                "typedefof",
                "nameof",
                "nullArg",
                "invalidArg",
                "invalidOp",
                "id",
                "fst",
                "snd",
                "ignore",
                "lock",
                "using",
                "box",
                "unbox",
                "tryUnbox",
                "printf",
                "printfn",
                "sprintf",
                "eprintf",
                "eprintfn",
                "fprintf",
                "fprintfn",
                "failwith",
                "failwithf"
              ],
              "variable.constant": [
                "__LINE__",
                "__SOURCE_DIRECTORY__",
                "__SOURCE_FILE__"
              ],
              "type": [
                "bool",
                "byte",
                "sbyte",
                "int8",
                "int16",
                "int32",
                "uint8",
                "uint16",
                "uint32",
                "int",
                "uint",
                "int64",
                "uint64",
                "nativeint",
                "unativeint",
                "decimal",
                "float",
                "double",
                "float32",
                "single",
                "char",
                "string",
                "unit",
                "bigint",
                "option",
                "voption",
                "list",
                "array",
                "seq",
                "byref",
                "exn",
                "inref",
                "nativeptr",
                "obj",
                "outref",
                "voidptr",
                "Result"
              ]
            },
            contains: <Mode>[
              Mode(ref: '~contains~1~variants~0~contains~2~contains~6'),
              Mode(
                  scope: 'symbol',
                  variants: <Mode>[
                    Mode(match: "\\B('|\\^)``.*?``"),
                    Mode(match: "\\B('|\\^)[a-zA-Z_]\\w*")
                  ],
                  relevance: 0),
              Mode(scope: null, begin: "``", end: "``"),
              Mode(
                  scope: 'operator',
                  match:
                      "(?:(?:(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.)(?=(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.))(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.)*|[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]+)|:\\?>|:\\?|:>|:=|::?|\\\$)",
                  relevance: 0)
            ]),
        Mode(
            scope: 'computation-expression', match: "\\b[_a-z]\\w*(?=\\s*\\{)"),
        Mode(begin: [
          "^\\s*",
          "#(?:if|else|endif|line|nowarn|light|r|i|I|load|time|help|quit)",
          "\\b"
        ], beginScope: <int, String>{
          2: 'meta',
        }, end: "(?=\\s|\$)"),
        Mode(variants: <Mode>[BINARY_NUMBER_MODE, C_NUMBER_MODE]),
        Mode(ref: '~contains~1~variants~0~contains~2~contains~8~contains~1'),
        Mode(
            scope: 'operator',
            match:
                "(?:(?:(?:[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]|\\.)(?=(?:[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]|\\.))(?:[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]|\\.)*|[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]+)|:\\?>|:\\?|:>|:=|::?|\\\$)",
            relevance: 0)
      ]),
      '~contains~0':
          Mode(scope: 'keyword', match: "\\b(yield|return|let|do|match|use)!"),
      '~contains~1~variants~0~contains~2~contains~6': Mode(variants: <Mode>[
        Mode(
            scope: 'comment',
            begin: "\\(\\*(?!\\))",
            end: "\\*\\)",
            contains: <Mode>[
              Mode(self: true),
              Mode(
                  scope: 'doctag',
                  begin: "[ ]*(?=(TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):)",
                  end: "(TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):",
                  excludeBegin: true,
                  relevance: 0),
              Mode(
                  begin:
                      "[ ]+((?:I|a|is|so|us|to|at|if|in|it|on|[A-Za-z]+['](d|ve|re|ll|t|s|n)|[A-Za-z]+[-][a-z]+|[A-Za-z][a-z]{2,})[.]?[:]?([.][ ]|[ ])){3}")
            ]),
        C_LINE_COMMENT_MODE
      ]),
      '~contains~1~variants~0~contains~2~contains~8~contains~1': Mode(
          scope: 'symbol',
          variants: <Mode>[
            Mode(match: "\\B('|\\^)``.*?``"),
            Mode(match: "\\B('|\\^)[a-zA-Z_]\\w*")
          ],
          relevance: 0),
      '~contains~1~variants~0~contains~2~contains~0': Mode(
          scope: 'string',
          begin: "(\\\$@|@\\\$)\"",
          end: "\"",
          contains: <Mode>[
            Mode(match: "\\{\\{"),
            Mode(match: "\\}\\}"),
            Mode(match: "\"\""),
            BACKSLASH_ESCAPE,
            Mode(ref: '~contains~1~variants~0~contains~2')
          ]),
      '~contains~1~variants~0~contains~2~contains~1':
          Mode(scope: 'string', begin: "\\\$\"", end: "\"", contains: <Mode>[
        Mode(match: "\\{\\{"),
        Mode(match: "\\}\\}"),
        BACKSLASH_ESCAPE,
        Mode(ref: '~contains~1~variants~0~contains~2')
      ]),
      '~contains~1~variants~0~contains~2~contains~2': Mode(
          scope: 'string',
          begin: "@\"",
          end: "\"",
          contains: <Mode>[Mode(match: "\"\""), BACKSLASH_ESCAPE]),
      '~contains~1~variants~0~contains~2~contains~3': Mode(
          scope: 'string',
          begin: "\"",
          end: "\"",
          contains: <Mode>[BACKSLASH_ESCAPE]),
      '~contains~1~variants~0~contains~2~contains~4': Mode(
          scope: 'string',
          match:
              "'(?:[^\\\\']|\\\\(?:.|\\d{3}|x[a-fA-F\\d]{2}|u[a-fA-F\\d]{4}|U[a-fA-F\\d]{8}))'"),
      '~contains~1~variants~0~contains~2~contains~7':
          Mode(scope: 'variable', begin: "``", end: "``"),
      '~contains~1~variants~0~contains~2~contains~8': Mode(
          begin: ":(?=\\s*(?:\\w|'|\\^|#|``|\\(|{\\|))",
          beginScope: 'operator',
          end: "(?=(?:\\n|=))",
          relevance: 0,
          keywords: {
            "keyword": [
              "abstract",
              "and",
              "as",
              "assert",
              "base",
              "begin",
              "class",
              "default",
              "delegate",
              "do",
              "done",
              "downcast",
              "downto",
              "elif",
              "else",
              "end",
              "exception",
              "extern",
              "finally",
              "fixed",
              "for",
              "fun",
              "function",
              "global",
              "if",
              "in",
              "inherit",
              "inline",
              "interface",
              "internal",
              "lazy",
              "let",
              "match",
              "member",
              "module",
              "mutable",
              "namespace",
              "new",
              "of",
              "open",
              "or",
              "override",
              "private",
              "public",
              "rec",
              "return",
              "static",
              "struct",
              "then",
              "to",
              "try",
              "type",
              "upcast",
              "use",
              "val",
              "void",
              "when",
              "while",
              "with",
              "yield"
            ],
            "literal": [
              "true",
              "false",
              "null",
              "Some",
              "None",
              "Ok",
              "Error",
              "infinity",
              "infinityf",
              "nan",
              "nanf"
            ],
            "built_in": [
              "not",
              "ref",
              "raise",
              "reraise",
              "dict",
              "readOnlyDict",
              "set",
              "get",
              "enum",
              "sizeof",
              "typeof",
              "typedefof",
              "nameof",
              "nullArg",
              "invalidArg",
              "invalidOp",
              "id",
              "fst",
              "snd",
              "ignore",
              "lock",
              "using",
              "box",
              "unbox",
              "tryUnbox",
              "printf",
              "printfn",
              "sprintf",
              "eprintf",
              "eprintfn",
              "fprintf",
              "fprintfn",
              "failwith",
              "failwithf"
            ],
            "variable.constant": [
              "__LINE__",
              "__SOURCE_DIRECTORY__",
              "__SOURCE_FILE__"
            ],
            "type": [
              "bool",
              "byte",
              "sbyte",
              "int8",
              "int16",
              "int32",
              "uint8",
              "uint16",
              "uint32",
              "int",
              "uint",
              "int64",
              "uint64",
              "nativeint",
              "unativeint",
              "decimal",
              "float",
              "double",
              "float32",
              "single",
              "char",
              "string",
              "unit",
              "bigint",
              "option",
              "voption",
              "list",
              "array",
              "seq",
              "byref",
              "exn",
              "inref",
              "nativeptr",
              "obj",
              "outref",
              "voidptr",
              "Result"
            ]
          },
          contains: <Mode>[
            Mode(ref: '~contains~1~variants~0~contains~2~contains~6'),
            Mode(
                scope: 'symbol',
                variants: <Mode>[
                  Mode(match: "\\B('|\\^)``.*?``"),
                  Mode(match: "\\B('|\\^)[a-zA-Z_]\\w*")
                ],
                relevance: 0),
            Mode(scope: null, begin: "``", end: "``"),
            Mode(
                scope: 'operator',
                match:
                    "(?:(?:(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.)(?=(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.))(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.)*|[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]+)|:\\?>|:\\?|:>|:=|::?|\\\$)",
                relevance: 0)
          ]),
      '~contains~1~variants~3':
          Mode(scope: 'string', begin: "\"\"\"", end: "\"\"\"", relevance: 2),
      '~contains~1~variants~0~contains~2~contains~11':
          Mode(variants: <Mode>[BINARY_NUMBER_MODE, C_NUMBER_MODE]),
      '~contains~1~variants~0~contains~2~contains~8~contains~3': Mode(
          scope: 'operator',
          match:
              "(?:(?:(?:[!%&\\*\\+\\-\\/<>@\\^\\|\x7e\\?]|\\.)(?=(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.))(?:[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]|\\.)*|[!%&\\*\\+\\-\\/<>@\\^\\|~\\?]+)|:\\?>|:\\?|:>|:=|::?|\\\$)",
          relevance: 0),
      '~contains~1~variants~0~contains~2~contains~9': Mode(
          scope: 'computation-expression', match: "\\b[_a-z]\\w*(?=\\s*\\{)"),
      '~contains~1~variants~0~contains~2~contains~10': Mode(begin: [
        "^\\s*",
        "#(?:if|else|endif|line|nowarn|light|r|i|I|load|time|help|quit)",
        "\\b"
      ], beginScope: <int, String>{
        2: 'meta',
      }, end: "(?=\\s|\$)"),
      '~contains~1~variants~0~contains~2~contains~13': Mode(
          scope: 'operator',
          match:
              "(?:(?:(?:[!%&\\*\\+\\-\\/<=>@\\^\\|\x7e\\?]|\\.)(?=(?:[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]|\\.))(?:[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]|\\.)*|[!%&\\*\\+\\-\\/<=>@\\^\\|~\\?]+)|:\\?>|:\\?|:>|:=|::?|\\\$)",
          relevance: 0)
    },
    name: "F#",
    aliases: ["fs", "f#"],
    keywords: {
      "keyword": [
        "abstract",
        "and",
        "as",
        "assert",
        "base",
        "begin",
        "class",
        "default",
        "delegate",
        "do",
        "done",
        "downcast",
        "downto",
        "elif",
        "else",
        "end",
        "exception",
        "extern",
        "finally",
        "fixed",
        "for",
        "fun",
        "function",
        "global",
        "if",
        "in",
        "inherit",
        "inline",
        "interface",
        "internal",
        "lazy",
        "let",
        "match",
        "member",
        "module",
        "mutable",
        "namespace",
        "new",
        "of",
        "open",
        "or",
        "override",
        "private",
        "public",
        "rec",
        "return",
        "static",
        "struct",
        "then",
        "to",
        "try",
        "type",
        "upcast",
        "use",
        "val",
        "void",
        "when",
        "while",
        "with",
        "yield"
      ],
      "literal": [
        "true",
        "false",
        "null",
        "Some",
        "None",
        "Ok",
        "Error",
        "infinity",
        "infinityf",
        "nan",
        "nanf"
      ],
      "built_in": [
        "not",
        "ref",
        "raise",
        "reraise",
        "dict",
        "readOnlyDict",
        "set",
        "get",
        "enum",
        "sizeof",
        "typeof",
        "typedefof",
        "nameof",
        "nullArg",
        "invalidArg",
        "invalidOp",
        "id",
        "fst",
        "snd",
        "ignore",
        "lock",
        "using",
        "box",
        "unbox",
        "tryUnbox",
        "printf",
        "printfn",
        "sprintf",
        "eprintf",
        "eprintfn",
        "fprintf",
        "fprintfn",
        "failwith",
        "failwithf"
      ],
      "variable.constant": [
        "__LINE__",
        "__SOURCE_DIRECTORY__",
        "__SOURCE_FILE__"
      ]
    },
    illegal: "\\/\\*",
    classNameAliases: {"computation-expression": "keyword"},
    contains: <Mode>[
      Mode(ref: '~contains~0'),
      Mode(variants: <Mode>[
        Mode(
            scope: 'string',
            begin: "\\\$\"\"\"",
            end: "\"\"\"",
            contains: <Mode>[
              Mode(match: "\\{\\{"),
              Mode(match: "\\}\\}"),
              Mode(ref: '~contains~1~variants~0~contains~2')
            ],
            relevance: 2),
        Mode(ref: '~contains~1~variants~0~contains~2~contains~0'),
        Mode(ref: '~contains~1~variants~0~contains~2~contains~1'),
        Mode(ref: '~contains~1~variants~3'),
        Mode(ref: '~contains~1~variants~0~contains~2~contains~2'),
        Mode(ref: '~contains~1~variants~0~contains~2~contains~3'),
        Mode(ref: '~contains~1~variants~0~contains~2~contains~4')
      ]),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~6'),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~7'),
      Mode(
          begin: ["(^|\\s+)", "type", "\\s+", "[a-zA-Z_](\\w|')*"],
          beginScope: <int, String>{
            2: 'keyword',
            4: 'title.class',
          },
          end: "(?=\\(|=|\$)",
          keywords: {
            "keyword": [
              "abstract",
              "and",
              "as",
              "assert",
              "base",
              "begin",
              "class",
              "default",
              "delegate",
              "do",
              "done",
              "downcast",
              "downto",
              "elif",
              "else",
              "end",
              "exception",
              "extern",
              "finally",
              "fixed",
              "for",
              "fun",
              "function",
              "global",
              "if",
              "in",
              "inherit",
              "inline",
              "interface",
              "internal",
              "lazy",
              "let",
              "match",
              "member",
              "module",
              "mutable",
              "namespace",
              "new",
              "of",
              "open",
              "or",
              "override",
              "private",
              "public",
              "rec",
              "return",
              "static",
              "struct",
              "then",
              "to",
              "try",
              "type",
              "upcast",
              "use",
              "val",
              "void",
              "when",
              "while",
              "with",
              "yield"
            ],
            "literal": [
              "true",
              "false",
              "null",
              "Some",
              "None",
              "Ok",
              "Error",
              "infinity",
              "infinityf",
              "nan",
              "nanf"
            ],
            "built_in": [
              "not",
              "ref",
              "raise",
              "reraise",
              "dict",
              "readOnlyDict",
              "set",
              "get",
              "enum",
              "sizeof",
              "typeof",
              "typedefof",
              "nameof",
              "nullArg",
              "invalidArg",
              "invalidOp",
              "id",
              "fst",
              "snd",
              "ignore",
              "lock",
              "using",
              "box",
              "unbox",
              "tryUnbox",
              "printf",
              "printfn",
              "sprintf",
              "eprintf",
              "eprintfn",
              "fprintf",
              "fprintfn",
              "failwith",
              "failwithf"
            ],
            "variable.constant": [
              "__LINE__",
              "__SOURCE_DIRECTORY__",
              "__SOURCE_FILE__"
            ]
          },
          contains: <Mode>[
            Mode(ref: '~contains~1~variants~0~contains~2~contains~6'),
            Mode(scope: null, begin: "``", end: "``"),
            Mode(
                ref: '~contains~1~variants~0~contains~2~contains~8~contains~1'),
            Mode(scope: 'operator', match: "<|>"),
            Mode(ref: '~contains~1~variants~0~contains~2~contains~8')
          ]),
      Mode(
          scope: 'meta',
          begin: "\\[<",
          end: ">\\]",
          relevance: 2,
          contains: <Mode>[
            Mode(ref: '~contains~1~variants~0~contains~2~contains~7'),
            Mode(ref: '~contains~1~variants~3'),
            Mode(ref: '~contains~1~variants~0~contains~2~contains~2'),
            Mode(ref: '~contains~1~variants~0~contains~2~contains~3'),
            Mode(ref: '~contains~1~variants~0~contains~2~contains~4'),
            Mode(ref: '~contains~1~variants~0~contains~2~contains~11')
          ]),
      Mode(
          begin: "\\bof\\b(?=\\s*(?:\\w|'|\\^|#|``|\\(|{\\|))",
          beginScope: 'keyword',
          end: "(?=(?:\\n|=))",
          relevance: 0,
          keywords: {
            "keyword": [
              "abstract",
              "and",
              "as",
              "assert",
              "base",
              "begin",
              "class",
              "default",
              "delegate",
              "do",
              "done",
              "downcast",
              "downto",
              "elif",
              "else",
              "end",
              "exception",
              "extern",
              "finally",
              "fixed",
              "for",
              "fun",
              "function",
              "global",
              "if",
              "in",
              "inherit",
              "inline",
              "interface",
              "internal",
              "lazy",
              "let",
              "match",
              "member",
              "module",
              "mutable",
              "namespace",
              "new",
              "of",
              "open",
              "or",
              "override",
              "private",
              "public",
              "rec",
              "return",
              "static",
              "struct",
              "then",
              "to",
              "try",
              "type",
              "upcast",
              "use",
              "val",
              "void",
              "when",
              "while",
              "with",
              "yield"
            ],
            "literal": [
              "true",
              "false",
              "null",
              "Some",
              "None",
              "Ok",
              "Error",
              "infinity",
              "infinityf",
              "nan",
              "nanf"
            ],
            "built_in": [
              "not",
              "ref",
              "raise",
              "reraise",
              "dict",
              "readOnlyDict",
              "set",
              "get",
              "enum",
              "sizeof",
              "typeof",
              "typedefof",
              "nameof",
              "nullArg",
              "invalidArg",
              "invalidOp",
              "id",
              "fst",
              "snd",
              "ignore",
              "lock",
              "using",
              "box",
              "unbox",
              "tryUnbox",
              "printf",
              "printfn",
              "sprintf",
              "eprintf",
              "eprintfn",
              "fprintf",
              "fprintfn",
              "failwith",
              "failwithf"
            ],
            "variable.constant": [
              "__LINE__",
              "__SOURCE_DIRECTORY__",
              "__SOURCE_FILE__"
            ],
            "type": [
              "bool",
              "byte",
              "sbyte",
              "int8",
              "int16",
              "int32",
              "uint8",
              "uint16",
              "uint32",
              "int",
              "uint",
              "int64",
              "uint64",
              "nativeint",
              "unativeint",
              "decimal",
              "float",
              "double",
              "float32",
              "single",
              "char",
              "string",
              "unit",
              "bigint",
              "option",
              "voption",
              "list",
              "array",
              "seq",
              "byref",
              "exn",
              "inref",
              "nativeptr",
              "obj",
              "outref",
              "voidptr",
              "Result"
            ]
          },
          contains: <Mode>[
            Mode(ref: '~contains~1~variants~0~contains~2~contains~6'),
            Mode(
                ref: '~contains~1~variants~0~contains~2~contains~8~contains~1'),
            Mode(scope: null, begin: "``", end: "``"),
            Mode(ref: '~contains~1~variants~0~contains~2~contains~8~contains~3')
          ]),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~8'),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~9'),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~10'),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~11'),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~8~contains~1'),
      Mode(ref: '~contains~1~variants~0~contains~2~contains~13')
    ]);