//
//  image_details_view_model.swift
//  picmore_ios
//
//  Created by istajcer on 06.08.2022..
//

import Foundation

class ImageDetailsViewModel: ObservableObject {
    @Published var fibonacciNumber: Int = 0;
    private let fibonacciCounter = ExpensiveFibonacciCounter()
    
    func calculateNumber() {
        DispatchQueue.main.async {
            Task {
                let number = 30
                let start = CFAbsoluteTimeGetCurrent()
                print("Calculating fibonacci for \(number)")
                let result = await self.fibonacciCounter.calculcateFibonacciFor(number: number)
                let diff = CFAbsoluteTimeGetCurrent() - start
                print("Execution time: \(diff)")
                self.fibonacciNumber = result
            }
        }
    }
}
