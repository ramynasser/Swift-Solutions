/**
 The decorator pattern dynamically modifies the behavior of a core object without changing its existing class definition
 */
import UIKit
import XCTest

protocol Component {
    func operation() -> String
}
class ConcreteComponent: Component {
    func operation() -> String {
        return "ConcreteComponent"
    }
}
class Decorator: Component {
    private var component: Component
    init(_ component: Component) {
        self.component = component
    }
    func operation() -> String {
        return component.operation()
    }
}
class ConcreteDecoratorA: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorA(" + super.operation() + ")"
    }
}
class ConcreteDecoratorB: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorB(" + super.operation() + ")"
    }
}
class Client {
    static func someClientCode(component: Component) {
        print("Result: " + component.operation())
    }
}
/// Let's see how it all works together.
class DecoratorConceptual: XCTestCase {
    func testDecoratorPattern() {
        // This way the client code can support both simple components...
        let simple = ConcreteComponent()
        Client.someClientCode(component: simple)

        let decorator1 = ConcreteDecoratorA(simple)
        let decorator2 = ConcreteDecoratorB(decorator1)
        Client.someClientCode(component: decorator2)
    }
}
