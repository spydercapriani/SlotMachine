//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Daniel Gilbert on 9/24/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func computeWinnings(slots:[[Slot]]) -> Int {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        
        var winnings = 0
        var flushWinCount = 0
        var royalFlushWinCount = 0
        var straightFlushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkRoyalFlush(slotRow){
                print("Royal Flush \t")
                winnings += 30
                royalFlushWinCount++
                straightFlushWinCount++
                flushWinCount++
            }else if checkStraightFlush(slotRow){
                print("Straight Flush \t")
                winnings += 15
                straightFlushWinCount++
                straightWinCount++
                flushWinCount++
            }else{
                if checkFlush(slotRow){
                    print("Flush \t")
                    winnings++
                    flushWinCount++
                }
                
                if checkThreeInARow(slotRow){
                    print("Three in a Row \t")
                    winnings++
                    straightWinCount++
                }
                
                if checkThreeOfAKind(slotRow){
                    print("Three of a Kind \t")
                    winnings += 3
                    threeOfAKindWinCount++
                }
                if !checkThreeOfAKind(slotRow) && !checkThreeInARow(slotRow) && !checkFlush(slotRow){
                    print("Lost \t")
                }
            }
            println()
        }
        
        if 3 == royalFlushWinCount {
            println("Royally Flushed!")
            winnings += 5000
        }
        if 3 == straightFlushWinCount {
            println("George Straight")
        }
        if 3 == flushWinCount {
            println("Completely Flushed")
            winnings += 15
        }
        if 3 == straightWinCount {
            println("Epic Straight")
            winnings += 1000
        }
        if 3 == threeOfAKindWinCount {
            println("Three's all around")
            winnings += 50
        }
        return winnings
    }
    
    class func unpackSlotsIntoSlotRows(slots:[[Slot]]) -> [[Slot]] {
        var slotRow:[Slot] = []
        var slotRow2:[Slot] = []
        var slotRow3:[Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                
                switch index {
                case 0:
                    slotRow.append(slot)
                case 1:
                    slotRow2.append(slot)
                case 2:
                    slotRow3.append(slot)
                default:
                    println("SlotBrain: Error - Default Case is Running")
                }
            }
        }
        
        var slotInRows:[[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotInRows
    }
    
    // Helpers
    class func checkRoyalFlush(slotRow:[Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if checkFlush(slotRow) { // make sure all are same color first
            if checkThreeInARow(slotRow){
                if checkSameSuite(slotRow) {
                    if slot1.value == 12 && slot2.value == 13 && slot3.value == 1 { // Q K A
                        return true
                    }else if slot1.value == 1 && slot2.value == 13 && slot3.value == 12 { // A K Q
                        return true
                    }else{
                        return false
                    }
                }else{
                    return false
                }
            }else{
                return false
            }
        }else{
            return false
        }
    }
    
    class func checkStraightFlush(slotRow:[Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if checkFlush(slotRow) { // make sure all are same color first
            if checkThreeInARow(slotRow){
                if checkSameSuite(slotRow) {
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        }else{
            return false
        }
    }
    
    class func checkFlush(slotRow:[Slot]) -> Bool { // only checks based on color
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }else{
            return false
        }
    }
    
    class func checkThreeInARow(slotRow:[Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2{
            return true
        }else {
            return false
        }
    }
    
    class func checkThreeOfAKind(slotRow:[Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }else {
            return false
        }
    }
    
    class func checkSameSuite(slotRow:[Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.suite == slot2.suite && slot1.suite == slot3.suite {
            return true
        }else {
            return false
        }
    }
}