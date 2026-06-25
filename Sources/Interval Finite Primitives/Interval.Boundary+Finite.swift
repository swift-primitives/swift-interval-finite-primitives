// Interval.Boundary+Finite.swift
// Conforms Interval.Boundary (swift-interval-primitives) to Finite.Enumerable
// (this package). finite → interval is a downward dependency.

import Cardinal_Primitives
public import Finite_Enumerable_Primitives
public import Interval_Primitives
import Ordinal_Primitives

extension Interval.Boundary: @retroactive Finite.Enumerable {
    /// Number of boundary values.
    @inlinable
    public static var count: Cardinal { 2 }

    /// Ordinal of this value (0: closed, 1: open).
    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .closed: 0
        case .open: 1
        }
    }

    /// Creates a value from its ordinal.
    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.closed, .open][ordinal]
    }
}
