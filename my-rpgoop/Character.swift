//
//  Character.swift
//  my-rpgoop
//
//  Created by DANIEL OREILLY on 12/17/15.
//  Copyright © 2015 DANIEL OREILLY. All rights reserved.
//

import Foundation

class Character {
    private var _hp:  Int = 100 // hp health points
    private var _attackPwr = 10 // attackPwr attack power
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {

        self._hp -= attackPwr
        return true
    }
    
    
}
