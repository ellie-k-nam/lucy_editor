// GENERATED CODE - DO NOT MODIFY BY HAND

import '../../src/re_highlight.dart';

final langObjectivec = Mode(
    refs: {},
    name: "Objective-C",
    aliases: ["mm", "objc", "obj-c", "obj-c++", "objective-c++"],
    keywords: {
      "variable.language": ["this", "super"],
      "\$pattern": "[a-zA-Z@][a-zA-Z0-9_]*",
      "keyword": [
        "while",
        "export",
        "sizeof",
        "typedef",
        "const",
        "struct",
        "for",
        "union",
        "volatile",
        "static",
        "mutable",
        "if",
        "do",
        "return",
        "goto",
        "enum",
        "else",
        "break",
        "extern",
        "asm",
        "case",
        "default",
        "register",
        "explicit",
        "typename",
        "switch",
        "continue",
        "inline",
        "readonly",
        "assign",
        "readwrite",
        "self",
        "@synchronized",
        "id",
        "typeof",
        "nonatomic",
        "IBOutlet",
        "IBAction",
        "strong",
        "weak",
        "copy",
        "in",
        "out",
        "inout",
        "bycopy",
        "byref",
        "oneway",
        "__strong",
        "__weak",
        "__block",
        "__autoreleasing",
        "@private",
        "@protected",
        "@public",
        "@try",
        "@property",
        "@end",
        "@throw",
        "@catch",
        "@finally",
        "@autoreleasepool",
        "@synthesize",
        "@dynamic",
        "@selector",
        "@optional",
        "@required",
        "@encode",
        "@package",
        "@import",
        "@defs",
        "@compatibility_alias",
        "__bridge",
        "__bridge_transfer",
        "__bridge_retained",
        "__bridge_retain",
        "__covariant",
        "__contravariant",
        "__kindof",
        "_Nonnull",
        "_Nullable",
        "_Null_unspecified",
        "__FUNCTION__",
        "__PRETTY_FUNCTION__",
        "__attribute__",
        "getter",
        "setter",
        "retain",
        "unsafe_unretained",
        "nonnull",
        "nullable",
        "null_unspecified",
        "null_resettable",
        "class",
        "instancetype",
        "NS_DESIGNATED_INITIALIZER",
        "NS_UNAVAILABLE",
        "NS_REQUIRES_SUPER",
        "NS_RETURNS_INNER_POINTER",
        "NS_INLINE",
        "NS_AVAILABLE",
        "NS_DEPRECATED",
        "NS_ENUM",
        "NS_OPTIONS",
        "NS_SWIFT_UNAVAILABLE",
        "NS_ASSUME_NONNULL_BEGIN",
        "NS_ASSUME_NONNULL_END",
        "NS_REFINED_FOR_SWIFT",
        "NS_SWIFT_NAME",
        "NS_SWIFT_NOTHROW",
        "NS_DURING",
        "NS_HANDLER",
        "NS_ENDHANDLER",
        "NS_VALUERETURN",
        "NS_VOIDRETURN"
      ],
      "literal": ["false", "true", "FALSE", "TRUE", "nil", "YES", "NO", "NULL"],
      "built_in": [
        "dispatch_once_t",
        "dispatch_queue_t",
        "dispatch_sync",
        "dispatch_async",
        "dispatch_once"
      ],
      "type": [
        "int",
        "float",
        "char",
        "unsigned",
        "signed",
        "short",
        "long",
        "double",
        "wchar_t",
        "unichar",
        "void",
        "bool",
        "BOOL",
        "id|0",
        "_Bool"
      ]
    },
    illegal: "</",
    contains: <Mode>[
      Mode(
          className: 'built_in',
          begin:
              "\\b(AV|CA|CF|CG|CI|CL|CM|CN|CT|MK|MP|MTK|MTL|NS|SCN|SK|UI|WK|XC)\\w+"),
      C_LINE_COMMENT_MODE,
      C_BLOCK_COMMENT_MODE,
      C_NUMBER_MODE,
      QUOTE_STRING_MODE,
      APOS_STRING_MODE,
      Mode(className: 'string', variants: <Mode>[
        Mode(
            begin: "@\"",
            end: "\"",
            illegal: "\\n",
            contains: <Mode>[BACKSLASH_ESCAPE])
      ]),
      Mode(className: 'meta', begin: "#\\s*[a-z]+\\b", end: "\$", keywords: {
        "keyword":
            "if else elif endif define undef warning error line pragma ifdef ifndef include"
      }, contains: <Mode>[
        Mode(begin: "\\\\\\n", relevance: 0),
        Mode(
            scope: 'string',
            begin: "\"",
            end: "\"",
            illegal: "\\n",
            contains: <Mode>[BACKSLASH_ESCAPE],
            className: 'string'),
        Mode(className: 'string', begin: "<.*?>", end: "\$", illegal: "\\n"),
        C_LINE_COMMENT_MODE,
        C_BLOCK_COMMENT_MODE
      ]),
      Mode(
          className: 'class',
          begin: "(@interface|@class|@protocol|@implementation)\\b",
          end: "(\\{|\$)",
          excludeEnd: true,
          keywords: {
            "\$pattern": "[a-zA-Z@][a-zA-Z0-9_]*",
            "keyword": ["@interface", "@class", "@protocol", "@implementation"]
          },
          contains: <Mode>[
            UNDERSCORE_TITLE_MODE
          ]),
      Mode(begin: "\\.[a-zA-Z_]\\w*", relevance: 0)
    ]);
