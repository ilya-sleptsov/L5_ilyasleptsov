//
//  main.swift
//  L5_ilyasleptsov
//
//  Created by Илья Слепцов on 21.03.2021.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также методы действий.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

//MARK: - Enums


enum EngineStatus: String {
    case start = "заведен", stop = "заглушен"
}

enum WindowsStatus: String {
    case open = "открыты", close = "закрыты"
}

enum DoorsStatus: String {
    case open = "открыты", close = "закрыты"
}

enum Toning: String {
    case withToning = "с тонировкой", withoutToning = "без тонировки"
}

enum Trunk: String {
    case withFridge = "с морозильной камерой", withoutFridge = "без морозильной камеры"
}

//MARK: - Protocol


protocol Car: class, CustomStringConvertible {
    var carBrand: String { get }
    var yearOfRelease: Int { get }
    var carMileage: Double { get set }
    var engineStatus: EngineStatus { get set }
    var windowsStatus: WindowsStatus { get set }
    var doorsStatus: DoorsStatus { get set }
    
    func changeEngineStatus (to: EngineStatus)
    func changeWindowsStatus (to: WindowsStatus)
    func changeDoorsStatus (to: DoorsStatus)
}

//MARK: - Extension


extension Car {
    func changeEngineStatus (to: EngineStatus) {
        engineStatus = to
    }
    
    func changeWindowsStatus (to: WindowsStatus) {
        windowsStatus = to
    }
    
    func changeDoorsStatus (to: DoorsStatus) {
        doorsStatus = to
    }
}

//MARK: - Class sportCar


class SportCar: Car {
    var carBrand: String
    var yearOfRelease: Int
    var carMileage: Double
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    var doorsStatus: DoorsStatus
    var toning: Toning
    
    init(carBrand: String, yearOfRelease: Int, carMileage: Double, engineStatus: EngineStatus, windowsStatus: WindowsStatus, doorsStatus: DoorsStatus, toning: Toning) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.carMileage = carMileage
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.doorsStatus = doorsStatus
        self.toning = toning
    }
    
    func changeToning(to: Toning) {
        toning = to
    }
}

//MARK: - class trunkCar


class TrunkCar: Car {
    var carBrand: String
    var yearOfRelease: Int
    var carMileage: Double
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    var doorsStatus: DoorsStatus
    var trunk: Trunk
    
    init(carBrand: String, yearOfRelease: Int, carMileage: Double, engineStatus: EngineStatus, windowsStatus: WindowsStatus, doorsStatus: DoorsStatus, trunk: Trunk) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.carMileage = carMileage
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.doorsStatus = doorsStatus
        self.trunk = trunk
    }
    func changeTrunk(to: Trunk) {
        trunk = to
    }
}

//MARK: - Extensions


extension SportCar {
    var description: String {
        return "Марка автомобиля: \(carBrand), год выпуска: \(yearOfRelease), пробег автомобиля: \(carMileage), состояние двигателя: \(engineStatus.rawValue), состояние окон: \(windowsStatus.rawValue), состояние дверей: \(doorsStatus.rawValue), тонировка: \(toning.rawValue)"
    }
}

extension TrunkCar {
    var description: String {
        return "Марка автомобиля: \(carBrand), год выпуска: \(yearOfRelease), пробег автомобиля: \(carMileage), состояние двигателя: \(engineStatus.rawValue), состояние окон: \(windowsStatus.rawValue), состояние дверей: \(doorsStatus.rawValue), кузов: \(trunk.rawValue)"
}
}

//MARK: - Car examples


var Skoda = SportCar (carBrand: "Skoda", yearOfRelease: 2018, carMileage: 1000, engineStatus: .start, windowsStatus: .close, doorsStatus: .open, toning: .withToning)

var Subaru = SportCar (carBrand: "Subaru", yearOfRelease: 2019, carMileage: 0, engineStatus: .stop, windowsStatus: .open, doorsStatus: .close, toning: .withToning)

var Iveco = TrunkCar (carBrand: "Iveco", yearOfRelease: 2019, carMileage: 5000, engineStatus: .start, windowsStatus: .close, doorsStatus: .close, trunk: .withFridge)

var Volkswagen = TrunkCar (carBrand: "Volkswagen", yearOfRelease: 2020, carMileage: 2000, engineStatus: .stop, windowsStatus: .open, doorsStatus: .open, trunk: .withoutFridge)

//MARK: - Actions with cars


Skoda.changeDoorsStatus(to: .close)
Skoda.changeEngineStatus(to: .stop)
Subaru.changeWindowsStatus(to: .close)
Subaru.changeEngineStatus(to: .start)
Iveco.changeEngineStatus(to: .stop)
Iveco.changeTrunk(to: .withoutFridge)
Volkswagen.changeWindowsStatus(to: .close)
Volkswagen.changeTrunk(to: .withFridge)


//MARK: - Print


func carInfoPrint (_ value: Any) {
    print(value, "/n")
}

carInfoPrint(Skoda)
carInfoPrint(Subaru)
carInfoPrint(Iveco)
carInfoPrint(Volkswagen)
