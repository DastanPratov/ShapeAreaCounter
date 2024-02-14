import UIKit

protocol Shape {
    func area() -> Double
}

struct CircleShape: Shape {
    let radius: Double
    
    func area() -> Double {
        return (radius * radius) * 3.1415926535
    }
}

struct TriangleShape: Shape {
    let sideA: Double
    let sideB: Double
    let sideC: Double
    
    func area() -> Double {
        let s = (sideA + sideB + sideC) / 2
        return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    func isRightTriangle() -> Bool {
        let sides = [sideA, sideB, sideC].sorted()
        return (sides[0] * sides[0]) + (sides[1] * sides[1]) == sides[2] * sides[2]
    }
}

struct UnknownShape: Shape {
    let sidesArray: [Double]
    
    func area() -> Double {
        switch sidesArray.count {
        case 1:
            print("Форма фигуры: Круг \nПлощадь фигуры: \((sidesArray[0] * sidesArray[0]) * 3.141926535)")
            return sidesArray[0] * sidesArray[0] * 3.1415926535
        case 2:
            let square = sidesArray[0] * sidesArray[1]
            if sidesArray[0] == sidesArray[1] {
                print("Форма фигуры: Квадрат \nПлощадь фигуры: \(square)")
                return square
            } else {
                print("Форма фигуры: Прямоугольник \nПлощадь фигуры: \(square)")
                return square
            }
        case 3:
            let s = (sidesArray[0] + sidesArray[1] + sidesArray[2]) / 2
            let result = sqrt(s * (s - sidesArray[0]) * (s - sidesArray[1]) * (s - sidesArray[2]))
            print("Форма фигуры: Треугольник \nПлощадь фигуры: \(result)")
            return result
        default:
            print("Error")
            return 0
        }
    }
}

import XCTest

class TestShapes: XCTestCase {
    
    func testCircleShapeArea() {
        let circle = CircleShape(radius: 7)
        XCTAssertEqual(circle.area(), 153.9380400215, accuracy: 0.001)
    }
    
    func testTriangleShapeArea() {
        let triangle = TriangleShape(sideA: 12, sideB: 12, sideC: 23)
        XCTAssertEqual(triangle.area(), 39.420013952306, accuracy: 0.001)
    }
    
    func testUnknownShapeArea() {
        let circle = UnknownShape(sidesArray: [7])
        let triangle = UnknownShape(sidesArray: [12, 12, 23])
        let square = UnknownShape(sidesArray: [2, 4])
        XCTAssertEqual(circle.area(), 153.9380400215)
        XCTAssertEqual(triangle.area(), 39.420013952306)
        XCTAssertEqual(square.area(), 8)
    }
}
TestShapes.defaultTestSuite.run()

print("Test finish")
UnknownShape(sidesArray: [12,12,23]).area()
TriangleShape(sideA: 12, sideB: 12, sideC: 23).area()

