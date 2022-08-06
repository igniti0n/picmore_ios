//
//  expensive_fibonacci_counter.swift
//  picmore_ios
//
//  Created by istajcer on 06.08.2022..
//

class ExpensiveFibonacciCounter {
    func calculcateFibonacciFor(number: Int) async -> Int {
        await withCheckedContinuation { contination in
            let result = calculate(number: number)
            contination.resume(returning: result)
        }
    }
    
    private func calculate(number: Int) -> Int {
        if (number <= 1) {
            return 1;
        }
        let leftNumber = calculate(number: number - 1);
        let rightNumber = calculate(number: number - 2);
        return leftNumber + rightNumber;
    }
}



