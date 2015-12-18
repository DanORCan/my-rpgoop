//
//  Orc.swift
//  my-rpgoop
//
//  Created by DANIEL OREILLY on 12/17/15.
//  Copyright © 2015 DANIEL OREILLY. All rights reserved.
//

import Foundation

class Orc: Character {
    private var _name = "Soldier"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory: [String] = ["club","knife","shield"]  //basic inventory
    
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
    
}