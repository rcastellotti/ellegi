load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@compdb//:aspects.bzl", "compilation_database")

compilation_database(
    name = "compilation_db",
    exec_root_marker = True,
    targets = [
        "//src/tools:codesearch",
        "//src/tools:codesearchtool",
    ],
)

load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/livegrep/livegrep
gazelle(name = "gazelle")

filegroup(
    name = "docs",
    srcs = glob([
        "doc/**/*",
    ]),
)

pkg_tar(
    name = "livegrep",
    srcs = [
        ":COPYING",
        ":README.md",
        ":docs",
    ],
    strip_prefix = ".",
    deps = [
        "//cmd:go_tools",
        "//src/tools:cc_tools",
        "//web:assets",
    ],
)
