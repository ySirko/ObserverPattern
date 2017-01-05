//: Playground - noun: a place where people can play

import UIKit

protocol Observer {
    
    var name: String { get set }
    
    func notify()
}

class ConcreteObserver: Observer {
    
    // MARK: - Properties
    
    internal var name: String

    // MARK: - Initializers
    
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Public functions
    
    func notify() {
        print("\(name) observer")
    }
}

// MARK: - Equatable

extension ConcreteObserver: Equatable {
    static func ==(lhs: ConcreteObserver, rhs: ConcreteObserver) -> Bool {
        return lhs.name == rhs.name
    }
}

class Subject {
    
    var observers: Array<ConcreteObserver> = []
    
    func registerObserver(_ observer: ConcreteObserver) {
        guard observers.index(where: { $0 == observer }) == nil else { return }
        observers.append(observer)
    }
    
    func unregisterObserver(_ observer: ConcreteObserver) {
        
        if let index = observers.index(where: { $0 == observer }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        observers.map({ $0.notify() })
    }
}


let subject = Subject()
let first = ConcreteObserver(name: "First")
let second = ConcreteObserver(name: "Second")
let third = ConcreteObserver(name: "Third")

subject.registerObserver(first)
subject.registerObserver(second)
subject.registerObserver(third)

subject.notifyObservers()

