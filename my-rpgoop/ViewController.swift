//
//  ViewController.swift
//  my-rpgoop
//
//  Created by DANIEL OREILLY on 12/14/15.
//  Copyright © 2015 DANIEL OREILLY. All rights reserved.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblAttackL: UILabel!
    
    @IBOutlet weak var lblHpL: UILabel!
    
    @IBOutlet weak var lblInvL: UILabel!
    
    @IBOutlet weak var lblAttackR: UILabel!
    
    @IBOutlet weak var lblHpR: UILabel!
    
    @IBOutlet weak var lblInvR: UILabel!
    
    @IBOutlet weak var displayResLbl: UILabel!
    
    var soldier: Soldier!
    var orc: Orc!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soldier = Soldier(name: "Lancelot", hp: 110, attackPwr: 20)
        orc = Orc(name: "Ghorzu", hp: 130, attackPwr: 30)
        
        dispCharacters()
        dispInventory()
        
    }

    @IBAction func orcAttackBtn(sender: AnyObject) {
        if soldier.attemptAttack(orc.attackPwr) {
            displayResLbl.text = "\(orc.name) attacked \(soldier.name) for \(orc.attackPwr) HP"
            
            dispCharacters()
        }
        if !soldier.isAlive {
            displayResLbl.text = "Combat Over ... \(orc.name) Won 👍"
            lblHpR.text = "\(soldier.name)\n 0 HP"
        }
    }
    
    @IBAction func soldierAttackBtn(sender: AnyObject) {
        
        if orc.attemptAttack(soldier.attackPwr) {
            displayResLbl.text = "\(soldier.name) attacked \(orc.name) for \(soldier.attackPwr) HP"
            
            dispCharacters()
        }
        if !orc.isAlive {
            displayResLbl.text = "Combat Over ... \(soldier.name) Won 👍"
            lblHpL.text = "\(orc.name)\n 0 HP"
        }
    }

    
    func listInventory(inventory:[String]) ->String {
        var list = "\n"
        for item in inventory {
            list += "\(item) \n"
        }
        return list
    }
    
    func dispCharacters() {
        lblHpR.text = "\(soldier.name)\n\(soldier.hp) HP"
        lblHpL.text = "\(orc.name)\n\(orc.hp) HP"
    }
    
    func dispInventory() {
        lblInvR.text = listInventory(soldier.inventory)
        lblInvL.text = listInventory(orc.inventory)
    }

}

