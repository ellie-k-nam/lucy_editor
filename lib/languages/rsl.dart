// GENERATED CODE - DO NOT MODIFY BY HAND

import '../../src/re_highlight.dart';

final langRsl = Mode(
    refs: {},
    name: "RenderMan RSL",
    keywords: {
      "keyword": [
        "while",
        "for",
        "if",
        "do",
        "return",
        "else",
        "break",
        "extern",
        "continue"
      ],
      "built_in": [
        "abs",
        "acos",
        "ambient",
        "area",
        "asin",
        "atan",
        "atmosphere",
        "attribute",
        "calculatenormal",
        "ceil",
        "cellnoise",
        "clamp",
        "comp",
        "concat",
        "cos",
        "degrees",
        "depth",
        "Deriv",
        "diffuse",
        "distance",
        "Du",
        "Dv",
        "environment",
        "exp",
        "faceforward",
        "filterstep",
        "floor",
        "format",
        "fresnel",
        "incident",
        "length",
        "lightsource",
        "log",
        "match",
        "max",
        "min",
        "mod",
        "noise",
        "normalize",
        "ntransform",
        "opposite",
        "option",
        "phong",
        "pnoise",
        "pow",
        "printf",
        "ptlined",
        "radians",
        "random",
        "reflect",
        "refract",
        "renderinfo",
        "round",
        "setcomp",
        "setxcomp",
        "setycomp",
        "setzcomp",
        "shadow",
        "sign",
        "sin",
        "smoothstep",
        "specular",
        "specularbrdf",
        "spline",
        "sqrt",
        "step",
        "tan",
        "texture",
        "textureinfo",
        "trace",
        "transform",
        "vtransform",
        "xcomp",
        "ycomp",
        "zcomp"
      ],
      "type": ["matrix", "float", "color", "point", "normal", "vector"]
    },
    illegal: "</",
    contains: <Mode>[
      C_LINE_COMMENT_MODE,
      C_BLOCK_COMMENT_MODE,
      QUOTE_STRING_MODE,
      APOS_STRING_MODE,
      C_NUMBER_MODE,
      Mode(className: 'meta', begin: "#", end: "\$"),
      Mode(match: [
        "(surface|displacement|light|volume|imager)",
        "\\s+",
        "[a-zA-Z]\\w*"
      ], scope: <int, String>{
        1: 'keyword',
        3: 'title.class',
      }),
      Mode(beginKeywords: "illuminate illuminance gather", end: "\\(")
    ]);
