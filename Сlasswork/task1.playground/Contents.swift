//  Создать типы Shape, Circle, Square, Triangle;
//  у Shape должна быть функция, которая вычисляет площадь

import Darwin

protocol Shape {
    func getSquare() -> Double
}

struct Circle: Shape {
    private var radius: Double
    
    func getSquare() -> Double {
        Double.pi * radius * radius
    }
}


struct Square: Shape {
    private var side: Double
    
    func getSquare() -> Double {
        side * side
    }
}

struct Triangle: Shape {
    
    private var side1: Double
    private var side2: Double
    private var side3: Double
    private var perimeter: Double
    
    init(side1: Double, side2: Double, side3: Double) {
        self.side1 = side1
        self.side2 = side2
        self.side3 = side3
        self.perimeter = 0.5 * (side1 + side2 + side3)
    }
    
    func getSquare() -> Double {
        sqrt(perimeter * (perimeter - side1) * (perimeter - side2) * (perimeter - side3))
    }
}
