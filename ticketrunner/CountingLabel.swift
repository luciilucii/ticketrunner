//
//  CountingLabel.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 01.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class CountingLabel: UILabel {
    
    let counterVelocity: Float = 3.0
    
    enum CounterAnimationType {
        case Linear
        case EaseIn
        case EaseOut
    }
    
    enum CounterType {
        case Int
        case Float
        case TicketPoints
    }
    
    var startNumber: Float = 0.0
    var endNumber: Float = 0.0
    
    var progress: TimeInterval!
    var duration: TimeInterval!
    var lastUpdate: TimeInterval!
    
    var timer: Timer?
    
    var counterType: CounterType!
    var counterAnimationType: CounterAnimationType?
    
    var currentCounterValue: Float {
        if progress >= duration {
            return endNumber
        }
        
        let percentage = Float(progress / duration)
        let update = updateCounter(counterValue: percentage)
        
        return startNumber + (update * (endNumber - startNumber))
    }
    
    func count(fromValue: Float, to toValue: Float, withDuration duration: TimeInterval, animationType: CounterAnimationType, counterType: CounterType) {
        self.startNumber = fromValue
        self.endNumber = toValue
        self.duration = duration
        
        self.counterType = counterType
        self.counterAnimationType = animationType
        self.progress = 0
        self.lastUpdate = Date.timeIntervalSinceReferenceDate
        
        invalidateTimer()
        
        if duration == 0 {
            updateText(value: toValue)
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateValue), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateValue() {
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        if progress >= duration {
            invalidateTimer()
            progress = duration
        }
        
        //update text in label
        updateText(value: currentCounterValue)
    }
    
    func updateText(value: Float) {
        switch counterType! {
        case .Int:
            self.text = "\(Int(value))"
        case .Float:
            self.text = String(format: "%.2f", value)
        case .TicketPoints:
            self.text = formatInt(int: Int(value))
        }
    }
        
    func updateCounter(counterValue: Float) -> Float {
        switch counterAnimationType! {
        case .Linear:
            return counterValue
        case .EaseIn:
            return powf(counterValue, counterVelocity)
        case .EaseOut:
            return (1.0 - powf(1.0 - counterValue, counterVelocity))
        }
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func formatInt(int: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale.current
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = "."
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: int)) else { return "" }
        return "\(formattedNumber)°"
    }
    
}












