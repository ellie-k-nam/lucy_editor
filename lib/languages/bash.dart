// GENERATED CODE - DO NOT MODIFY BY HAND

import '../../src/re_highlight.dart';
import 'lib/common.dart';

final langBash = Mode(
    refs: {
      '~contains~3~contains~2': Mode(className: 'variable', variants: <Mode>[
        Mode(begin: "\\\$[\\w\\d#@][\\w\\d_]*(?![\\w\\d])(?![\$])"),
        Mode(begin: "\\\$\\{", end: "\\}", contains: <Mode>[
          Mode(self: true),
          Mode(
              begin: ":-",
              contains: <Mode>[Mode(ref: '~contains~3~contains~2')])
        ])
      ]),
      '~contains~7':
          Mode(className: 'string', begin: "\"", end: "\"", contains: <Mode>[
        BACKSLASH_ESCAPE,
        Mode(ref: '~contains~3~contains~2'),
        Mode(
            className: 'subst',
            begin: "\\\$\\(",
            end: "\\)",
            contains: <Mode>[BACKSLASH_ESCAPE, Mode(ref: '~contains~7')])
      ])
    },
    name: "Bash",
    aliases: ["sh"],
    keywords: {
      "\$pattern": "\\b[a-z][a-z0-9._-]+\\b",
      "keyword": [
        "if",
        "then",
        "else",
        "elif",
        "fi",
        "for",
        "while",
        "until",
        "in",
        "do",
        "done",
        "case",
        "esac",
        "function",
        "select"
      ],
      "literal": ["true", "false"],
      "built_in": [
        "break",
        "cd",
        "continue",
        "eval",
        "exec",
        "exit",
        "export",
        "getopts",
        "hash",
        "pwd",
        "readonly",
        "return",
        "shift",
        "test",
        "times",
        "trap",
        "umask",
        "unset",
        "alias",
        "bind",
        "builtin",
        "caller",
        "command",
        "declare",
        "echo",
        "enable",
        "help",
        "let",
        "local",
        "logout",
        "mapfile",
        "printf",
        "read",
        "readarray",
        "source",
        "type",
        "typeset",
        "ulimit",
        "unalias",
        "set",
        "shopt",
        "autoload",
        "bg",
        "bindkey",
        "bye",
        "cap",
        "chdir",
        "clone",
        "comparguments",
        "compcall",
        "compctl",
        "compdescribe",
        "compfiles",
        "compgroups",
        "compquote",
        "comptags",
        "comptry",
        "compvalues",
        "dirs",
        "disable",
        "disown",
        "echotc",
        "echoti",
        "emulate",
        "fc",
        "fg",
        "float",
        "functions",
        "getcap",
        "getln",
        "history",
        "integer",
        "jobs",
        "kill",
        "limit",
        "log",
        "noglob",
        "popd",
        "print",
        "pushd",
        "pushln",
        "rehash",
        "sched",
        "setcap",
        "setopt",
        "stat",
        "suspend",
        "ttyctl",
        "unfunction",
        "unhash",
        "unlimit",
        "unsetopt",
        "vared",
        "wait",
        "whence",
        "where",
        "which",
        "zcompile",
        "zformat",
        "zftp",
        "zle",
        "zmodload",
        "zparseopts",
        "zprof",
        "zpty",
        "zregexparse",
        "zsocket",
        "zstyle",
        "ztcp",
        "chcon",
        "chgrp",
        "chown",
        "chmod",
        "cp",
        "dd",
        "df",
        "dir",
        "dircolors",
        "ln",
        "ls",
        "mkdir",
        "mkfifo",
        "mknod",
        "mktemp",
        "mv",
        "realpath",
        "rm",
        "rmdir",
        "shred",
        "sync",
        "touch",
        "truncate",
        "vdir",
        "b2sum",
        "base32",
        "base64",
        "cat",
        "cksum",
        "comm",
        "csplit",
        "cut",
        "expand",
        "fmt",
        "fold",
        "head",
        "join",
        "md5sum",
        "nl",
        "numfmt",
        "od",
        "paste",
        "ptx",
        "pr",
        "sha1sum",
        "sha224sum",
        "sha256sum",
        "sha384sum",
        "sha512sum",
        "shuf",
        "sort",
        "split",
        "sum",
        "tac",
        "tail",
        "tr",
        "tsort",
        "unexpand",
        "uniq",
        "wc",
        "arch",
        "basename",
        "chroot",
        "date",
        "dirname",
        "du",
        "echo",
        "env",
        "expr",
        "factor",
        "groups",
        "hostid",
        "id",
        "link",
        "logname",
        "nice",
        "nohup",
        "nproc",
        "pathchk",
        "pinky",
        "printenv",
        "printf",
        "pwd",
        "readlink",
        "runcon",
        "seq",
        "sleep",
        "stat",
        "stdbuf",
        "stty",
        "tee",
        "test",
        "timeout",
        "tty",
        "uname",
        "unlink",
        "uptime",
        "users",
        "who",
        "whoami",
        "yes"
      ]
    },
    contains: <Mode>[
      Mode(
        scope: 'meta',
        begin: "^#![ ]*\\/.*\\b(fish|bash|zsh|sh|csh|ksh|tcsh|dash|scsh)\\b.*",
        end: "\$",
        relevance: 10,
        onBegin: callbackOnBegin2,
      ),
      Mode(
          scope: 'meta',
          begin: "^#![ ]*\\/",
          end: "\$",
          relevance: 0,
          onBegin: callbackOnBegin2),
      Mode(
          className: 'function',
          begin: "\\w[\\w\\d_]*\\s*\\(\\s*\\)\\s*\\{",
          returnBegin: true,
          contains: <Mode>[
            Mode(scope: 'title', begin: "\\w[\\w\\d_]*", relevance: 0)
          ],
          relevance: 0),
      Mode(begin: "\\\$?\\(\\(", end: "\\)\\)", contains: <Mode>[
        Mode(begin: "\\d+#[0-9a-f]+", className: 'number'),
        NUMBER_MODE,
        Mode(ref: '~contains~3~contains~2')
      ]),
      HASH_COMMENT_MODE,
      Mode(
          begin: "<<-?\\s*(?=\\w+)",
          starts: Mode(contains: <Mode>[
            Mode(
                begin: "(\\w+)",
                end: "(\\w+)",
                className: 'string',
                onBegin: callbackOnBegin1,
                onEnd: callbackOnEnd1)
          ])),
      Mode(match: "(\\/[a-z._-]+)+"),
      Mode(ref: '~contains~7'),
      Mode(match: "\\\\\""),
      Mode(className: 'string', begin: "'", end: "'"),
      Mode(match: "\\\\'"),
      Mode(ref: '~contains~3~contains~2')
    ]);
