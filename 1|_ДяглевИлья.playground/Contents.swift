import UIKit

//First task: solve quadratic equation
//Taking into attention that fact, that I don't posess an opportunity to work with user's input, I have to come up with some random method to generate different functions and solutions as well
//Declaration of random coefficients:
let randomCoefficientA = Float.random(in: -100..<101),
    randomCoefficientB = Float.random(in: -100..<101),
    randomCoefficientC = Float.random(in: -100..<101)
//
print("Coefficient a: " + " " + String(randomCoefficientA))
print("Coefficient b: " + " " + String(randomCoefficientB))
print("Coefficient c: " + " " + String(randomCoefficientC))

let discriminant = (randomCoefficientB * randomCoefficientB) - (4 * randomCoefficientA * randomCoefficientC)

if (discriminant < 0) {
    print("There aren't any solutions ;(")
} else {
    let x1 = ((-1 * randomCoefficientB) + sqrt(discriminant)) / (2 * randomCoefficientA)

    let x2 = ((-1 * randomCoefficientB) - sqrt(discriminant)) / (2 * randomCoefficientA)

    print("x1 = " + String(x1))
    print("x2 = " + String(x2))
}

//Task 2: Find the area, perimeter, and hypotenuse of a triangle
//I'll use the same random method to generate different examples

let legA = Float.random(in: 1..<101),
    legB = Float.random(in: 1..<101)

let triangleArea = (legA * legB) / 2
let triangleHypotenuse = sqrt((legA * legA) + (legB * legB))
let trianglePerimeter = legA + legB + triangleHypotenuse

print("Triangle leg A: " + String(legA))
print("Triangle leg B: " + String(legB))
print("Triangle hypothenuse: " + String(triangleHypotenuse))
print("Triangle area: " + String(triangleArea))
print("Triangle perimeter: " + String(trianglePerimeter))

//Task 3: The user enters the amount of the deposit to the bank and the annual interest. Find the deposit amount in 5 years.
let userDeposit = Float.random(in: 1..<101)
let annualInterest = Float.random(in: 1..<20)
let numberOfYears: Float = 5

let resultedAmount = pow((1 + (annualInterest / 100)), numberOfYears) * userDeposit

print("User's deposit = " + String(userDeposit))
print("Annual interest = " + String(annualInterest))
print("Deposit amount in 5 years = " + String(resultedAmount))
