//
//  GumballMachine.swift
//  PatternState
//
//  Created by Lee on 2017. 9. 19..
//  Copyright © 2017년 LEE. All rights reserved.
//

import Foundation

class GumballMachine {
    
    var soldOutState: State!
    var noQuarterState: State!
    var hasQuarterState: State!
    var soldState: State!
    
    private(set) var state: State!
    private(set) var count: Int
    
    init(numberGumballs: Int) {
        
        count = numberGumballs

        soldOutState = SoldOutState(gumballMachine: self)
        noQuarterState = NoQuarterState(gumballMachine: self)
        hasQuarterState = HasQuarterState(gumballMachine: self)
        soldState = SoldState(gumballMachine: self)
        
        if numberGumballs > 0 {
            state = noQuarterState
        } else {
            state = soldOutState
        }
    }
    
    func insertQuarter() {
        state.insertQuarter()
    }
    
    func ejectQuarter() {
        state.ejectQuarter()
    }
    
    func turnCrank() {
        state.turnCrank()
        state.dispense()
    }
    
    func changedState(state: State) {
        self.state = state
    }
    
    func releaseBall() {
        print("A gumball comes rolling out the slot..")
        if count != 0 {
            count -= 1
        }
    }
    
    func printDescription() -> String {
        return "게임 머신 남은 개수 : \(count)"
    }
}
