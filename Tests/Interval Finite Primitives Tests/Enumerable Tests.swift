import Cardinal_Primitives
import Interval_Finite_Primitives
import Interval_Primitives
import Ordinal_Primitives
import Testing

@Suite("Enumerable Tests")
struct EnumerableTests {
    @Suite struct Unit {}
}

extension EnumerableTests.Unit {
    @Test
    func `bound count is two`() {
        #expect(Interval.Bound.count == Cardinal(2))
    }

    @Test
    func `bound ordinals are zero and one`() {
        #expect(Interval.Bound.lower.ordinal == Ordinal(0))
        #expect(Interval.Bound.upper.ordinal == Ordinal(1))
    }

    @Test
    func `bound round-trips through ordinal`() {
        for bound in [Interval.Bound.lower, Interval.Bound.upper] {
            let restored = Interval.Bound(_unchecked: (), ordinal: bound.ordinal)
            #expect(restored.ordinal == bound.ordinal)
        }
    }

    @Test
    func `boundary count is two`() {
        #expect(Interval.Boundary.count == Cardinal(2))
    }

    @Test
    func `boundary ordinals are zero and one`() {
        #expect(Interval.Boundary.closed.ordinal == Ordinal(0))
        #expect(Interval.Boundary.open.ordinal == Ordinal(1))
    }

    @Test
    func `boundary round-trips through ordinal`() {
        for boundary in [Interval.Boundary.closed, Interval.Boundary.open] {
            let restored = Interval.Boundary(_unchecked: (), ordinal: boundary.ordinal)
            #expect(restored.ordinal == boundary.ordinal)
        }
    }

    @Test
    func `endpoint count is two`() {
        #expect(Interval.Endpoint.count == Cardinal(2))
    }

    @Test
    func `endpoint ordinals are zero and one`() {
        #expect(Interval.Endpoint.start.ordinal == Ordinal(0))
        #expect(Interval.Endpoint.end.ordinal == Ordinal(1))
    }

    @Test
    func `endpoint round-trips through ordinal`() {
        for endpoint in [Interval.Endpoint.start, Interval.Endpoint.end] {
            let restored = Interval.Endpoint(_unchecked: (), ordinal: endpoint.ordinal)
            #expect(restored.ordinal == endpoint.ordinal)
        }
    }
}
