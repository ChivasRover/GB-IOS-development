import UIKit

enum CarAction {
    case engineSwitch
    case windowsSwitch
    case trunkAdd(volume:Int)
    case trunkRemove(volume:Int)
}

enum EngineRunning {
    case running
    case notRunning
}

enum WindowsState {
    case opened
    case closed
}


struct SportCar {
    let mark: String,
        year: String,
        trunkVolume: Int
    var engineRunning: EngineRunning,
        windowsState: WindowsState,
        trunkVoulumeUsed: Int
    
    init(mark: String, year: String, trunkVolume: Int, engineRunning: EngineRunning, windowsState: WindowsState, trunkVolumeUsed: Int){
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineRunning = engineRunning
        self.windowsState = windowsState
        self.trunkVoulumeUsed = trunkVolumeUsed
    }
    
    mutating func changeCarState(value:CarAction) {
        switch value {
        case .engineSwitch:
            self.engineRunning = (self.engineRunning == .notRunning) ? .running : .notRunning
            let message = (self.engineRunning == .notRunning) ? "Engine is not running" : "Engine is running"
            print(message)
        case .windowsSwitch:
            self.windowsState = (self.windowsState == .closed) ? .opened : .closed
            let message = (self.windowsState == .closed) ? "Windows are closed" : "Windows are opened"
            print(message)
        case let .trunkAdd(volume: volume):
            print("Trunk volume used before:\(self.trunkVoulumeUsed)")
            self.trunkVoulumeUsed += (self.trunkVoulumeUsed + volume > self.trunkVolume) ? self.trunkVolume - self.trunkVoulumeUsed : volume
            print("Trunk volume used after:\(self.trunkVoulumeUsed)")
        case let .trunkRemove(volume: volume):
            print("Trunk volume used before:\(self.trunkVoulumeUsed)")
            self.trunkVoulumeUsed -= (self.trunkVoulumeUsed - volume < 0) ? self.trunkVoulumeUsed : volume
            print("Trunk volume used after:\(self.trunkVoulumeUsed)")
        }
    }
    
}

var ferrari = SportCar(mark: "Ferrari", year: "2021", trunkVolume: 200, engineRunning: .notRunning, windowsState: .closed, trunkVolumeUsed: 10)
let randomLoadOutNum: Int = Int.random(in: 1..<200),
    randomLoadInNum: Int = Int.random(in: 1..<200)

ferrari.changeCarState(value: .trunkRemove(volume: randomLoadOutNum ))
ferrari.changeCarState(value: .trunkAdd(volume: randomLoadInNum))
ferrari.changeCarState(value: .engineSwitch)
ferrari.changeCarState(value: .engineSwitch)
ferrari.changeCarState(value: .windowsSwitch)
ferrari.changeCarState(value: .windowsSwitch)
