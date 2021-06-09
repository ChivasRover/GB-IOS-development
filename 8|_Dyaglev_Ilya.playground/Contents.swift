import UIKit

/*
 - Hometask #4
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 
 */

class Car {
    enum EngineState{
        case on, off
    }
    
    var brand: String
    var model: String
    var year: Int
    var engineState: EngineState
    
    init(brand: String, model: String, year: Int, engineState: EngineState) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engineState = engineState
    }
    
    func switchEngineState() {
        self.engineState = (self.engineState == .on) ? .off : .on
    }
    
    func makeSignalSound () {
        print("Beep-beep")
    }
}

class SportCar : Car {
    enum SuperSpeedState {
        case on, off
    }
    var superSpeedMode: SuperSpeedState
    init(superSpeedMode: SuperSpeedState, brand: String, model: String, year: Int, engineState: Car.EngineState) {
        self.superSpeedMode = superSpeedMode
        super.init(brand: brand, model: model, year: year, engineState: engineState)
    }
    func superSpeedSwitch() {
        self.superSpeedMode = (self.superSpeedMode == .on) ? .off : .on
    }
    override func makeSignalSound() {
        print("Rrr-rrr")
    }
}

class TrunkCar : Car {
    var trunkVolume: Int
    init(trunkVolume: Int, brand: String, model: String, year: Int, engineState: Car.EngineState) {
        self.trunkVolume = trunkVolume
        super.init(brand: brand, model: model, year: year, engineState: engineState)
    }
    func displayTrunkLoad() {
        print(self.trunkVolume)
    }
    override func makeSignalSound() {
        print("Uuu-uuu")
    }
}

var ordinaryCar = Car(brand: "Toyota", model: "Land Cruiser", year: 3021, engineState: .on)
var superCar = SportCar(superSpeedMode: .off, brand: "Ferrari", model: "S", year: 40123, engineState: .on)
var trunkCar = TrunkCar(trunkVolume: 1000, brand: "Lada", model: "SuperTrunk", year: 100000, engineState: .off)


/*
 - Hometask #5
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */

enum WindowState {
    case opened, closed
}

enum EngineState {
    case started, stopped
}

enum SuperSpeedState {
    case on, off
}

protocol CarProtocol {
    var brand: String {get set}
    var model: String {get set}
    var year: Int {get set}
    var windowState:WindowState {get set}
    var engineState: EngineState {get set}
    func showProperties() -> Array<Any>
}

extension CarProtocol {
    mutating func switchWindowState() {
        self.windowState = (self.windowState == .opened) ? .closed : .opened
    }
    mutating func switchEngineState() {
        self.engineState = (self.engineState == .started) ? .stopped : .started
    }
}

class SuperTrunkCar: CarProtocol {
    var brand: String
    
    var model: String
    
    var year: Int
    
    var windowState: WindowState
    
    var engineState: EngineState
    
    var trunkLoad: Int
    
    init(brand: String, model: String, year: Int, windowState: WindowState, engineState: EngineState, trunkLoad: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        self.windowState = windowState
        self.engineState = engineState
        self.trunkLoad = trunkLoad
    }
    
    func showProperties() -> Array<Any> {
        return [self]
    }
}

class SuperSportCar: CarProtocol {
    var brand: String
    
    var model: String
    
    var year: Int
    
    var windowState: WindowState
    
    var engineState: EngineState
    
    var superSpeedMode: SuperSpeedState
    
    init(brand: String, model: String, year: Int, windowState: WindowState, engineState: EngineState, superSpeedMode: SuperSpeedState) {
        self.brand = brand
        self.model = model
        self.year = year
        self.windowState = windowState
        self.engineState = engineState
        self.superSpeedMode = superSpeedMode
    }
    
    func showProperties() -> Array<Any> {
        return [self]
    }
    
    func switchSuperSpeed() {
        self.superSpeedMode = (self.superSpeedMode == .on) ? .off : .on
    }
    
}

extension SuperTrunkCar: CustomStringConvertible {
    var description: String {
        return "\(brand) \(model)"
    }
    
}

extension SuperSportCar: CustomStringConvertible {
    var description: String {
        return "\(brand) \(model)"
    }
    
}

var superSportCar = SuperSportCar(brand: "Ferrari", model: "S", year: 1000, windowState: .closed, engineState: .started, superSpeedMode: .off)
var superTrunkCar = SuperTrunkCar(brand: "Lada", model: "Trunk", year: 1957, windowState: .opened, engineState: .stopped, trunkLoad: 2000)

superSportCar.switchSuperSpeed()
superTrunkCar.switchWindowState()
