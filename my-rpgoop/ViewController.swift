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
        
        lblHpR.text = "\(lancelot.name)  \(lancelot.hp) HP"
        lblInvR.text = "\(lancelot.inventory)"

    
    }


}

