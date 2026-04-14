// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "TreeSitterYaml",
    products: [
        .library(name: "TreeSitterYaml", targets: ["TreeSitterYaml"]),
    ],
    dependencies: [
        // swift-tree-sitter main uses tree-sitter 0.25+ (matches grammar generated with tree-sitter 0.25.x).
        .package(url: "https://github.com/tree-sitter/swift-tree-sitter", branch: "main"),
    ],
    targets: [
        .target(
            name: "TreeSitterYaml",
            dependencies: [],
            path: ".",
            exclude: [
                "binding.gyp",
                "bindings/c",
                "bindings/go",
                "bindings/node",
                "bindings/python",
                "bindings/rust",
                "Cargo.toml",
                "Cargo.lock",
                "CMakeLists.txt",
                "eslint.config.mjs",
                "go.mod",
                "go.sum",
                "grammar.js",
                "LICENSE",
                "Makefile",
                "package-lock.json",
                "package.json",
                "pyproject.toml",
                "README.md",
                "setup.py",
                "src/grammar.json",
                "src/node-types.json",
                "test",
                "tree-sitter.json",
            ],
            sources: [
                "src/parser.c",
                "src/scanner.c",
            ],
            resources: [
                .copy("queries"),
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [
                .headerSearchPath("src"),
                .define("YAML_SCHEMA", to: "core"),
            ],
        ),
        .testTarget(
            name: "TreeSitterYamlTests",
            dependencies: [
                .product(name: "SwiftTreeSitter", package: "swift-tree-sitter"),
                "TreeSitterYaml",
            ],
            path: "bindings/swift/TreeSitterYamlTests",
        ),
    ],
    cLanguageStandard: .c11,
)
