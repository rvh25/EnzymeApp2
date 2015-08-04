//
//  Level.swift
//  EnzymeApp
//
//  Created by admin on 2/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import Foundation

let NumColumns = 10
let NumRows = 10

class Level {
    private var components = Array2D<Component>(columns: NumColumns, rows: NumRows)

    func componentAtColumn(column: Int, row: Int) -> Component? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return components[column, row]
    }

    func shuffle() -> Set2<Component> {
        //return createInitialComponents()
        var set: Set2 <Component>
        repeat {
            set = createInitialComponents()
            detectPossibleSwaps()
            print("possible swaps: \(possibleSwaps)")
        }
        while possibleSwaps.count == 0
        
        return set
    }

    private func createInitialComponents() -> Set2<Component> {
        var set = Set2<Component>()
    
        //1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
            
                //2
                //var componentType = ComponentType.random()
                var componentType: ComponentType
                repeat {
                componentType = ComponentType.random()
                }
                    
                while (column >= 1 &&
                        components[column - 1, row]?.componentType == componentType)
                    || (row >= 1 &&
                        components[column, row - 1]?.componentType == componentType)
                
                /*while (column >= 2 &&
                        components[column - 1, row]?.componentType == componentType &&
                        components[column - 2, row]?.componentType == componentType)
                    || (row >= 2 &&
                        components[column, row - 1]?.componentType == componentType &&
                        components[column, row - 2]?.componentType == componentType)*/
            
                //3
                let component = Component(column: column, row: row, componentType: componentType)
                components[column, row] = component
            
                //4
                set.addElement(component)

            }
        }
        return set
    }
    
    func performSwap(swap: Swap) {
        let columnA = swap.componentA.column
        let rowA = swap.componentA.row
        let columnB = swap.componentB.column
        let rowB = swap.componentB.row
        
        components[columnA, rowA] = swap.componentB
        swap.componentB.column = columnA
        swap.componentB.row = rowA

        components[columnB, rowB] = swap.componentA
        swap.componentA.column = columnB
        swap.componentA.row = rowB
    }
    
    private var possibleSwaps = Set2<Swap>()
    
    private func hasRxn(component1: Component, component2: Component) -> Bool {
        let type = ComponentType.Enzyme
        var Length = 0
        //for var i = NumColumns - 1; i >= 0 && components[i, row]?.componentType == type; --i, ++horzLength {}
        //for var i = column ; i < NumColumns && components[i, row]?.componentType == type; ++i, ++horzLength {}
        //for var i = component1.column ; i < NumColumns - 1 && component1.componentType == type && component2.componentType != type ; ++i, ++horzLength {}
        //for var i = component1.column ; i < NumColumns - 1 && component1.componentType != type && component2.componentType == type; ++i, ++horzLength {}
        
        if (component1.componentType == type && component2.componentType != type) || (component1.componentType != type && component2.componentType == type) {
            Length = 1
        }
        print("Length: \(Length)")
        return Length == 1
        
        /*print("horzLength: \(horzLength)")
        
        //if horzLength == 1
        //{return true}
        return horzLength == 1*/

    }
    
    /*private func hasRxnAtColumn(component1: Component, component2: Component) -> Bool {
        let type = ComponentType.Enzyme
        var vertLength = 0
        //for var i = NumRows - 1; i >= 0 && components[column, i]?.componentType == type; --i, ++vertLength {}
        //for var i = row ; i < NumRows && components[column, i]?.componentType == type; ++i, ++vertLength {}
        /*for var i = component1.row ; i < NumRows - 1 && component1.componentType == type && component2.componentType != type ; ++i, ++vertLength {}
        for var i = component1.row ; i < NumRows - 1 && component1.componentType != type && component2.componentType == type ; ++i, ++vertLength {}
        
        print("vertLength: \(vertLength)")
        
        return vertLength == 1*/
        
        
    }*/
    
    /*private func hasRxnAtColumn(column: Int, row: Int) -> Bool {
        let type = ComponentType.Enzyme
        let type2 = ComponentType.Substrate
        
        let componentType = components[column, row]!.componentType
        
        var horzLength = 0
        //for var i = NumColumns - 1; i >= 0 && components[i, row]?.componentType == type; --i, ++horzLength {}
        //for var i = column ; i < NumColumns && components[i, row]?.componentType == type; ++i, ++horzLength {}
        for var i = column ; i < NumColumns - 1 && components[i, row]?.componentType == type && components[i + 1, row]?.componentType == type2; ++i, ++horzLength {}
        
        
        print("horzLength: \(horzLength)")
        
        if horzLength == 1
        {return true}
        
        var vertLength = 0
        //for var i = NumRows - 1; i >= 0 && components[column, i]?.componentType == type; --i, ++vertLength {}
        //for var i = row ; i < NumRows && components[column, i]?.componentType == type; ++i, ++vertLength {}
        for var i = row ; i < NumRows - 1 && components[column, i]?.componentType == type && components[column, i + 1]?.componentType == type2; ++i, ++vertLength {}
        
        
        print("vertLength: \(vertLength)")
        
        return vertLength == 1
    }*/
    
    
    /*private func hasRxnAtColumn(column: Int, row: Int) -> Bool {
        let type = ComponentType.Enzyme
        
        
        let componentType = components[column, row]!.componentType
        
        var horzLength = 0
        //for var i = column ; i >= 0 && components[i,row]?.componentType == type; --i, ++horzLength {}
        //for var i = column ; i >= 1 && components[i,row]?.componentType == type; --i, ++horzLength {}
        for var i = column ; i < NumColumns && components[i, row]?.componentType == type; ++i, ++horzLength {}
        if horzLength == 1
        {return true}
        
        var vertLength = 0
        //for var i = row ; i >= 0 && components[column, i]?.componentType == type; --i, ++vertLength {}
        //for var i = row ; i >= 1 && components[column, i]?.componentType == type; --i, ++vertLength {}
        for var i = row ; i < NumRows && components[column, i]?.componentType == type; ++i, ++vertLength {}
        return vertLength == 1
    }*/

    
    func detectPossibleSwaps() {
        var set = Set2<Swap>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = components[column, row] {
                    if column < NumColumns - 1{
                        if let other = components[column + 1, row] {
                            //components[column, row] = other
                            //components[column + 1, row] = component
                            
                            
                            print("component: \(component.column, component.row)")
                            print("other: \(other.column, other.row)")

                            if hasRxn(component, component2: other) {
                                set.addElement(Swap(componentA: component, componentB: other))
                            }
                            
                            
                            /*if hasRxnAtColumn(column + 1, row: row) ||
                                hasRxnAtColumn(column, row: row) {
                                set.addElement(Swap(componentA: component, componentB: other))
                            }*/
                            
                            //components[column,row] = component
                            //components[column + 1, row] = other
                        }
                    }
                    
                    if row < NumRows - 1 {
                        if let other = components[column, row + 1] {
                            //components[column, row] = other
                            //components[column, row + 1] = component
                            
                            
                            print("component: \(component.column, component.row)")
                            print("other: \(other.column, other.row)")
                            
                            if hasRxn(component, component2: other) {
                                set.addElement(Swap(componentA: component, componentB: other))
                            }
                            
                            /*if hasRxnAtColumn(column, row: row + 1) ||
                                hasRxnAtColumn(column, row: row) {
                                set.addElement(Swap(componentA: component, componentB: other))
                            }*/
                            
                            //components[column, row] = component
                            //components[column, row + 1] = other
                        }
                    }
                }
            }
        }
        
        possibleSwaps = set
    }
    
    /*func detectPossibleSwaps() {
        var set = Set2<Swap>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = components[column, row] {
                    if column < NumColumns - 1{
                        if let other = components[column + 1, row] {
                            components[column, row] = other
                            components[column + 1, row] = component
                            
                            
                            print("component: \(component.column, component.row)")
                            print("other: \(other.column, other.row)")
                            
                            
                            if hasRxnAtColumn(column + 1, row: row) ||
                                hasRxnAtColumn(column, row: row) {
                                    set.addElement(Swap(componentA: component, componentB: other))
                            }
                            
                            components[column,row] = component
                            components[column + 1, row] = other
                        }
                    }
                    
                    if row < NumRows - 1 {
                        if let other = components[column, row + 1] {
                            components[column, row] = other
                            components[column, row + 1] = component
                            
                            
                            print("component: \(component.column, component.row)")
                            print("other: \(other.column, other.row)")
                            
                            
                            if hasRxnAtColumn(column, row: row + 1) ||
                                hasRxnAtColumn(column, row: row) {
                                    set.addElement(Swap(componentA: component, componentB: other))
                            }
                            
                            components[column, row] = component
                            components[column, row + 1] = other
                        }
                    }
                }
            }
        }
        
        possibleSwaps = set
    }*/
    
    
    func isPossibleSwap(swap: Swap) -> Bool {
        return possibleSwaps.containsElement(swap)
    }
    
    /*private func detectHorizontalRxns() -> Set<Rxn> {
        var set = Set<Rxn>()
        for row in 0..<NumRows {
            for var column = 0; column < NumColumns - 1; {
                if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    if components[column + 1, row]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Horizontal)
                        do {
                            rxn.addComponent(components[column,row]!)
                            ++column
                        }
                        while column < NumColumns && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                        
                    else if column != 0 && components[column - 1, row]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Horizontal)
                        do {
                            rxn.addComponent(components[column,row]!)
                            ++column
                        }
                        while column < NumColumns && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                }
                ++column
            }
        }
        return set
    }
    
    private func detectVerticalRxns() -> Set<Rxn> {
        var set = Set<Rxn>()
        for column in 0..<NumColumns {
            for var row = 0; row < NumRows - 1; {
                if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    if components[column, row + 1]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Vertical)
                        do {
                            rxn.addComponent(components[column,row]!)
                            ++row
                        }
                        while row < NumRows && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                    
                    else if  row != 0 && components[column, row - 1]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Vertical)
                        do {
                            rxn.addComponent(components[column,row]!)
                            ++row
                        }
                        while row < NumRows && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                }
                ++row
            }
        }
        return set
    }*/
    
    /*private func detectHorizontalRxns() -> Set<Rxn> {
        var set = Set<Rxn>()
        for row in 0..<NumRows {
            for var column = 0; column < NumColumns - 1; {
                if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    if components[column + 1, row]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Horizontal)
                        do {
                            rxn.addComponent(components[column,row]!)
                            ++column
                        }
                            while column < NumColumns && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                        
                    }
                    ++column
                    for var column = 0; column < NumColumns - 1; {
                        if let component = components[column, row] {
                            let rxnType = ComponentType.Enzyme
                    

                        let rxn = Rxn(rxnType: .Horizontal)
                        do {
                            rxn.addComponent(components[column,row]!)
                            --column
                        }
                            while column < NumColumns && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                    --column
                }
            }
        }
        return set
    }
    
    private func detectVerticalRxns() -> Set<Rxn> {
        var set = Set<Rxn>()
        for column in 0..<NumColumns {
            for var row = 0; row < NumRows - 1; {
                if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    if components[column, row + 1]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Vertical)
                        do {
                            rxn.addComponent(components[column,row]!)
                            ++row
                        }
                            while row < NumRows && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                    ++row
                    
        /*for column in 0..<NumColumns {
            for var row = 0; row < NumRows - 1; {
                    if let component = components[column, row] {
                        let rxnType = ComponentType.Enzyme*/
                       
                   if  row != 0 && components[column, row - 1]?.componentType == rxnType {
                        let rxn = Rxn(rxnType: .Vertical)
                        do {
                            rxn.addComponent(components[column,row]!)
                            --row
                        }
                            while row < NumRows && components[column, row]?.componentType == rxnType
                        
                        set.addElement(rxn)
                        continue
                    }
                    --row
                }
            }
        }
        return set
    }*/
    
    
    /*func removeRxns() -> Set<Rxn> {
        let horizontalRxns = detectHorizontalRxns()
        let verticalRxns = detectVerticalRxns()
        
        //println("Horizontal rxns: \(horizontalRxns)")
        //println("Vertical rxns: \(verticalRxns)")
        
        removeComponents(horizontalRxns)
        removeComponents(verticalRxns)
        
        return horizontalRxns.unionSet(verticalRxns)
    }
    
    private func removeComponents(rxns: Set<Rxn>) {
        for rxn in rxns {
            for component in rxn.components {
                components[component.column, component.row] = nil
            }
        }
    }*/
    
    /*func newcomponents() -> [[Component]]{
        var columns = [[Component]]()
        var componentType: ComponentType = .Unknown
        
        for column in 0..<NumColumns {
            var array = [Component]()
            for var row = NumRows - 1; row >= 0 && components[column, row] == nil; --row {
                if [column,row] != nil {
                    var newComponentType: ComponentType
                    do {
                        newComponentType = ComponentType.random()
                    } while newComponentType == componentType
                    componentType = newComponentType
                    let component = Component(column: column, row: row, componentType: componentType)
                    components[column, row] = component
                    array.append(component)
                }
            }
            if !array.isEmpty {
                columns.append(array)
            }
        }
        return columns
    }*/

    
    func removepieces(component1: Component, component2: Component) {
        components[component1.column, component1.row] = nil
        components[component2.column, component2.row] = nil
        
    }
    
    func product(component: Component) {
        components[component.column, component.row] = nil
    }
    
    
    func shufflepieces (component: Component) {
        //for column in 0..<NumColumns {
            //var array = [Component]()
            //for row in 0..<NumRows {
                let col = Int(arc4random_uniform(9))
                let row = Int(arc4random_uniform(9))
                let component = components[col, row]
                //array.append(component!)
            //}
        //}
    }
    
    /*func pieces() -> [[Component]] {
        var columns = [[Component]]()
        
        for column in 0..<NumColumns {
            var array = [Component]()
            for row in 0..<NumRows {
                for first in stride(from: NumColumns - 1, through: 1, by: -1) {
                    let second = Int(arc4random_uniform(UInt32(first + 1)))
                    
                    for third in stride(from: NumRows - 1, through: 1, by: -1) {
                        let fourth = Int(arc4random_uniform(UInt32(third + 1)))
                        let temp = components[first, third]
                        components[first, third] == components[second, fourth]
                        components[second, fourth] = temp
                        
                        array.append(temp!)
                    
                    }
                }
                /*if !array.isEmpty {
                    columns.append(array)
                }*/
            }
        }
        return columns
    }*/
    

    /*private func detectHorizontalRxns() -> Set2<Rxn> {
        var set = Set2<Rxn>()
        for row in 0..<NumRows {
            for var column = 0; column < NumColumns - 1; {
                if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    if component.componentType == rxnType && components[column + 1, row]?.componentType == ComponentType.Substrate {
                        let rxn = Rxn(rxnType: .Horizontal)
                        repeat {
                            rxn.addComponent(components[column,row]!)
                            rxn.addComponent(components[column+1,row]!)
                            ++column
                        }
                            while column < NumColumns && components[column, row]?.componentType == rxnType && components[column + 1, row]?.componentType == ComponentType.Substrate
                        
                        set.addElement(rxn)
                        continue
                        
                    }
                    
                    /*for var column = 0; column < NumColumns - 1; {
                        if let component = components[column, row] {
                            let rxnType = ComponentType.Enzyme
                            
                            
                            let rxn = Rxn(rxnType: .Horizontal)
                            do {
                                rxn.addComponent(components[column,row]!)
                                --column
                            }
                                while column < NumColumns && components[column, row]?.componentType == rxnType
                            
                            set.addElement(rxn)
                            continue
                        }
                        --column
                    }*/
                }
                ++column
            }
            
        }
        return set
    }
    
    private func detectVerticalRxns() -> Set2<Rxn> {
        var set = Set2<Rxn>()
        for column in 0..<NumColumns {
            for var row = 0; row < NumRows - 1; {
                if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    if component.componentType == rxnType && components[column, row + 1]?.componentType == ComponentType.Substrate {
                        let rxn = Rxn(rxnType: .Vertical)
                        repeat {
                            rxn.addComponent(components[column,row]!)
                            rxn.addComponent(components[column,row+1]!)
                            ++row
                        }
                            while row < NumRows && components[column, row]?.componentType == rxnType && components[column, row + 1]?.componentType == ComponentType.Substrate
                            
                        set.addElement(rxn)
                        continue
                        }
                    
                        
                        /*for column in 0..<NumColumns {
                        for var row = 0; row < NumRows - 1; {
                        if let component = components[column, row] {
                        let rxnType = ComponentType.Enzyme*/
                        
                        /*if  row != 0 && components[column, row - 1]?.componentType == rxnType {
                            let rxn = Rxn(rxnType: .Vertical)
                            do {
                                rxn.addComponent(components[column,row]!)
                                --row
                            }
                                while row < NumRows && components[column, row]?.componentType == rxnType
                            
                            set.addElement(rxn)
                            continue
                        }
                        --row
                    }*/
                }
                ++row
            }
            
        }
        return set
    }*/
    
    private func detectHorizontalRxns() -> Set2<Rxn> {
        var set = Set2<Rxn>()
        for row in 0..<NumRows {
            for var column = 0; column < NumColumns - 1; {
                if let component = components[column, row] {
                    let matchType = ComponentType.Enzyme
                    if (component.componentType == matchType && components[column + 1, row]?.componentType == ComponentType.Substrate) || (component.componentType == matchType && components[column - 1, row]?.componentType == ComponentType.Substrate) {
                        let rxn = Rxn(rxnType: .Horizontal)
                        /*repeat {
                            rxn.addComponent(components[column,row]!)
                            //rxn.addComponent(components[column+1,row]!)
                            ++column
                        }
                            while column < NumColumns && components[column, row]?.componentType == matchType && components[column + 1, row]?.componentType == ComponentType.Substrate*/
                        
                        set.addElement(rxn)
                        continue
                        
                    }
                    
                    /*for var column = 0; column < NumColumns - 1; {
                    if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme
                    
                    
                    let rxn = Rxn(rxnType: .Horizontal)
                    do {
                    rxn.addComponent(components[column,row]!)
                    --column
                    }
                    while column < NumColumns && components[column, row]?.componentType == rxnType
                    
                    set.addElement(rxn)
                    continue
                    }
                    --column
                    }*/
                }
                ++column
            }
            
        }
        return set
    }
    
    private func detectVerticalRxns() -> Set2<Rxn> {
        var set = Set2<Rxn>()
        for column in 0..<NumColumns {
            for var row = 0; row < NumRows - 1; {
                if let component = components[column, row] {
                    let matchType = ComponentType.Enzyme
                    if component.componentType == matchType && components[column, row + 1]?.componentType == ComponentType.Substrate {
                        let rxn = Rxn(rxnType: .Vertical)
                        /*repeat {
                            rxn.addComponent(components[column,row]!)
                            rxn.addComponent(components[column,row+1]!)
                            ++row
                        }
                            while row < NumRows && components[column, row]?.componentType == /Users/rohainehsu/Documents/EnzymeApp-master/EnzymeApp/GameViewController.swiftmatchType && components[column, row + 1]?.componentType == ComponentType.Substrate*/
                        
                        set.addElement(rxn)
                        continue
                    }
                    
                    
                    /*for column in 0..<NumColumns {
                    for var row = 0; row < NumRows - 1; {
                    if let component = components[column, row] {
                    let rxnType = ComponentType.Enzyme*/
                    
                    /*if  row != 0 && components[column, row - 1]?.componentType == rxnType {
                    let rxn = Rxn(rxnType: .Vertical)
                    do {
                    rxn.addComponent(components[column,row]!)
                    --row
                    }
                    while row < NumRows && components[column, row]?.componentType == rxnType
                    
                    set.addElement(rxn)
                    continue
                    }
                    --row
                    }*/
                }
                ++row
            }
            
        }
        return set
    }


    func removeRxns() -> Set2<Rxn> {
        let horizontalRxns = detectHorizontalRxns()
        let verticalRxns = detectVerticalRxns()
        
        removeComponents(horizontalRxns)
        removeComponents(verticalRxns)
        return horizontalRxns.unionSet(verticalRxns)
    }
    
    private func removeComponents(rxns: Set2<Rxn>) {
        for rxn in rxns {
            for component in rxn.components {
                components[component.column, component.row] = nil
            }
        }
    }
    

}