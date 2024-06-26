// GENERATED CODE - DO NOT MODIFY BY HAND

import '../../src/re_highlight.dart';

final langJulia = Mode(
    refs: {
      '~contains~0': Mode(
          className: 'number',
          begin:
              "(\\b0x[\\d_]*(\\.[\\d_]*)?|0x\\.\\d[\\d_]*)p[-+]?\\d+|\\b0[box][a-fA-F0-9][a-fA-F0-9_]*|(\\b\\d[\\d_]*(\\.[\\d_]*)?|\\.\\d[\\d_]*)([eEfF][-+]?\\d+)?",
          relevance: 0),
      '~contains~1':
          Mode(className: 'string', begin: "'(.|\\\\[xXuU][a-zA-Z0-9]+)'"),
      '~contains~2': Mode(className: 'string', contains: <Mode>[
        BACKSLASH_ESCAPE,
        Mode(className: 'subst', begin: "\\\$\\(", end: "\\)", keywords: {
          "\$pattern": "[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*",
          "keyword": [
            "baremodule",
            "begin",
            "break",
            "catch",
            "ccall",
            "const",
            "continue",
            "do",
            "else",
            "elseif",
            "end",
            "export",
            "false",
            "finally",
            "for",
            "function",
            "global",
            "if",
            "import",
            "in",
            "isa",
            "let",
            "local",
            "macro",
            "module",
            "quote",
            "return",
            "true",
            "try",
            "using",
            "where",
            "while"
          ],
          "literal": [
            "ARGS",
            "C_NULL",
            "DEPOT_PATH",
            "ENDIAN_BOM",
            "ENV",
            "Inf",
            "Inf16",
            "Inf32",
            "Inf64",
            "InsertionSort",
            "LOAD_PATH",
            "MergeSort",
            "NaN",
            "NaN16",
            "NaN32",
            "NaN64",
            "PROGRAM_FILE",
            "QuickSort",
            "RoundDown",
            "RoundFromZero",
            "RoundNearest",
            "RoundNearestTiesAway",
            "RoundNearestTiesUp",
            "RoundToZero",
            "RoundUp",
            "VERSION|0",
            "devnull",
            "false",
            "im",
            "missing",
            "nothing",
            "pi",
            "stderr",
            "stdin",
            "stdout",
            "true",
            "undef",
            "π",
            "ℯ"
          ],
          "built_in": [
            "AbstractArray",
            "AbstractChannel",
            "AbstractChar",
            "AbstractDict",
            "AbstractDisplay",
            "AbstractFloat",
            "AbstractIrrational",
            "AbstractMatrix",
            "AbstractRange",
            "AbstractSet",
            "AbstractString",
            "AbstractUnitRange",
            "AbstractVecOrMat",
            "AbstractVector",
            "Any",
            "ArgumentError",
            "Array",
            "AssertionError",
            "BigFloat",
            "BigInt",
            "BitArray",
            "BitMatrix",
            "BitSet",
            "BitVector",
            "Bool",
            "BoundsError",
            "CapturedException",
            "CartesianIndex",
            "CartesianIndices",
            "Cchar",
            "Cdouble",
            "Cfloat",
            "Channel",
            "Char",
            "Cint",
            "Cintmax_t",
            "Clong",
            "Clonglong",
            "Cmd",
            "Colon",
            "Complex",
            "ComplexF16",
            "ComplexF32",
            "ComplexF64",
            "CompositeException",
            "Condition",
            "Cptrdiff_t",
            "Cshort",
            "Csize_t",
            "Cssize_t",
            "Cstring",
            "Cuchar",
            "Cuint",
            "Cuintmax_t",
            "Culong",
            "Culonglong",
            "Cushort",
            "Cvoid",
            "Cwchar_t",
            "Cwstring",
            "DataType",
            "DenseArray",
            "DenseMatrix",
            "DenseVecOrMat",
            "DenseVector",
            "Dict",
            "DimensionMismatch",
            "Dims",
            "DivideError",
            "DomainError",
            "EOFError",
            "Enum",
            "ErrorException",
            "Exception",
            "ExponentialBackOff",
            "Expr",
            "Float16",
            "Float32",
            "Float64",
            "Function",
            "GlobalRef",
            "HTML",
            "IO",
            "IOBuffer",
            "IOContext",
            "IOStream",
            "IdDict",
            "IndexCartesian",
            "IndexLinear",
            "IndexStyle",
            "InexactError",
            "InitError",
            "Int",
            "Int128",
            "Int16",
            "Int32",
            "Int64",
            "Int8",
            "Integer",
            "InterruptException",
            "InvalidStateException",
            "Irrational",
            "KeyError",
            "LinRange",
            "LineNumberNode",
            "LinearIndices",
            "LoadError",
            "MIME",
            "Matrix",
            "Method",
            "MethodError",
            "Missing",
            "MissingException",
            "Module",
            "NTuple",
            "NamedTuple",
            "Nothing",
            "Number",
            "OrdinalRange",
            "OutOfMemoryError",
            "OverflowError",
            "Pair",
            "PartialQuickSort",
            "PermutedDimsArray",
            "Pipe",
            "ProcessFailedException",
            "Ptr",
            "QuoteNode",
            "Rational",
            "RawFD",
            "ReadOnlyMemoryError",
            "Real",
            "ReentrantLock",
            "Ref",
            "Regex",
            "RegexMatch",
            "RoundingMode",
            "SegmentationFault",
            "Set",
            "Signed",
            "Some",
            "StackOverflowError",
            "StepRange",
            "StepRangeLen",
            "StridedArray",
            "StridedMatrix",
            "StridedVecOrMat",
            "StridedVector",
            "String",
            "StringIndexError",
            "SubArray",
            "SubString",
            "SubstitutionString",
            "Symbol",
            "SystemError",
            "Task",
            "TaskFailedException",
            "Text",
            "TextDisplay",
            "Timer",
            "Tuple",
            "Type",
            "TypeError",
            "TypeVar",
            "UInt",
            "UInt128",
            "UInt16",
            "UInt32",
            "UInt64",
            "UInt8",
            "UndefInitializer",
            "UndefKeywordError",
            "UndefRefError",
            "UndefVarError",
            "Union",
            "UnionAll",
            "UnitRange",
            "Unsigned",
            "Val",
            "Vararg",
            "VecElement",
            "VecOrMat",
            "Vector",
            "VersionNumber",
            "WeakKeyDict",
            "WeakRef"
          ]
        }, contains: <Mode>[
          Mode(ref: '~contains~0'),
          Mode(ref: '~contains~1'),
          Mode(ref: '~contains~2'),
          Mode(
              className: 'string',
              contains: <Mode>[
                BACKSLASH_ESCAPE,
                Mode(ref: '~contains~2~contains~1'),
                Mode(
                    className: 'variable',
                    begin:
                        "\\\$[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*")
              ],
              begin: "`",
              end: "`"),
          Mode(
              className: 'meta',
              begin: "@[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*"),
          Mode(className: 'comment', variants: <Mode>[
            Mode(begin: "#=", end: "=#", relevance: 10),
            Mode(begin: "#", end: "\$")
          ]),
          HASH_COMMENT_MODE,
          Mode(
              className: 'keyword',
              begin:
                  "\\b(((abstract|primitive)\\s+)type|(mutable\\s+)?struct)\\b"),
          Mode(begin: "<:")
        ]),
        Mode(ref: '~contains~2~contains~1~contains~3~contains~2')
      ], variants: <Mode>[
        Mode(begin: "\\w*\"\"\"", end: "\"\"\"\\w*", relevance: 10),
        Mode(begin: "\\w*\"", end: "\"\\w*")
      ]),
      '~contains~2~contains~1':
          Mode(className: 'subst', begin: "\\\$\\(", end: "\\)", keywords: {
        "\$pattern": "[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*",
        "keyword": [
          "baremodule",
          "begin",
          "break",
          "catch",
          "ccall",
          "const",
          "continue",
          "do",
          "else",
          "elseif",
          "end",
          "export",
          "false",
          "finally",
          "for",
          "function",
          "global",
          "if",
          "import",
          "in",
          "isa",
          "let",
          "local",
          "macro",
          "module",
          "quote",
          "return",
          "true",
          "try",
          "using",
          "where",
          "while"
        ],
        "literal": [
          "ARGS",
          "C_NULL",
          "DEPOT_PATH",
          "ENDIAN_BOM",
          "ENV",
          "Inf",
          "Inf16",
          "Inf32",
          "Inf64",
          "InsertionSort",
          "LOAD_PATH",
          "MergeSort",
          "NaN",
          "NaN16",
          "NaN32",
          "NaN64",
          "PROGRAM_FILE",
          "QuickSort",
          "RoundDown",
          "RoundFromZero",
          "RoundNearest",
          "RoundNearestTiesAway",
          "RoundNearestTiesUp",
          "RoundToZero",
          "RoundUp",
          "VERSION|0",
          "devnull",
          "false",
          "im",
          "missing",
          "nothing",
          "pi",
          "stderr",
          "stdin",
          "stdout",
          "true",
          "undef",
          "π",
          "ℯ"
        ],
        "built_in": [
          "AbstractArray",
          "AbstractChannel",
          "AbstractChar",
          "AbstractDict",
          "AbstractDisplay",
          "AbstractFloat",
          "AbstractIrrational",
          "AbstractMatrix",
          "AbstractRange",
          "AbstractSet",
          "AbstractString",
          "AbstractUnitRange",
          "AbstractVecOrMat",
          "AbstractVector",
          "Any",
          "ArgumentError",
          "Array",
          "AssertionError",
          "BigFloat",
          "BigInt",
          "BitArray",
          "BitMatrix",
          "BitSet",
          "BitVector",
          "Bool",
          "BoundsError",
          "CapturedException",
          "CartesianIndex",
          "CartesianIndices",
          "Cchar",
          "Cdouble",
          "Cfloat",
          "Channel",
          "Char",
          "Cint",
          "Cintmax_t",
          "Clong",
          "Clonglong",
          "Cmd",
          "Colon",
          "Complex",
          "ComplexF16",
          "ComplexF32",
          "ComplexF64",
          "CompositeException",
          "Condition",
          "Cptrdiff_t",
          "Cshort",
          "Csize_t",
          "Cssize_t",
          "Cstring",
          "Cuchar",
          "Cuint",
          "Cuintmax_t",
          "Culong",
          "Culonglong",
          "Cushort",
          "Cvoid",
          "Cwchar_t",
          "Cwstring",
          "DataType",
          "DenseArray",
          "DenseMatrix",
          "DenseVecOrMat",
          "DenseVector",
          "Dict",
          "DimensionMismatch",
          "Dims",
          "DivideError",
          "DomainError",
          "EOFError",
          "Enum",
          "ErrorException",
          "Exception",
          "ExponentialBackOff",
          "Expr",
          "Float16",
          "Float32",
          "Float64",
          "Function",
          "GlobalRef",
          "HTML",
          "IO",
          "IOBuffer",
          "IOContext",
          "IOStream",
          "IdDict",
          "IndexCartesian",
          "IndexLinear",
          "IndexStyle",
          "InexactError",
          "InitError",
          "Int",
          "Int128",
          "Int16",
          "Int32",
          "Int64",
          "Int8",
          "Integer",
          "InterruptException",
          "InvalidStateException",
          "Irrational",
          "KeyError",
          "LinRange",
          "LineNumberNode",
          "LinearIndices",
          "LoadError",
          "MIME",
          "Matrix",
          "Method",
          "MethodError",
          "Missing",
          "MissingException",
          "Module",
          "NTuple",
          "NamedTuple",
          "Nothing",
          "Number",
          "OrdinalRange",
          "OutOfMemoryError",
          "OverflowError",
          "Pair",
          "PartialQuickSort",
          "PermutedDimsArray",
          "Pipe",
          "ProcessFailedException",
          "Ptr",
          "QuoteNode",
          "Rational",
          "RawFD",
          "ReadOnlyMemoryError",
          "Real",
          "ReentrantLock",
          "Ref",
          "Regex",
          "RegexMatch",
          "RoundingMode",
          "SegmentationFault",
          "Set",
          "Signed",
          "Some",
          "StackOverflowError",
          "StepRange",
          "StepRangeLen",
          "StridedArray",
          "StridedMatrix",
          "StridedVecOrMat",
          "StridedVector",
          "String",
          "StringIndexError",
          "SubArray",
          "SubString",
          "SubstitutionString",
          "Symbol",
          "SystemError",
          "Task",
          "TaskFailedException",
          "Text",
          "TextDisplay",
          "Timer",
          "Tuple",
          "Type",
          "TypeError",
          "TypeVar",
          "UInt",
          "UInt128",
          "UInt16",
          "UInt32",
          "UInt64",
          "UInt8",
          "UndefInitializer",
          "UndefKeywordError",
          "UndefRefError",
          "UndefVarError",
          "Union",
          "UnionAll",
          "UnitRange",
          "Unsigned",
          "Val",
          "Vararg",
          "VecElement",
          "VecOrMat",
          "Vector",
          "VersionNumber",
          "WeakKeyDict",
          "WeakRef"
        ]
      }, contains: <Mode>[
        Mode(ref: '~contains~0'),
        Mode(ref: '~contains~1'),
        Mode(ref: '~contains~2'),
        Mode(
            className: 'string',
            contains: <Mode>[
              BACKSLASH_ESCAPE,
              Mode(ref: '~contains~2~contains~1'),
              Mode(
                  className: 'variable',
                  begin:
                      "\\\$[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*")
            ],
            begin: "`",
            end: "`"),
        Mode(
            className: 'meta',
            begin: "@[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*"),
        Mode(className: 'comment', variants: <Mode>[
          Mode(begin: "#=", end: "=#", relevance: 10),
          Mode(begin: "#", end: "\$")
        ]),
        HASH_COMMENT_MODE,
        Mode(
            className: 'keyword',
            begin:
                "\\b(((abstract|primitive)\\s+)type|(mutable\\s+)?struct)\\b"),
        Mode(begin: "<:")
      ]),
      '~contains~2~contains~1~contains~3~contains~2': Mode(
          className: 'variable',
          begin: "\\\$[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*"),
      '~contains~2~contains~1~contains~3': Mode(
          className: 'string',
          contains: <Mode>[
            BACKSLASH_ESCAPE,
            Mode(ref: '~contains~2~contains~1'),
            Mode(
                className: 'variable',
                begin:
                    "\\\$[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*")
          ],
          begin: "`",
          end: "`"),
      '~contains~2~contains~1~contains~4': Mode(
          className: 'meta',
          begin: "@[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*"),
      '~contains~2~contains~1~contains~5': Mode(
          className: 'comment',
          variants: <Mode>[
            Mode(begin: "#=", end: "=#", relevance: 10),
            Mode(begin: "#", end: "\$")
          ]),
      '~contains~2~contains~1~contains~7': Mode(
          className: 'keyword',
          begin: "\\b(((abstract|primitive)\\s+)type|(mutable\\s+)?struct)\\b"),
      '~contains~2~contains~1~contains~8': Mode(begin: "<:")
    },
    keywords: {
      "\$pattern": "[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*",
      "keyword": [
        "baremodule",
        "begin",
        "break",
        "catch",
        "ccall",
        "const",
        "continue",
        "do",
        "else",
        "elseif",
        "end",
        "export",
        "false",
        "finally",
        "for",
        "function",
        "global",
        "if",
        "import",
        "in",
        "isa",
        "let",
        "local",
        "macro",
        "module",
        "quote",
        "return",
        "true",
        "try",
        "using",
        "where",
        "while"
      ],
      "literal": [
        "ARGS",
        "C_NULL",
        "DEPOT_PATH",
        "ENDIAN_BOM",
        "ENV",
        "Inf",
        "Inf16",
        "Inf32",
        "Inf64",
        "InsertionSort",
        "LOAD_PATH",
        "MergeSort",
        "NaN",
        "NaN16",
        "NaN32",
        "NaN64",
        "PROGRAM_FILE",
        "QuickSort",
        "RoundDown",
        "RoundFromZero",
        "RoundNearest",
        "RoundNearestTiesAway",
        "RoundNearestTiesUp",
        "RoundToZero",
        "RoundUp",
        "VERSION|0",
        "devnull",
        "false",
        "im",
        "missing",
        "nothing",
        "pi",
        "stderr",
        "stdin",
        "stdout",
        "true",
        "undef",
        "π",
        "ℯ"
      ],
      "built_in": [
        "AbstractArray",
        "AbstractChannel",
        "AbstractChar",
        "AbstractDict",
        "AbstractDisplay",
        "AbstractFloat",
        "AbstractIrrational",
        "AbstractMatrix",
        "AbstractRange",
        "AbstractSet",
        "AbstractString",
        "AbstractUnitRange",
        "AbstractVecOrMat",
        "AbstractVector",
        "Any",
        "ArgumentError",
        "Array",
        "AssertionError",
        "BigFloat",
        "BigInt",
        "BitArray",
        "BitMatrix",
        "BitSet",
        "BitVector",
        "Bool",
        "BoundsError",
        "CapturedException",
        "CartesianIndex",
        "CartesianIndices",
        "Cchar",
        "Cdouble",
        "Cfloat",
        "Channel",
        "Char",
        "Cint",
        "Cintmax_t",
        "Clong",
        "Clonglong",
        "Cmd",
        "Colon",
        "Complex",
        "ComplexF16",
        "ComplexF32",
        "ComplexF64",
        "CompositeException",
        "Condition",
        "Cptrdiff_t",
        "Cshort",
        "Csize_t",
        "Cssize_t",
        "Cstring",
        "Cuchar",
        "Cuint",
        "Cuintmax_t",
        "Culong",
        "Culonglong",
        "Cushort",
        "Cvoid",
        "Cwchar_t",
        "Cwstring",
        "DataType",
        "DenseArray",
        "DenseMatrix",
        "DenseVecOrMat",
        "DenseVector",
        "Dict",
        "DimensionMismatch",
        "Dims",
        "DivideError",
        "DomainError",
        "EOFError",
        "Enum",
        "ErrorException",
        "Exception",
        "ExponentialBackOff",
        "Expr",
        "Float16",
        "Float32",
        "Float64",
        "Function",
        "GlobalRef",
        "HTML",
        "IO",
        "IOBuffer",
        "IOContext",
        "IOStream",
        "IdDict",
        "IndexCartesian",
        "IndexLinear",
        "IndexStyle",
        "InexactError",
        "InitError",
        "Int",
        "Int128",
        "Int16",
        "Int32",
        "Int64",
        "Int8",
        "Integer",
        "InterruptException",
        "InvalidStateException",
        "Irrational",
        "KeyError",
        "LinRange",
        "LineNumberNode",
        "LinearIndices",
        "LoadError",
        "MIME",
        "Matrix",
        "Method",
        "MethodError",
        "Missing",
        "MissingException",
        "Module",
        "NTuple",
        "NamedTuple",
        "Nothing",
        "Number",
        "OrdinalRange",
        "OutOfMemoryError",
        "OverflowError",
        "Pair",
        "PartialQuickSort",
        "PermutedDimsArray",
        "Pipe",
        "ProcessFailedException",
        "Ptr",
        "QuoteNode",
        "Rational",
        "RawFD",
        "ReadOnlyMemoryError",
        "Real",
        "ReentrantLock",
        "Ref",
        "Regex",
        "RegexMatch",
        "RoundingMode",
        "SegmentationFault",
        "Set",
        "Signed",
        "Some",
        "StackOverflowError",
        "StepRange",
        "StepRangeLen",
        "StridedArray",
        "StridedMatrix",
        "StridedVecOrMat",
        "StridedVector",
        "String",
        "StringIndexError",
        "SubArray",
        "SubString",
        "SubstitutionString",
        "Symbol",
        "SystemError",
        "Task",
        "TaskFailedException",
        "Text",
        "TextDisplay",
        "Timer",
        "Tuple",
        "Type",
        "TypeError",
        "TypeVar",
        "UInt",
        "UInt128",
        "UInt16",
        "UInt32",
        "UInt64",
        "UInt8",
        "UndefInitializer",
        "UndefKeywordError",
        "UndefRefError",
        "UndefVarError",
        "Union",
        "UnionAll",
        "UnitRange",
        "Unsigned",
        "Val",
        "Vararg",
        "VecElement",
        "VecOrMat",
        "Vector",
        "VersionNumber",
        "WeakKeyDict",
        "WeakRef"
      ]
    },
    illegal: "<\\/",
    name: "Julia",
    contains: <Mode>[
      Mode(ref: '~contains~0'),
      Mode(ref: '~contains~1'),
      Mode(ref: '~contains~2'),
      Mode(ref: '~contains~2~contains~1~contains~3'),
      Mode(ref: '~contains~2~contains~1~contains~4'),
      Mode(ref: '~contains~2~contains~1~contains~5'),
      HASH_COMMENT_MODE,
      Mode(ref: '~contains~2~contains~1~contains~7'),
      Mode(ref: '~contains~2~contains~1~contains~8')
    ]);
