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
        
        lblHpR.text = "\(soldier.name)\n\(soldier.hp) HP"
        lblInvR.text = listInventory(soldier.inventory)

        lblHpL.text = "\(orc.name)\n\(orc.hp) HP"
        lblInvL.text = listInventory(orc.inventory)
    }

    @IBAction func orcAttackBtn(sender: AnyObject) {
        if soldier.attemptAttack(orc.attackPwr) {
            displayResLbl.text = "\(orc.name) attacked \(soldier.name) for \(orc.attackPwr) HP"
            
            lblHpR.text = "\(soldier.name)\n\(soldier.hp) HP"
            
            
        }
    }
    
    @IBAction func soldierAttackBtn(sender: AnyObject) {
        
        if orc.attemptAttack(soldier.attackPwr) {
            displayResLbl.text = "\(soldier.name) attacked \(orc.name) for \(soldier.attackPwr) HP"
            
            lblHpL.text = "\(orc.name)\n\(orc.hp) HP"
            
        }
    }

    
    func listInventory(inventory:[String]) ->String {
        var list = "\n"
        for item in inventory {
            list += "\(item) \n"
        }
        return list
    }

}

