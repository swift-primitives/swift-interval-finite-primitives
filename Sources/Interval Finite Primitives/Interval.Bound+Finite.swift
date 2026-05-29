// Interval.Bound+Finite.swift
// Conforms Interval.Bound (swift-interval-primitives) to Finite.Enumerable
// (this package). finite → interval is a downward dependency.

public import Finite_Enumerable_Primitives
public import Interval_Primitives
import Cardinal_Primitives
import Ordinal_Primitives

extension Interval.Bound: Finite.Enumerable {
    /// Number of bound values.
    @inlinable
    public static var count: Cardinal { 2 }

    /// Ordinal of this value (0: lower, 1: upper).
    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .lower: 0
        case .upper: 1
        }
    }

    /// Creates a value from its ordinal.
    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.lower, .upper][ordinal]
    }
}
