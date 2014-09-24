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
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow){
                println("Flush")
                winnings++
                flushWinCount++
            }
            if checkThreeInARow(slotRow){
                println("Three in a Row")
                winnings++
                straightWinCount++
            }
            if checkThreeOfAKind(slotRow){
                println("Three of a Kind")
                winnings += 3
                threeOfAKindWinCount++
            }
        }
        
        if 3 == flushWinCount {
            println("Royal Flush")
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
}