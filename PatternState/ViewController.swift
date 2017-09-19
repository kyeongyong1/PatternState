//
//  ViewController.swift
//  PatternState
//
//  Created by Lee on 2017. 9. 19..
//  Copyright © 2017년 LEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gumballMachine = GumballMachine(numberGumballs: 5)
        
        print(gumballMachine.printDescription())
        
        gumballMachine.insertQuarter()
        gumballMachine.turnCrank()
        
        print(gumballMachine.printDescription())
        
        gumballMachine.insertQuarter()
        gumballMachine.turnCrank()
        gumballMachine.insertQuarter()
        gumballMachine.turnCrank()
        
        print(gumballMachine.printDescription())
    }
    
}

