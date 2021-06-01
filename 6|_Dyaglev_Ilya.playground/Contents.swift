import UIKit
/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/


//Task 1&2
struct Queue<T> {
    private var elements: [T] = []
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var tempArray: [T] = []
        for element in elements {
            if (predicate(element)) {
                tempArray.append(element)
            }
        }
        return tempArray
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}
//Task 3
extension Queue {
    subscript(index:Int) -> T? {
        guard index >= 0 && index < elements.count else { return nil }
        return elements[index]
    }
    
}
