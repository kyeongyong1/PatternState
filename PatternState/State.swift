//
//  State.swift
//  PatternState
//
//  Created by Lee on 2017. 9. 19..
//  Copyright © 2017년 LEE. All rights reserved.
//

import Foundation

protocol State {
    
    func insertQuarter()
    func ejectQuarter()
    func turnCrank()
    func dispense()
}

class NoQuarterState: State {
    
    let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("동전을 넣으셨습니다.")
        gumballMachine.changedState(state: gumballMachine.hasQuarterState)
    }
    
    func ejectQuarter() {
        print("동전을 넣어주세요.")
    }

    func turnCrank() {
        print("동전을 넣어주세요.")
    }
    
    func dispense() {
        print("동전을 넣어주세요.")
    }
}

class SoldOutState: State {
    
    let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("죄송합니다. 매진되었습니다.")
    }
    
    func ejectQuarter() {
        print("죄송합니다. 매진되었습니다.")
    }
    
    func turnCrank() {
        print("죄송합니다. 매진되었습니다.")
    }
    
    func dispense() {
        print("알맹이가 나갈 수 없습니다.")
    }
}

class HasQuarterState: State {
    
    let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("동전은 한 개만 넣어주세요.")
    }
    
    func ejectQuarter() {
        print("동전이 반환됩니다.")
        gumballMachine.changedState(state: gumballMachine.noQuarterState)
    }
    
    func turnCrank() {
        print("손잡이를 돌리셨습니다.")
        gumballMachine.changedState(state: gumballMachine.soldState)
    }
    
    func dispense() {
        print("알맹이가 나갈 수 없습니다.")
    }
}

class SoldState: State {
    
    let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("잠깐만 기다려 주세요. 알맹이가 나가고 있습니다.")
    }
    
    func ejectQuarter() {
        print("이미 알맹이를 뽑으셨습니다.")
    }
    
    func turnCrank() {
        print("손잡이는 한 번만 돌려주세요.")
    }
    
    func dispense() {
        gumballMachine.releaseBall()
        if gumballMachine.count > 0 {
            gumballMachine.changedState(state: gumballMachine.noQuarterState)
        } else {
            print("Oops, out of gumballs!")
            gumballMachine.changedState(state: gumballMachine.soldOutState)
        }
    }
    
}
