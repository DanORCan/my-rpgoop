//
//  Soldier.swift
//  my-rpgoop
//
//  Created by DANIEL OREILLY on 12/17/15.
//  Copyright © 2015 DANIEL OREILLY. All rights reserved.
//

import Foundation

class Soldier: Character {
    private var _name = "Soldier"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory: [String] = ["diamond","wine"]  //basic inventory

    var inventory: [String] {
        return _inventory
    }
   
   
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        _name = name
    }

    func giveUpInventory() -> String? {
        
        if !isAlive {
            
            let rand = Int(arc4random_uniform(UInt32(inventory.count)))
            return inventory[rand]
        }
        
        return nil
    }
    
}
