// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: use_raw_strings

import 'package:re_highlight/re_highlight.dart';

final javascript = Mode(
  refs: {
    '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~8': Mode(
      begin: "\\{",
      end: "\\}",
      keywords: {
        "\$pattern": "[A-Za-z\$_][0-9A-Za-z\$_]*",
        "keyword": [
          "as",
          "in",
          "of",
          "if",
          "for",
          "while",
          "finally",
          "var",
          "new",
          "function",
          "do",
          "return",
          "void",
          "else",
          "break",
          "catch",
          "instanceof",
          "with",
          "throw",
          "case",
          "default",
          "try",
          "switch",
          "continue",
          "typeof",
          "delete",
          "let",
          "yield",
          "const",
          "class",
          "debugger",
          "async",
          "await",
          "static",
          "import",
          "from",
          "export",
          "extends"
        ],
        "literal": ["true", "false", "null", "undefined", "NaN", "Infinity"],
        "built_in": [
          "setInterval",
          "setTimeout",
          "clearInterval",
          "clearTimeout",
          "require",
          "exports",
          "eval",
          "isFinite",
          "isNaN",
          "parseFloat",
          "parseInt",
          "decodeURI",
          "decodeURIComponent",
          "encodeURI",
          "encodeURIComponent",
          "escape",
          "unescape",
          "Object",
          "Function",
          "Boolean",
          "Symbol",
          "Math",
          "Date",
          "Number",
          "BigInt",
          "String",
          "RegExp",
          "Array",
          "Float32Array",
          "Float64Array",
          "Int8Array",
          "Uint8Array",
          "Uint8ClampedArray",
          "Int16Array",
          "Int32Array",
          "Uint16Array",
          "Uint32Array",
          "BigInt64Array",
          "BigUint64Array",
          "Set",
          "Map",
          "WeakSet",
          "WeakMap",
          "ArrayBuffer",
          "SharedArrayBuffer",
          "Atomics",
          "DataView",
          "JSON",
          "Promise",
          "Generator",
          "GeneratorFunction",
          "AsyncFunction",
          "Reflect",
          "Proxy",
          "Intl",
          "WebAssembly",
          "Error",
          "EvalError",
          "InternalError",
          "RangeError",
          "ReferenceError",
          "SyntaxError",
          "TypeError",
          "URIError"
        ],
        "variable.language": [
          "arguments",
          "this",
          "super",
          "console",
          "window",
          "document",
          "localStorage",
          "sessionStorage",
          "module",
          "global"
        ]
      },
      contains: <Mode>[
        APOS_STRING_MODE,
        QUOTE_STRING_MODE,
        Mode(ref: '~exports~PARAMS_CONTAINS~3'),
        Mode(ref:
        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3'),
        Mode(ref:
        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4'),
        Mode(ref:
        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5'),
        Mode(ref:
        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~6'),
        Mode(ref:
        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7'),
      ],
    ),
    '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7': Mode(
      className: "number",
      variants: [
        Mode(
          begin:
          "(\\b(0|[1-9](_?[0-9])*|0[0-7]*[89][0-9]*)((\\.([0-9](_?[0-9])*))|\\.)?|(\\.([0-9](_?[0-9])*)))[eE][+-]?([0-9](_?[0-9])*)\\b",
        ),
        Mode(
          begin:
          "\\b(0|[1-9](_?[0-9])*|0[0-7]*[89][0-9]*)\\b((\\.([0-9](_?[0-9])*))\\b|\\.)?|(\\.([0-9](_?[0-9])*))\\b",
        ),
        Mode(
          begin: "\\b(0|[1-9](_?[0-9])*)n\\b",
        ),
        Mode(
          begin: "\\b0[xX][0-9a-fA-F](_?[0-9a-fA-F])*n?\\b",
        ),
        Mode(
          begin: "\\b0[bB][0-1](_?[0-1])*n?\\b",
        ),
        Mode(
          begin: "\\b0[oO][0-7](_?[0-7])*n?\\b",
        ),
        Mode(
          begin: "\\b0[0-7]+n?\\b",
        ),
      ],
      relevance: 0,
    ),
    '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~6': Mode(
      match: "\\\$\\d+",
    ),
    '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5': Mode(
      className: "string",
      begin: "`",
      end: "`",
      contains: [
        BACKSLASH_ESCAPE,
        Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1'),
      ],
    ),
    '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4': Mode(
      begin: "gql`",
      end: "",
      starts: Mode(
        end: "`",
        returnEnd: false,
        contains: [
          BACKSLASH_ESCAPE,
          Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1'),
        ],
        subLanguage: ["graphql"],
      ),
    ),
    '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3': Mode(
      begin: "css`",
      end: "",
      starts: Mode(
        end: "`",
        returnEnd: false,
        contains: [
          BACKSLASH_ESCAPE,
          Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1'),
        ],
        subLanguage: ["css"],
      ),
    ),
    '~exports~PARAMS_CONTAINS~3~starts~contains~1': Mode(
      className: "subst",
      begin: "\\\$\\{",
      end: "\\}",
      keywords: {
        "\$pattern": "[A-Za-z\$_][0-9A-Za-z\$_]*",
        "keyword": [
          "as",
          "in",
          "of",
          "if",
          "for",
          "while",
          "finally",
          "var",
          "new",
          "function",
          "do",
          "return",
          "void",
          "else",
          "break",
          "catch",
          "instanceof",
          "with",
          "throw",
          "case",
          "default",
          "try",
          "switch",
          "continue",
          "typeof",
          "delete",
          "let",
          "yield",
          "const",
          "class",
          "debugger",
          "async",
          "await",
          "static",
          "import",
          "from",
          "export",
          "extends"
        ],
        "literal": ["true", "false", "null", "undefined", "NaN", "Infinity"],
        "built_in": [
          "setInterval",
          "setTimeout",
          "clearInterval",
          "clearTimeout",
          "require",
          "exports",
          "eval",
          "isFinite",
          "isNaN",
          "parseFloat",
          "parseInt",
          "decodeURI",
          "decodeURIComponent",
          "encodeURI",
          "encodeURIComponent",
          "escape",
          "unescape",
          "Object",
          "Function",
          "Boolean",
          "Symbol",
          "Math",
          "Date",
          "Number",
          "BigInt",
          "String",
          "RegExp",
          "Array",
          "Float32Array",
          "Float64Array",
          "Int8Array",
          "Uint8Array",
          "Uint8ClampedArray",
          "Int16Array",
          "Int32Array",
          "Uint16Array",
          "Uint32Array",
          "BigInt64Array",
          "BigUint64Array",
          "Set",
          "Map",
          "WeakSet",
          "WeakMap",
          "ArrayBuffer",
          "SharedArrayBuffer",
          "Atomics",
          "DataView",
          "JSON",
          "Promise",
          "Generator",
          "GeneratorFunction",
          "AsyncFunction",
          "Reflect",
          "Proxy",
          "Intl",
          "WebAssembly",
          "Error",
          "EvalError",
          "InternalError",
          "RangeError",
          "ReferenceError",
          "SyntaxError",
          "TypeError",
          "URIError"
        ],
        "variable.language": [
          "arguments",
          "this",
          "super",
          "console",
          "window",
          "document",
          "localStorage",
          "sessionStorage",
          "module",
          "global"
        ]
      },
      contains: [
        APOS_STRING_MODE,
        QUOTE_STRING_MODE,
        Mode(ref:'~exports~PARAMS_CONTAINS~3'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~6'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~8'),
      ],
    ),
    '~exports~PARAMS_CONTAINS~3': Mode(
      begin: "html`",
      end: "",
      starts: Mode(
        end: "`",
        returnEnd: false,
        contains: [
          BACKSLASH_ESCAPE,
          Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1'),
        ],
        subLanguage: ["xml"],
      ),
    ),
    '~exports~PARAMS_CONTAINS~10': Mode(
      begin: "\\(",
      end: "\\)",
      keywords: {
        "\$pattern": "[A-Za-z\$_][0-9A-Za-z\$_]*",
        "keyword": [
          "as",
          "in",
          "of",
          "if",
          "for",
          "while",
          "finally",
          "var",
          "new",
          "function",
          "do",
          "return",
          "void",
          "else",
          "break",
          "catch",
          "instanceof",
          "with",
          "throw",
          "case",
          "default",
          "try",
          "switch",
          "continue",
          "typeof",
          "delete",
          "let",
          "yield",
          "const",
          "class",
          "debugger",
          "async",
          "await",
          "static",
          "import",
          "from",
          "export",
          "extends"
        ],
        "literal": ["true", "false", "null", "undefined", "NaN", "Infinity"],
        "built_in": [
          "setInterval",
          "setTimeout",
          "clearInterval",
          "clearTimeout",
          "require",
          "exports",
          "eval",
          "isFinite",
          "isNaN",
          "parseFloat",
          "parseInt",
          "decodeURI",
          "decodeURIComponent",
          "encodeURI",
          "encodeURIComponent",
          "escape",
          "unescape",
          "Object",
          "Function",
          "Boolean",
          "Symbol",
          "Math",
          "Date",
          "Number",
          "BigInt",
          "String",
          "RegExp",
          "Array",
          "Float32Array",
          "Float64Array",
          "Int8Array",
          "Uint8Array",
          "Uint8ClampedArray",
          "Int16Array",
          "Int32Array",
          "Uint16Array",
          "Uint32Array",
          "BigInt64Array",
          "BigUint64Array",
          "Set",
          "Map",
          "WeakSet",
          "WeakMap",
          "ArrayBuffer",
          "SharedArrayBuffer",
          "Atomics",
          "DataView",
          "JSON",
          "Promise",
          "Generator",
          "GeneratorFunction",
          "AsyncFunction",
          "Reflect",
          "Proxy",
          "Intl",
          "WebAssembly",
          "Error",
          "EvalError",
          "InternalError",
          "RangeError",
          "ReferenceError",
          "SyntaxError",
          "TypeError",
          "URIError"
        ],
        "variable.language": [
          "arguments",
          "this",
          "super",
          "console",
          "window",
          "document",
          "localStorage",
          "sessionStorage",
          "module",
          "global"
        ]
      },
      contains: <Mode>[
        Mode(ref:'~exports~PARAMS_CONTAINS~0'),
        APOS_STRING_MODE,
        QUOTE_STRING_MODE,
        Mode(ref:'~exports~PARAMS_CONTAINS~3'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~6'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~8'),
      ],
    ),
    '~exports~PARAMS_CONTAINS~0': Mode(
      className: "comment",
      variants: [
        Mode(
          scope: "comment",
          begin: "\\/\\*\\*(?!\\/)",
          end: "\\*/",
          contains: [
            Mode(
              begin: "(?=@[A-Za-z]+)",
              relevance: 0,
              contains: [
                Mode(
                  className: "doctag",
                  begin: "@[A-Za-z]+",
                ),
                Mode(
                  className: "type",
                  begin: "\\{",
                  end: "\\}",
                  excludeEnd: true,
                  excludeBegin: true,
                  relevance: 0,
                ),
                Mode(
                  className: "variable",
                  begin: "[A-Za-z\$_][0-9A-Za-z\$_]*(?=\\s*(-)|\$)",
                  endsParent: true,
                  relevance: 0,
                ),
                Mode(
                  begin: "(?=[^\\n])\\s",
                  relevance: 0,
                ),
              ],
            ),
            Mode(
              scope: "doctag",
              begin: "[ ]*(?=(TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):)",
              end: "(TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):",
              excludeBegin: true,
              relevance: 0,
            ),
            Mode(
              begin:
              "[ ]+((?:I|a|is|so|us|to|at|if|in|it|on|[A-Za-z]+['](d|ve|re|ll|t|s|n)|[A-Za-z]+[-][a-z]+|[A-Za-z][a-z]{2,})[.]?[:]?([.][ ]|[ ])){3}",
            ),
          ],
          relevance: 0,
        ),
        C_BLOCK_COMMENT_MODE,
        C_LINE_COMMENT_MODE,
      ],
    ),
    '~exports~CLASS_REFERENCE': Mode(
      relevance: 0,
      match:
      "(?:\\bJSON|\\b[A-Z][a-z]+([A-Z][a-z]*|\\d)*|\\b[A-Z]{2,}([A-Z][a-z]+|\\d)+([A-Z][a-z]*)*|\\b[A-Z]{2,}[a-z]+([A-Z][a-z]+|\\d)*([A-Z][a-z]*)*)",
      className: "title.class",
      keywords: {
        "_": [
          "Object",
          "Function",
          "Boolean",
          "Symbol",
          "Math",
          "Date",
          "Number",
          "BigInt",
          "String",
          "RegExp",
          "Array",
          "Float32Array",
          "Float64Array",
          "Int8Array",
          "Uint8Array",
          "Uint8ClampedArray",
          "Int16Array",
          "Int32Array",
          "Uint16Array",
          "Uint32Array",
          "BigInt64Array",
          "BigUint64Array",
          "Set",
          "Map",
          "WeakSet",
          "WeakMap",
          "ArrayBuffer",
          "SharedArrayBuffer",
          "Atomics",
          "DataView",
          "JSON",
          "Promise",
          "Generator",
          "GeneratorFunction",
          "AsyncFunction",
          "Reflect",
          "Proxy",
          "Intl",
          "WebAssembly",
          "Error",
          "EvalError",
          "InternalError",
          "RangeError",
          "ReferenceError",
          "SyntaxError",
          "TypeError",
          "URIError"
        ]
      },
    ),
    '~contains~13~contains~0': Mode(
      className: "params",
      begin: "\\(",
      end: "\\)",
      excludeBegin: true,
      excludeEnd: true,
      keywords: {
        "\$pattern": "[A-Za-z\$_][0-9A-Za-z\$_]*",
        "keyword": [
          "as",
          "in",
          "of",
          "if",
          "for",
          "while",
          "finally",
          "var",
          "new",
          "function",
          "do",
          "return",
          "void",
          "else",
          "break",
          "catch",
          "instanceof",
          "with",
          "throw",
          "case",
          "default",
          "try",
          "switch",
          "continue",
          "typeof",
          "delete",
          "let",
          "yield",
          "const",
          "class",
          "debugger",
          "async",
          "await",
          "static",
          "import",
          "from",
          "export",
          "extends"
        ],
        "literal": ["true", "false", "null", "undefined", "NaN", "Infinity"],
        "built_in": [
          "setInterval",
          "setTimeout",
          "clearInterval",
          "clearTimeout",
          "require",
          "exports",
          "eval",
          "isFinite",
          "isNaN",
          "parseFloat",
          "parseInt",
          "decodeURI",
          "decodeURIComponent",
          "encodeURI",
          "encodeURIComponent",
          "escape",
          "unescape",
          "Object",
          "Function",
          "Boolean",
          "Symbol",
          "Math",
          "Date",
          "Number",
          "BigInt",
          "String",
          "RegExp",
          "Array",
          "Float32Array",
          "Float64Array",
          "Int8Array",
          "Uint8Array",
          "Uint8ClampedArray",
          "Int16Array",
          "Int32Array",
          "Uint16Array",
          "Uint32Array",
          "BigInt64Array",
          "BigUint64Array",
          "Set",
          "Map",
          "WeakSet",
          "WeakMap",
          "ArrayBuffer",
          "SharedArrayBuffer",
          "Atomics",
          "DataView",
          "JSON",
          "Promise",
          "Generator",
          "GeneratorFunction",
          "AsyncFunction",
          "Reflect",
          "Proxy",
          "Intl",
          "WebAssembly",
          "Error",
          "EvalError",
          "InternalError",
          "RangeError",
          "ReferenceError",
          "SyntaxError",
          "TypeError",
          "URIError"
        ],
        "variable.language": [
          "arguments",
          "this",
          "super",
          "console",
          "window",
          "document",
          "localStorage",
          "sessionStorage",
          "module",
          "global"
        ]
      },
      contains: [
        Mode(ref:'~exports~PARAMS_CONTAINS~0'),
        APOS_STRING_MODE,
        QUOTE_STRING_MODE,
        Mode(ref:'~exports~PARAMS_CONTAINS~3'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~6'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7'),
        Mode(ref:
            '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~8'),
        Mode(ref:'~exports~PARAMS_CONTAINS~10'),
      ],
    ),
  },
  name: "JavaScript",
  aliases: ["js", "jsx", "mjs", "cjs"],
  keywords: {
    "\$pattern": "[A-Za-z\$_][0-9A-Za-z\$_]*",
    "keyword": [
      "as",
      "in",
      "of",
      "if",
      "for",
      "while",
      "finally",
      "var",
      "new",
      "function",
      "do",
      "return",
      "void",
      "else",
      "break",
      "catch",
      "instanceof",
      "with",
      "throw",
      "case",
      "default",
      "try",
      "switch",
      "continue",
      "typeof",
      "delete",
      "let",
      "yield",
      "const",
      "class",
      "debugger",
      "async",
      "await",
      "static",
      "import",
      "from",
      "export",
      "extends"
    ],
    "literal": ["true", "false", "null", "undefined", "NaN", "Infinity"],
    "built_in": [
      "setInterval",
      "setTimeout",
      "clearInterval",
      "clearTimeout",
      "require",
      "exports",
      "eval",
      "isFinite",
      "isNaN",
      "parseFloat",
      "parseInt",
      "decodeURI",
      "decodeURIComponent",
      "encodeURI",
      "encodeURIComponent",
      "escape",
      "unescape",
      "Object",
      "Function",
      "Boolean",
      "Symbol",
      "Math",
      "Date",
      "Number",
      "BigInt",
      "String",
      "RegExp",
      "Array",
      "Float32Array",
      "Float64Array",
      "Int8Array",
      "Uint8Array",
      "Uint8ClampedArray",
      "Int16Array",
      "Int32Array",
      "Uint16Array",
      "Uint32Array",
      "BigInt64Array",
      "BigUint64Array",
      "Set",
      "Map",
      "WeakSet",
      "WeakMap",
      "ArrayBuffer",
      "SharedArrayBuffer",
      "Atomics",
      "DataView",
      "JSON",
      "Promise",
      "Generator",
      "GeneratorFunction",
      "AsyncFunction",
      "Reflect",
      "Proxy",
      "Intl",
      "WebAssembly",
      "Error",
      "EvalError",
      "InternalError",
      "RangeError",
      "ReferenceError",
      "SyntaxError",
      "TypeError",
      "URIError"
    ],
    "variable.language": [
      "arguments",
      "this",
      "super",
      "console",
      "window",
      "document",
      "localStorage",
      "sessionStorage",
      "module",
      "global"
    ]
  },
  illegal: "#(?![\$_A-z])",
  contains: <Mode>[
    Mode(
      scope: "meta",
      begin: "^#![ ]*\\/.*\\bnode\\b.*",
      end: "\$",
      relevance: 5,
      onBegin: callbackOnBegin2,
      label: "shebang",
    ),
    Mode(
      label: "use_strict",
      className: "meta",
      relevance: 10,
      begin: "^\\s*['\"]use (strict|asm)['\"]",
    ),
    APOS_STRING_MODE,
    QUOTE_STRING_MODE,
    Mode(ref:'~exports~PARAMS_CONTAINS~3'),
    Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3'),
    Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4'),
    Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5'),
    Mode(ref:'~exports~PARAMS_CONTAINS~0'),
    Mode(
      match: "\\\$\\d+",
    ),
    Mode(ref:'~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7'),
    Mode(ref:'~exports~CLASS_REFERENCE'),
    Mode(
      className: "attr",
      begin: "[A-Za-z\$_][0-9A-Za-z\$_]*(?=:)",
      relevance: 0,
    ),
    Mode(
      match: [
        "const|var|let",
        "\\s+",
        "[A-Za-z\$_][0-9A-Za-z\$_]*",
        "\\s*",
        "=\\s*",
        "(async\\s*)?",
        "(?=(\\([^()]*(\\([^()]*(\\([^()]*\\)[^()]*)*\\)[^()]*)*\\)|[a-zA-Z_]\\w*)\\s*=>)"
      ],
      keywords: "async",
      className: {"1": "keyword", "3": "title.function"},
      contains: [
        Mode(ref:'~contains~13~contains~0'),
      ],
    ),
    Mode(
      begin:
      "(!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||\\x7e|\\b(case|return|throw)\\b)\\s*",
      keywords: "return throw case",
      relevance: 0,
      contains: <Mode>[
        Mode(ref:'~exports~PARAMS_CONTAINS~0'),
        REGEXP_MODE,
        Mode(
          className: "function",
          begin:
          "(\\([^()]*(\\([^()]*(\\([^()]*\\)[^()]*)*\\)[^()]*)*\\)|[a-zA-Z_]\\w*)\\s*=>",
          returnBegin: true,
          end: "\\s*=>",
          contains: [
            Mode(
              className: "params",
              variants: [
                Mode(
                  begin: "[a-zA-Z_]\\w*",
                  relevance: 0,
                ),
                Mode(
                  className: 'delete',
                  begin: "\\(\\s*\\)",
                  skip: true,
                ),
                Mode(
                  begin: "\\(",
                  end: "\\)",
                  excludeBegin: true,
                  excludeEnd: true,
                  keywords: {
                    "\$pattern": "[A-Za-z\$_][0-9A-Za-z\$_]*",
                    "keyword": [
                      "as",
                      "in",
                      "of",
                      "if",
                      "for",
                      "while",
                      "finally",
                      "var",
                      "new",
                      "function",
                      "do",
                      "return",
                      "void",
                      "else",
                      "break",
                      "catch",
                      "instanceof",
                      "with",
                      "throw",
                      "case",
                      "default",
                      "try",
                      "switch",
                      "continue",
                      "typeof",
                      "delete",
                      "let",
                      "yield",
                      "const",
                      "class",
                      "debugger",
                      "async",
                      "await",
                      "static",
                      "import",
                      "from",
                      "export",
                      "extends"
                    ],
                    "literal": [
                      "true",
                      "false",
                      "null",
                      "undefined",
                      "NaN",
                      "Infinity"
                    ],
                    "built_in": [
                      "setInterval",
                      "setTimeout",
                      "clearInterval",
                      "clearTimeout",
                      "require",
                      "exports",
                      "eval",
                      "isFinite",
                      "isNaN",
                      "parseFloat",
                      "parseInt",
                      "decodeURI",
                      "decodeURIComponent",
                      "encodeURI",
                      "encodeURIComponent",
                      "escape",
                      "unescape",
                      "Object",
                      "Function",
                      "Boolean",
                      "Symbol",
                      "Math",
                      "Date",
                      "Number",
                      "BigInt",
                      "String",
                      "RegExp",
                      "Array",
                      "Float32Array",
                      "Float64Array",
                      "Int8Array",
                      "Uint8Array",
                      "Uint8ClampedArray",
                      "Int16Array",
                      "Int32Array",
                      "Uint16Array",
                      "Uint32Array",
                      "BigInt64Array",
                      "BigUint64Array",
                      "Set",
                      "Map",
                      "WeakSet",
                      "WeakMap",
                      "ArrayBuffer",
                      "SharedArrayBuffer",
                      "Atomics",
                      "DataView",
                      "JSON",
                      "Promise",
                      "Generator",
                      "GeneratorFunction",
                      "AsyncFunction",
                      "Reflect",
                      "Proxy",
                      "Intl",
                      "WebAssembly",
                      "Error",
                      "EvalError",
                      "InternalError",
                      "RangeError",
                      "ReferenceError",
                      "SyntaxError",
                      "TypeError",
                      "URIError"
                    ],
                    "variable.language": [
                      "arguments",
                      "this",
                      "super",
                      "console",
                      "window",
                      "document",
                      "localStorage",
                      "sessionStorage",
                      "module",
                      "global"
                    ]
                  },
                  contains: [
                    Mode(ref:'~exports~PARAMS_CONTAINS~0'),
                    APOS_STRING_MODE,
                    QUOTE_STRING_MODE,
                    Mode(ref:'~exports~PARAMS_CONTAINS~3'),
                    Mode(ref:
                        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~3'),
                    Mode(ref:
                        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~4'),
                    Mode(ref:
                        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~5'),
                    Mode(ref:
                        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~6'),
                    Mode(ref:
                        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~7'),
                    Mode(ref:
                        '~exports~PARAMS_CONTAINS~3~starts~contains~1~contains~8'),
                    Mode(ref:'~exports~PARAMS_CONTAINS~10'),
                  ],
                ),
              ],
            ),
          ],
        ),
        Mode(
          begin: ",",
          relevance: 0,
        ),
        Mode(
          match: "\\s+",
          relevance: 0,
        ),
        Mode(
          variants: [
            Mode(
              begin: "<>",
              end: "</>",
            ),
            Mode(
              match: "<[A-Za-z0-9\\\\._:-]+\\s*\\/>",
            ),
            Mode(
              begin: "<[A-Za-z0-9\\\\._:-]+",
              onBegin: callbackOnBegin,
              end: "\\/[A-Za-z0-9\\\\._:-]+>|\\/>",
            ),
          ],
          subLanguage: ["xml"],
          contains: [
            Mode(
              begin: "<[A-Za-z0-9\\\\._:-]+",
              end: "\\/[A-Za-z0-9\\\\._:-]+>|\\/>",
              skip: true,
              contains: <Mode>[
                Mode(self: true),
              ],
            ),
          ],
        ),
      ],
    ),
    Mode(
      variants: [
        Mode(
          match: [
            "function",
            "\\s+",
            "[A-Za-z\$_][0-9A-Za-z\$_]*",
            "(?=\\s*\\()"
          ],
        ),
        Mode(
          match: ["function", "\\s*(?=\\()"],
        ),
      ],
      className: {"1": "keyword", "3": "title.function"},
      label: "func.def",
      contains: [
        Mode(ref:'~contains~13~contains~0'),
      ],
      illegal: "%",
    ),
    Mode(
      beginKeywords: "while if switch catch for",
    ),
    Mode(
      begin:
      "\\b(?!function)[a-zA-Z_]\\w*\\([^()]*(\\([^()]*(\\([^()]*\\)[^()]*)*\\)[^()]*)*\\)\\s*\\{",
      returnBegin: true,
      label: "func.def",
      contains: [
        Mode(ref:'~contains~13~contains~0'),
        Mode(
          scope: "title",
          begin: "[A-Za-z\$_][0-9A-Za-z\$_]*",
          relevance: 0,
          className: "title.function",
        ),
      ],
    ),
    Mode(
      match: "\\.\\.\\.",
      relevance: 0,
    ),
    Mode(
      begin: "\\.(?=[A-Za-z\$_][0-9A-Za-z\$_]*(?![0-9A-Za-z\$_(]))",
      end: "[A-Za-z\$_][0-9A-Za-z\$_]*",
      excludeBegin: true,
      keywords: "prototype",
      className: "property",
      relevance: 0,
    ),
    Mode(
      match: "\\\$[A-Za-z\$_][0-9A-Za-z\$_]*",
      relevance: 0,
    ),
    Mode(
      match: ["\\bconstructor(?=\\s*\\()"],
      className: {"1": "title.function"},
      contains: [
        Mode(ref:'~contains~13~contains~0'),
      ],
    ),
    Mode(
      match:
      "\\b(?!setInterval|setTimeout|clearInterval|clearTimeout|require|exports|eval|isFinite|isNaN|parseFloat|parseInt|decodeURI|decodeURIComponent|encodeURI|encodeURIComponent|escape|unescape|super|import)[A-Za-z\$_][0-9A-Za-z\$_]*(?=\\()",
      className: "title.function",
      relevance: 0,
    ),
    Mode(
      relevance: 0,
      match: "\\b[A-Z][A-Z_0-9]+\\b",
      className: "variable.constant",
    ),
    Mode(
      variants: [
        Mode(
          match: [
            "class",
            "\\s+",
            "[A-Za-z\$_][0-9A-Za-z\$_]*",
            "\\s+",
            "extends",
            "\\s+",
            "[A-Za-z\$_][0-9A-Za-z\$_]*(\\.[A-Za-z\$_][0-9A-Za-z\$_]*)*"
          ],
          scope: {
            "1": "keyword",
            "3": "title.class",
            "5": "keyword",
            "7": "title.class.inherited"
          },
        ),
        Mode(
          match: ["class", "\\s+", "[A-Za-z\$_][0-9A-Za-z\$_]*"],
          scope: {"1": "keyword", "3": "title.class"},
        ),
      ],
    ),
    Mode(
      match: ["get|set", "\\s+", "[A-Za-z\$_][0-9A-Za-z\$_]*", "(?=\\()"],
      className: {"1": "keyword", "3": "title.function"},
      contains: [
        Mode(
          begin: "\\(\\)",
        ),
        Mode(ref:'~contains~13~contains~0'),
      ],
    ),
    Mode(
      match: "\\\$[(.]",
    ),
  ],
);

//ModeCallback callbackOnBegin = js.callbackOnBegin;

/// END_SAME_AS_BEGIN
ModeCallback callbackOnBegin1 = (EnhancedMatch m, ModeCallbackResponse resp) {
  resp.data['_beginMatch'] = m[1];
};

/// END_SAME_AS_BEGIN
ModeCallback callbackOnEnd1 = (EnhancedMatch m, ModeCallbackResponse resp) {
  if (resp.data['_beginMatch'] != m[1]) {
    resp.ignoreMatch();
  }
};

/// SHEBANG
ModeCallback callbackOnBegin2 = (EnhancedMatch m, ModeCallbackResponse resp) {
  if (m.index != 0) {
    resp.ignoreMatch();
  }
};


ModeCallback callbackOnBegin = (EnhancedMatch match, ModeCallbackResponse response) {
  final String? match0 = match[0];
  if (match0 == null) {
    return;
  }
  final int afterMatchIndex = match0.length + match.index;
  final String nextChar = match.input.substring(afterMatchIndex, afterMatchIndex + 1);
  if (
  // HTML should not include another raw `<` inside a tag
  // nested type?
  // `<Array<Array<number>>`, etc.
  nextChar == "<" ||
      // the , gives away that this is not HTML
      // `<T, A extends keyof T, V>`
      nextChar == ",") {
    response.ignoreMatch();
    return;
  }

  // `<something>`
  // Quite possibly a tag, lets look for a matching closing tag...
  if (nextChar == ">") {
    // if we cannot find a matching closing tag, then we
    // will ignore it
    if (!_hasClosingTag(match, afterMatchIndex)) {
      response.ignoreMatch();
    }
  }

  // `<blah />` (self-closing)
  // handled by simpleSelfClosing rule
  final String afterMatch = match.input.substring(afterMatchIndex);

  // some more template typing stuff
  //  <T = any>(key?: string) => Modify<
  if (RegExp(r'^\s*=').hasMatch(afterMatch)) {
    response.ignoreMatch();
    return;
  }

  // `<From extends string>`
  // technically this could be HTML, but it smells like a type
  // NOTE: This is ugh, but added specifically for https://github.com/highlightjs/highlight.js/issues/3276
  final RegExpMatch? m = RegExp(r'^\s+extends\s+').firstMatch(afterMatch);
  if (m != null) {
    if (m.start == 0) {
      response.ignoreMatch();
      // eslint-disable-next-line no-useless-return
      return;
    }
  }
};

bool _hasClosingTag(EnhancedMatch match, int after) {
  final String tag = "</${match[0]!.substring(1)}";
  final int pos = match.input.indexOf(tag, after);
  return pos != -1;
}