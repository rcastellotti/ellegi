workspace(name = "com_github_livegrep_livegrep")

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
    "new_git_repository",
)
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "divsufsort",
    build_file = "//third_party:BUILD.divsufsort",
    sha256 = "9164cb6044dcb6e430555721e3318d5a8f38871c2da9fd9256665746a69351e0",
    strip_prefix = "libdivsufsort-2.0.1",
    type = "tgz",
    url = "https://codeload.github.com/y-256/libdivsufsort/tar.gz/2.0.1",
)

git_repository(
    name = "com_googlesource_code_re2",
    commit = "767de83bb7e4bfe3a2d8aec0ec79f9f1f66da30a",
    remote = "https://github.com/google/re2",
)

git_repository(
    name = "gflags",
    commit = "e171aa2d15ed9eb17054558e0b3a6a413bb01067",  # v2.2.2
    remote = "https://github.com/gflags/gflags",
)

git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "c1d618315fa152958baef8ea0d77043eebf7f573",
    remote = "https://github.com/nelhage/rules_boost",
)
# local_repository(
#   name = "com_github_nelhage_boost",
#   path = "../rules_boost",
# )

load(
    "@com_github_nelhage_rules_boost//:boost/boost.bzl",
    "boost_deps",
)

boost_deps()

git_repository(
    name = "com_google_absl",
    commit = "5e0dcf72c64fae912184d2e0de87195fe8f0a425",
    remote = "https://github.com/abseil/abseil-cpp",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "842ec0e6b4fbfdd3de6150b61af92901eeb73681fd4d185746644c338f51d4c0",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.20.1/rules_go-v0.20.1.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.20.1/rules_go-v0.20.1.tar.gz",
    ],
)

git_repository(
    name = "bazel_gazelle",
    commit = "e443c54b396a236e0d3823f46c6a931e1c9939f2",  # 0.17.0
    remote = "https://github.com/bazelbuild/bazel-gazelle.git",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load(
    "//tools/build_defs:go_externals.bzl",
    "go_externals",
)

go_externals()

load(
    "//tools/build_defs:libgit2.bzl",
    "new_libgit2_archive",
)

new_libgit2_archive(
    name = "com_github_libgit2",
    build_file = "//third_party:BUILD.libgit2",
    sha256 = "0269ec198c54e44f275f8f51e7391681a03aa45555e2ab6ce60b0757b6bde3de",
    url = "https://github.com/libgit2/libgit2/archive/v0.24.1.tar.gz",
    version = "0.24.1",
)

git_repository(
    name = "com_github_grpc_grpc",
    commit = "a6c7b66f756ba8d4d87ee2b28e004e0ad3a642c9",
    remote = "https://github.com/grpc/grpc.git",
    #    shallow_since = "1572095092 -0700",
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()

git_repository(
    name = "io_bazel_buildifier",
    commit = "ae772d29d07002dfd89ed1d9ff673a1721f1b8dd",
    remote = "https://github.com/bazelbuild/buildifier.git",
)

local_repository(
    name = "org_dropbox_rules_node",
    path = "tools/org_dropbox_rules_node",
)

load("@org_dropbox_rules_node//node:defs.bzl", "node_repositories")

node_repositories()

git_repository(
    name = "com_grail_bazel_compdb",
    commit = "7658de071fcd072163c24cc96d78e9891d4d81f5",
    remote = "https://github.com/grailbio/bazel-compilation-database.git",
)

git_repository(
    name = "com_google_googletest",
    commit = "0ea2d8f8fa1601abb9ce713b7414e7b86f90bc61",
    remote = "https://github.com/google/googletest",
)
