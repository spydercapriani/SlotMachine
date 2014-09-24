//
//  Factory.swift
//  SlotMachine
//
//  Created by Daniel Gilbert on 9/23/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    
    class func createSlots() -> [[Slot]] {
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        
        var slots:[[Slot]] = []
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            var slotArray:[Slot] = []
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                var slot = Factory.createSlot(slotArray)
                slotArray.append(slot)
            }
            slots.append(slotArray)
        }
        return slots
    }
    
    class func createSlot(currentCards:[Slot]) -> Slot {
        var currentCardValues:[Int] = []
        
        for card in currentCards {
            currentCardValues.append(card.value)
        }
        var randomNumber:Int
        do {
            randomNumber = Int(arc4random_uniform(52))
            
        } while contains(currentCardValues, randomNumber + 1)
        
        
        var slot:Slot
        switch randomNumber {
        case 0:
            slot = Slot(value: 1, image: UIImage(named: "AC"), isRed: false, suite: "Clubs")
        case 1:
            slot = Slot(value: 2, image: UIImage(named: "2C"), isRed: false, suite: "Clubs")
        case 2:
            slot = Slot(value: 3, image: UIImage(named: "3C"), isRed: false, suite: "Clubs")
        case 3:
            slot = Slot(value: 4, image: UIImage(named: "4C"), isRed: false, suite: "Clubs")
        case 4:
            slot = Slot(value: 5, image: UIImage(named: "5C"), isRed: false, suite: "Clubs")
        case 5:
            slot = Slot(value: 6, image: UIImage(named: "6C"), isRed: false, suite: "Clubs")
        case 6:
            slot = Slot(value: 7, image: UIImage(named: "7C"), isRed: false, suite: "Clubs")
        case 7:
            slot = Slot(value: 8, image: UIImage(named: "8C"), isRed: false, suite: "Clubs")
        case 8:
            slot = Slot(value: 9, image: UIImage(named: "9C"), isRed: false, suite: "Clubs")
        case 9:
            slot = Slot(value: 10, image: UIImage(named: "10C"), isRed: false, suite: "Clubs")
        case 10:
            slot = Slot(value: 11, image: UIImage(named: "JC"), isRed: false, suite: "Clubs")
        case 11:
            slot = Slot(value: 12, image: UIImage(named: "QC"), isRed: false, suite: "Clubs")
        case 12:
            slot = Slot(value: 13, image: UIImage(named: "KC"), isRed: false, suite: "Clubs")
        case 13:
            slot = Slot(value: 1, image: UIImage(named: "AS"), isRed: false, suite: "Spades")
        case 14:
            slot = Slot(value: 2, image: UIImage(named: "2S"), isRed: false, suite: "Spades")
        case 15:
            slot = Slot(value: 3, image: UIImage(named: "3S"), isRed: false, suite: "Spades")
        case 16:
            slot = Slot(value: 4, image: UIImage(named: "4S"), isRed: false, suite: "Spades")
        case 17:
            slot = Slot(value: 5, image: UIImage(named: "5S"), isRed: false, suite: "Spades")
        case 18:
            slot = Slot(value: 6, image: UIImage(named: "6S"), isRed: false, suite: "Spades")
        case 19:
            slot = Slot(value: 7, image: UIImage(named: "7S"), isRed: false, suite: "Spades")
        case 20:
            slot = Slot(value: 8, image: UIImage(named: "8S"), isRed: false, suite: "Spades")
        case 21:
            slot = Slot(value: 9, image: UIImage(named: "9S"), isRed: false, suite: "Spades")
        case 22:
            slot = Slot(value: 10, image: UIImage(named: "10S"), isRed: false, suite: "Spades")
        case 23:
            slot = Slot(value: 11, image: UIImage(named: "JS"), isRed: false, suite: "Spades")
        case 24:
            slot = Slot(value: 12, image: UIImage(named: "QS"), isRed: false, suite: "Spades")
        case 25:
            slot = Slot(value: 13, image: UIImage(named: "KS"), isRed: false, suite: "Spades")
        case 26:
            slot = Slot(value: 1, image: UIImage(named: "AD"), isRed: true, suite: "Diamonds")
        case 27:
            slot = Slot(value: 2, image: UIImage(named: "2D"), isRed: true, suite: "Diamonds")
        case 28:
            slot = Slot(value: 3, image: UIImage(named: "3D"), isRed: true, suite: "Diamonds")
        case 29:
            slot = Slot(value: 4, image: UIImage(named: "4D"), isRed: true, suite: "Diamonds")
        case 30:
            slot = Slot(value: 5, image: UIImage(named: "5D"), isRed: true, suite: "Diamonds")
        case 31:
            slot = Slot(value: 6, image: UIImage(named: "6D"), isRed: true, suite: "Diamonds")
        case 32:
            slot = Slot(value: 7, image: UIImage(named: "7D"), isRed: true, suite: "Diamonds")
        case 33:
            slot = Slot(value: 8, image: UIImage(named: "8D"), isRed: true, suite: "Diamonds")
        case 34:
            slot = Slot(value: 9, image: UIImage(named: "9D"), isRed: true, suite: "Diamonds")
        case 35:
            slot = Slot(value: 10, image: UIImage(named: "10D"), isRed: true, suite: "Diamonds")
        case 36:
            slot = Slot(value: 11, image: UIImage(named: "JD"), isRed: true, suite: "Diamonds")
        case 37:
            slot = Slot(value: 12, image: UIImage(named: "QD"), isRed: true, suite: "Diamonds")
        case 38:
            slot = Slot(value: 13, image: UIImage(named: "KD"), isRed: true, suite: "Diamonds")
        case 39:
            slot = Slot(value: 1, image: UIImage(named: "AH"), isRed: true, suite: "Hearts")
        case 40:
            slot = Slot(value: 2, image: UIImage(named: "2H"), isRed: true, suite: "Hearts")
        case 41:
            slot = Slot(value: 3, image: UIImage(named: "3H"), isRed: true, suite: "Hearts")
        case 42:
            slot = Slot(value: 4, image: UIImage(named: "4H"), isRed: true, suite: "Hearts")
        case 43:
            slot = Slot(value: 5, image: UIImage(named: "5H"), isRed: true, suite: "Hearts")
        case 44:
            slot = Slot(value: 6, image: UIImage(named: "6H"), isRed: true, suite: "Hearts")
        case 45:
            slot = Slot(value: 7, image: UIImage(named: "7H"), isRed: true, suite: "Hearts")
        case 46:
            slot = Slot(value: 8, image: UIImage(named: "8H"), isRed: true, suite: "Hearts")
        case 47:
            slot = Slot(value: 9, image: UIImage(named: "9H"), isRed: true, suite: "Hearts")
        case 48:
            slot = Slot(value: 10, image: UIImage(named: "10H"), isRed: true, suite: "Hearts")
        case 49:
            slot = Slot(value: 11, image: UIImage(named: "JH"), isRed: true, suite: "Hearts")
        case 50:
            slot = Slot(value: 12, image: UIImage(named: "QH"), isRed: true, suite: "Hearts")
        case 51:
            slot = Slot(value: 13, image: UIImage(named: "KH"), isRed: true, suite: "Hearts")
            
        default:
            slot = Slot(value: 0, image: UIImage(named:"Joker"), isRed: false, suite: "Joker")
            println("createSlot: Default Case has evaluated")
        }
        return slot
    }
    
    private class func buildDeck() {
        
    }
}