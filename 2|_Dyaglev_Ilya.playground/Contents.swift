import UIKit

//Task 1: Design a function that determines is number even or not

func isEven(number: Int) -> Bool {
    return (number % 2 == 0) ? true : false;
}

let randomIntNum = Int.random(in: -100..<100)

isEven(number: randomIntNum)

//Task 2: Design a function that determines whether a number is divisible by 3

func isDevisibleByThree(number: Int) -> Bool {
    return (number % 3 == 0) ? true : false;
}

isDevisibleByThree(number: randomIntNum)

//Task 3: Create an increasing array of 100 numbers
func increasingArrayGen(startNum: Int, limit: Int) -> Array<Int> {
    var resultedArray: Array<Int> = [startNum];
    var counter = startNum
    while (counter < limit) {
        let lastArrElem: Int = resultedArray[resultedArray.count - 1]
        resultedArray.append(lastArrElem + 1)
        counter += 1
    }
    return resultedArray;
}

let increasingArray = increasingArrayGen(startNum:0, limit: 100)

//Task 4: delete all not even numbers and those who aren't divisible by 3

func specialArrFilter(arr: Array<Int>) -> Array<Int> {
    var filteredArray: Array<Int> = []
    for number in arr {
        if (isEven(number: number) && isDevisibleByThree(number: number)) {
            filteredArray.append(number)
        }
    }
    return filteredArray
}

specialArrFilter(arr: increasingArray)

//Task 5: Write a function that adds a new Fibonacci number to an array, and add 50 elements using it
func fibonacciArrGen(limit: Int) -> Array<Int> {
    var resultedArray: Array<Int> = [0, 1]
    while(resultedArray.count < limit) {
        let lastArrElem: Int = resultedArray[resultedArray.count - 1]
        let preLastArrElem: Int = resultedArray[resultedArray.count - 2]
        let newArrElem: Int = lastArrElem + preLastArrElem
        resultedArray.append(newArrElem)
    }
    return resultedArray
}

let fibonacciArr = fibonacciArrGen(limit: 50)

//Task 6: Fill in an array of 100 elements by different prime numbers
func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}

func arrayOfPrimeGen(arrLimit: Int) -> Array<Int> {
    var resultedArray: Array<Int> = []
    var counter: Int = 0
    while (resultedArray.count < arrLimit) {
        if (isPrime(counter)) {
            resultedArray.append(counter)
            counter += 1
        } else {
            counter += 1
        }
    }
    return resultedArray
}

let hundredPrimeArr = arrayOfPrimeGen(arrLimit: 100)
print(hundredPrimeArr)
