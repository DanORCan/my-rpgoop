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
    
    @IBOutlet weak var restartBtn: UIButton!
    
    @IBOutlet weak var orcAttackBtn: UIButton!
    
    @IBOutlet weak var soldierAttackBtn: UIButton!
    
    var soldier: Soldier!
    var orc: Orc!
    var timer1 = NSTimer()
    var timer2 = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startGame()
                
    }

    @IBAction func orcAttackBtn(sender: AnyObject) {
        if soldier.attemptAttack(orc.attackPwr) {
            displayResLbl.text = "\(orc.name) attacked \(soldier.name) for \(orc.attackPwr) HP"

            timer1 = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector: "soldierAttackBtnHide", userInfo: nil, repeats: false)
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: "soldierAttackBtnReveal", userInfo: nil, repeats: false)
            
            dispCharacters()
        }
        if !soldier.isAlive {
            timer1.invalidate()
            timer2.invalidate()
            displayResLbl.text = "Combat Over ... \(orc.name) Won 👍"
            lblHpR.text = "\(soldier.name)\n 0 HP"
            dispMiscButtons()
            if !(soldier.giveUpInventory() == nil) {
                orc.addItemToInventory(soldier.giveUpInventory()!)
                dispInventory()
                
            }
            
        }
    }
    
    @IBAction func soldierAttackBtn(sender: AnyObject) {
        
        if orc.attemptAttack(soldier.attackPwr) {
            displayResLbl.text = "\(soldier.name) attacked \(orc.name) for \(soldier.attackPwr) HP"

            timer1 = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector: "orcAttackBtnHide", userInfo: nil, repeats: false)
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: "orcAttackBtnReveal", userInfo: nil, repeats: false)
           
            dispCharacters()
        }
        if !orc.isAlive {
            timer1.invalidate()
            timer2.invalidate()
            displayResLbl.text = "Combat Over ... \(soldier.name) Won 👍"
            lblHpL.text = "\(orc.name)\n 0 HP"
            dispMiscButtons()
            if !(orc.giveUpInventory() == nil) {
                soldier.addItemToInventory(orc.giveUpInventory()!)
                dispInventory()
            }
        }
    }

    @IBAction func resetGame(sender: AnyObject) {
        startGame()
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
    
    func dispMiscButtons() {
        restartBtn.hidden = false
        orcAttackBtn.hidden = true
        soldierAttackBtn.hidden = true
        lblAttackL.hidden = true
        lblAttackR.hidden = true
    }
    
    func soldierAttackBtnHide() {
        soldierAttackBtn.hidden = true
        lblAttackR.hidden = true
    }
    
    func soldierAttackBtnReveal() {
        soldierAttackBtn.hidden = false
        lblAttackR.hidden = false
    }

    func orcAttackBtnHide() {
        orcAttackBtn.hidden = true
        lblAttackL.hidden = true
    }
    
    func orcAttackBtnReveal() {
        orcAttackBtn.hidden = false
        lblAttackL.hidden = false
    }

    
    func startGame() {
        
        displayResLbl.text = "Game On"

        soldier = Soldier(name: "Lancelot", hp: 110, attackPwr: 20)
        orc = Orc(name: "Ghorzu", hp: 130, attackPwr: 30)
        
        dispCharacters()
        dispInventory()
        
        restartBtn.hidden = true
        orcAttackBtn.hidden = false
        soldierAttackBtn.hidden = false
        lblAttackL.hidden = false
        lblAttackR.hidden = false
    }

}

