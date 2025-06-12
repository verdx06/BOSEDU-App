//
//  OTPViewModel.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 04.06.2025.
//

import Foundation

final class OTPViewModel: ObservableObject {
    
    let useCase: OTPUseCase
    @Published var code: [String] = Array(repeating: "", count: 4)
    @Published var isFocuse: Int?
    @Published var seconds = 120
    var timer: Timer?
    
    init(useCase: OTPUseCase) {
        self.useCase = useCase
    }
    
    func handleOTPChange(index: Int, newValue: String) {
        if code[index].count > 1 {
            code[index] = String(newValue.suffix(1))
        }
        if !newValue.isEmpty {
            isFocuse = (index == 3) ? nil : index + 1
        } else {
            isFocuse = max(0, index - 1)
        }
    }
    
    
    func startTimerForResend() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.seconds > 0 {
                self.seconds -= 1
            }
        })
    }
    
}
