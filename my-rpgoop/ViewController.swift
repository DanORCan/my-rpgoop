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
    
    var lancelot: Soldier!
    var ghorzu: Orc!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lancelot = Soldier(name: "Lancelot", hp: 110, attackPwr: 20)
        ghorzu = Orc(name: "Ghorzu", hp: 130, attackPwr: 30)
        
        lblHpR.text = "\(lancelot.name)  \(lancelot.hp) HP"
        lblInvR.text = listInventory(lancelot.inventory)

        lblHpL.text = "\(ghorzu.name)  \(ghorzu.hp) HP"
        lblInvL.text = listInventory(ghorzu.inventory)

    
    }

    func listInventory(inventory:[String]) ->String {
        var list = ""
        for item in inventory {
            list += "\(item) \n"
        }
        return list
    }

}

