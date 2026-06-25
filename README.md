# Interval Finite Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

`Finite.Enumerable` conformances for the interval-position enums `Interval.Bound`, `Interval.Boundary`, and `Interval.Endpoint` — each two-valued type gains a `count`, an `ordinal`, and ordinal round-tripping.

---

## Quick Start

`Interval.Bound` (lower/upper), `Interval.Boundary` (closed/open), and `Interval.Endpoint` (start/end) are the two-valued position enums from `swift-interval-primitives`. This package conforms each to `Finite.Enumerable`, so every value carries an `Ordinal` in `0..<count` and can be reconstructed from that ordinal — the bridge that lets an interval position index a table, drive uniform iteration, or serialize as a small integer.

```swift
import Interval_Finite_Primitives
import Ordinal_Primitives

// Each enum now answers "how many values?" and "which ordinal?":
Interval.Boundary.count            // 2  (a Cardinal)
Interval.Boundary.closed.ordinal   // 0  (an Ordinal)
Interval.Boundary.open.ordinal     // 1

// Total, safe reconstruction from an ordinal — nil when out of range:
let boundary = Interval.Boundary(Ordinal(1))   // .open
let invalid = Interval.Boundary(Ordinal(2))    // nil — only 0..<2 are valid

// Fast, unchecked path when the ordinal is already trusted:
let bound = Interval.Bound(_unchecked: (), ordinal: Ordinal(0))   // .lower
```

Because `Finite.Enumerable` refines `CaseIterable`, every conformer also iterates over its values through `allCases`. Importing `Interval Finite Primitives` re-exports both `Interval Primitives` and `Finite Enumerable Primitives`, so the interval types and the protocol arrive together; the `Ordinal` literal type comes from `Ordinal Primitives`.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-interval-finite-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Interval Finite Primitives", package: "swift-interval-finite-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on the `Finite.Enumerable`, `Interval`, `Cardinal`, and `Ordinal` primitives — `finite → interval` is a downward dependency, so the conformances live here rather than in either dependency.

| Product | Target | Purpose |
|---------|--------|---------|
| `Interval Finite Primitives` | `Sources/Interval Finite Primitives/` | `Finite.Enumerable` conformances for `Interval.Bound`, `Interval.Boundary`, and `Interval.Endpoint`, plus a re-export of `Interval Primitives` and `Finite Enumerable Primitives`. |
| `Interval Finite Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
