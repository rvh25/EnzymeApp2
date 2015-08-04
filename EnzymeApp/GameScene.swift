//
//  GameScene.swift
//  EnzymeApp
//
//  Created by admin on 2/22/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
}
    
    override init(size: CGSize) {
        super.init(size: size)

        anchorPoint = CGPoint(x: 0.5, y: 0.5)

        //let background = SKSpriteNode(imageNamed: "Background")
        //addChild(background)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth*CGFloat(NumColumns)/2,
            y: -TileHeight*CGFloat(NumRows)/2)
        
        componentsLayer.position = layerPosition
        gameLayer.addChild(componentsLayer)
        
        swipeFromColumn = nil
        swipeFromRow = nil
        
    }

    //override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
      //  let touch = touches.anyObject() as! UITouch
        
    /*override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as! UITouch
        
        let location = touch.locationInNode(componentsLayer)
        /*let (success, column, row) = convertPoint(location)
        if success {
            if let component = level.componentAtColumn(column, row: row) {
                swipeFromColumn = column
                swipeFromRow = row
            }
        }*/
        self.direction()
    }*/
    
    
    //override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    /*func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /*for touch in touches {
            let location = touch.locationInNode(componentsLayer)
        }*/
        
        
        //if let touch = touches {
        //super.touchesBegan(touches, withEvent: event)
        
        //let location = touch.locationInNode(componentsLayer)
        
        self.direction()
        
        //}
        //super.touchesBegan(touches, withEvent: event)
    }*/
    
    /*override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.direction()
    }*/
    
    /*override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.direction()
    }*/
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //self.enzymes()
        self.direction()
        //self.substrates()
    }
    
    /*func substrates() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    if component.componentType == ComponentType.Substrate {
                        self.direction()
                    }
                }
            }
        }
    }*/
    
    func substrates() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    repeat {
                        self.direction()
                    }
                    //while (component.componentType == ComponentType.Substrate)
                    
                    while (component.componentType == ComponentType.Substrate)
                        || (component.componentType == ComponentType.Enzyme)
                }
            }
        }
    }
    
    func enzymes() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    repeat {
                        self.direction()
                    }
                        while (component.componentType == ComponentType.Substrate)
                        
                        //while component.componentType == ComponentType.Enzyme
                    
                }
            }
        }
    }

    func direction() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                swipeFromColumn = column
                swipeFromRow = row
                
                var horzDelta = 0, vertDelta = 0
                if row == 0 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                
                if row == NumRows - 1 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                
                if row == 0 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                
                if row == NumRows - 1 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                    
                else if row == 0 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                    
                else if row == NumRows - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                    
                else if column == 0 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                    
                else if column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
                    
                else {
                    let dataConverter = Int(arc4random_uniform(4)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    else if dataConverter == 4 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                    //self.substrates()
                }
            }
        }
    }
    
    
    /*func direction() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                swipeFromColumn = column
                swipeFromRow = row
                
                var horzDelta = 0, vertDelta = 0
                if row == 0 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }

                if row == NumRows - 1 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }

                if row == 0 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }

                if row == NumRows - 1 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                else if row == 0 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }

                else if row == NumRows - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                    vertDelta = -1
                }
            
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }

                else if column == 0 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                else if column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                else {
                    let dataConverter = Int(arc4random_uniform(4)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    else if dataConverter == 4 {
                        vertDelta = 1
                    }
                
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
            }
        }
    }*/
        
        /*for row in 0..<NumRows {
            for column in 0..<NumColumns {
            swipeFromColumn = column
            swipeFromRow = row
            
            var horzDelta = 0, vertDelta = 0
            var dataConverter = Int(arc4random_uniform(4)+1)
            if dataConverter == 1 {
                horzDelta = -1
            }
            else if dataConverter == 2 {
                horzDelta = 1
            }
            else if dataConverter == 3 {
                vertDelta = -1
            }
            else if dataConverter == 4 {
                vertDelta = 1
            }
            
            trySwapHorizontal(horzDelta, vertical: vertDelta)
                
            }
        }
    }*/
    
    
    /*override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(componentsLayer)
        let (success, column, row) = convertPoint(location)
        if success {
            if let component = level.componentAtColumn(column, row: row) {
                swipeFromColumn = column
                swipeFromRow = row
            }
        }
    }*/
    
    /*override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if swipeFromColumn == nil { return }
        
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(componentsLayer)
        
        let (success, column, row) = convertPoint(location)
        if success {
            var horzDelta = 0, vertDelta = 0
            if column < swipeFromColumn! {
                horzDelta = -1
            } else if column > swipeFromColumn! {
                horzDelta = 1
            } else if row < swipeFromRow! {
                vertDelta = -1
            } else if row > swipeFromRow! {
                vertDelta = 1
            }
            
            if horzDelta != 0 || vertDelta != 0 {
                trySwapHorizontal(horzDelta, vertical: vertDelta)
                swipeFromColumn = nil
            }
        }
    }*/
    
    
    
    /*override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        swipeFromColumn = nil
        swipeFromRow = nil
    }
    
    override func touchesCancelled(touches: NSSet, withEvent event: UIEvent) {
        touchesEnded(touches, withEvent: event)
    }*/
    
    //override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swipeFromColumn = nil
        swipeFromRow = nil
        //super.touchesEnded(touches, withEvent: event)
    }
    
    //override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touchesEnded(touches!, withEvent: event)
        //super.touchesCancelled(touches, withEvent: event)
    }


    var swipeHandler: ((Swap) -> ())?
    
    var swipeFromColumn: Int?
    var swipeFromRow: Int?
    
    var level: Level!
    
    let TileWidth: CGFloat = 25
    let TileHeight: CGFloat = 25
    
    let gameLayer = SKNode()
    let componentsLayer = SKNode()
    
    func addSpritesForComponents(components: Set2<Component>) {
        for component in components {
            let sprite = SKSpriteNode(imageNamed: component.componentType.spriteName)
            sprite.position = pointForColumn(component.column, row:component.row)
            componentsLayer.addChild(sprite)
            component.sprite = sprite
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column)*TileWidth + TileWidth/2,
            y: CGFloat(row)*TileHeight + TileHeight/2)
    }
    
    func convertPoint(point: CGPoint) -> (success: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns)*TileWidth &&
            point.y >= 0 && point.y < CGFloat(NumRows)*TileHeight {
                return (true, Int(point.x/TileWidth), Int(point.y/TileHeight))
        } else {
            return (false, 0, 0)
        }
    }
    
    func trySwapHorizontal(horzDelta: Int, vertical vertDelta: Int) {
        let toColumn = swipeFromColumn! + horzDelta
        let toRow = swipeFromRow! + vertDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows {return}
        
        let type = ComponentType.Enzyme
        let type2 = ComponentType.Substrate
        if let toComponent = level.componentAtColumn(toColumn, row: toRow) {
            if let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
                
                if fromComponent.componentType == type && toComponent.componentType == type2 {
                    
                    print("fromComponent: \(fromComponent.componentType, fromComponent.column, fromComponent.row )")
                    print("toComponent: \(toComponent.componentType, toComponent.column, toComponent.row)")
                    
                    if let handler = swipeHandler {
                        let swap = Swap(componentA: fromComponent, componentB: toComponent)
                        handler(swap)
                        
                        /*level.removepieces(fromComponent, component2: toComponent)
                        self.removecomponents(fromComponent, component2: toComponent)
                        self.combinedcomponent(fromComponent, component2: toComponent)
                        */
                        
                        print("afterswapfromComponent: \(fromComponent.componentType, fromComponent.column, fromComponent.row )")
                        //print("fromComponent: \(fromComponent.column, fromComponent.row)")
                        print("afterswaptoComponent: \(toComponent.componentType, toComponent.column, toComponent.row)")
                        //print("toComponent: \(toComponent.column, toComponent.row)")
                        
                        
                        level.removepieces(fromComponent, component2: toComponent)
                        self.removecomponents(fromComponent, component2: toComponent)
                        self.combinedcomponent2(fromComponent, component2: toComponent)
                    

                        

                        
                        //self.substrates()
                        //self.nosubstrates()
                        //self.substratecheck()
                        //self.productcheck()
                        
                        //self.direction()
                        
                        //self.nosubstrates()
                        
                        //level.shufflepieces()
                        //self.animateshuffle(fromComponent, component2: toComponent)
                        //self.shuffling()
                        //let columns = level.pieces()
                        //self.animateshuffle(columns) {
                        //}
                       
                       
                    }
                }
                
                /*level.removepieces(fromComponent, component2: toComponent)
                self.removecomponents(fromComponent, component2: toComponent)
                self.combinedcomponent2(fromComponent, component2: toComponent)*/
                
            }
        }
        
    }
    
    /*func animateshuffle(component1:Component, component2: Component) {
        level.shufflepieces(component1)
        level.shufflepieces(component2)

            if let sprite1 = component1.sprite {
                if sprite1.actionForKey("removing") == nil {
                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                    scaleAction.timingMode = .EaseOut
                    sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                }
            }
            
            if let sprite2 = component2.sprite {
                if sprite2.actionForKey("removing") == nil {
                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                    scaleAction.timingMode = .EaseOut
                    sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                }
            }
        
            sprite.position = pointForColumn(component1.column, row: component1.row)
            componentsLayer.addChild(sprite)
            newcomponent2.sprite = sprite
            
            let newPosition = pointForColumn(component.column, row: component.row)
            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
            moveAction.timingMode = .EaseOut
            sprite.alpha = 0
            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))

        
        func addSpritesForComponents(components: Set<Component>) {
            for component in components {
                let sprite = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite.position = pointForColumn(component.column, row:component.row)
                componentsLayer.addChild(sprite)
                component.sprite = sprite
            }
        }
        
    }*/
    
   /* func animateshuffle() {
        for column in 0..<NumColumns {
            for row in 0..<NumRows {
                let component = level.componentAtColumn(column, row: row)
                self.addSpritesForComponents
                    for component in components {
                        let sprite = SKSpriteNode(imageNamed: component.componentType.spriteName)
                        sprite.position = pointForColumn(component.column, row:component.row)
                        componentsLayer.addChild(sprite)
                        component.sprite = sprite
                    }
                }
                
            //let newcomponent = Component(column: column, row: row, componentType: component.componentType)
            let sprite = component?.sprite
                /*let sprite = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite.position = pointForColumn(column, row: row)
                componentsLayer.addChild(sprite)
                component.sprite = sprite*/
                
                        /*let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        scaleAction.timingMode = .EaseOut
                        sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")*/
                
                scene.removeAllComponentSprites()
                
                /*sprite.position = pointForColumn(component.column, row: component.row)
                componentsLayer.addChild(sprite)
                component.sprite = sprite*/
                
                var newcol = Int(arc4random_uniform(9))
                var newrow = Int(arc4random_uniform(9))
                
                let newPosition = pointForColumn(newcol, row: newrow)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                
                

            }
        }*/
    
    /*func shuffling() {
        //component.column = 0;
        //component.row = 0;
        for first in stride(from: NumColumns - 1, through: 1, by: -1) {
            let second = Int(arc4random_uniform(UInt32(first + 1)))
 
            for third in stride(from: NumRows - 1, through: 1, by: -1) {
                let fourth = Int(arc4random_uniform(UInt32(third + 1)))
            let temp = level.componentAtColumn(first, row: third)
            level.componentAtColumn(first, row: third) == level.componentAtColumn(second, row: fourth)
            level.componentAtColumn(second, row: fourth) == temp
                
                let component = level.componentAtColumn(first, row: third)
                
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                scaleAction.timingMode = .EaseOut
                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                withKey:"removing")
                
                //scene.removeAllComponentSprites()
                
                /*sprite.position = pointForColumn(component.column, row: component.row)
                componentsLayer.addChild(sprite)
                component.sprite = sprite*/
                
                let newPosition = pointForColumn(second, row: fourth)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
            }
        }
    }*/
    
    func animateshuffle(columns: [[Component]], completion: () -> ()) {
        for array in columns {
            for (idx, component) in array.enumerate() {
                let newPosition = pointForColumn(component.column, row: component.row)
                let sprite = component.sprite!
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.runAction(
                    SKAction.sequence([
                        SKAction.waitForDuration(0.5),
                        SKAction.group([moveAction])]))
                
            }
        }
    runAction(SKAction.waitForDuration(0.5), completion: completion)
    }

    func removeAllComponentSprites() {
        componentsLayer.removeAllChildren()
    }
    
    func removecomponents(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            if let sprite1 = component1.sprite {
                if sprite1.actionForKey("removing") == nil {
                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                    scaleAction.timingMode = .EaseOut
                    sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                }
            }
            
            if let sprite2 = component2.sprite {
                if sprite2.actionForKey("removing") == nil {
                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                    scaleAction.timingMode = .EaseOut
                    sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                }
            }
        }
    }
    
    func productpiece(component: Component) {
        if component.componentType == ComponentType.ESComplex {

            let newcomponentType2 = ComponentType.Product
            let newcomponent2 = Component(column: component.column, row: component.row, componentType: newcomponentType2)
            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
            sprite.position = pointForColumn(component.column, row: component.row)
            componentsLayer.addChild(sprite)
            newcomponent2.sprite = sprite
                
            let newPosition = pointForColumn(component.column, row: component.row)
            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
            moveAction.timingMode = .EaseOut
            sprite.alpha = 0
            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))

        }
    }
    
    func revert(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            
            if component2.componentType == ComponentType.Substrate {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component1.column, row: component1.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Product
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component2.column, row: component2.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
                
            }
            
            if component2.componentType == ComponentType.Competitive_Inhibitor{
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component1.column, row: component1.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(6), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Competitive_Inhibitor
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component2.column, row: component2.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(6), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }
            
            if component2.componentType == ComponentType.Deactivator {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component1.column, row: component1.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(4.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Deactivator
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component2.column, row: component2.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(4.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }
            
            if component2.componentType == ComponentType.Noncompetitive_Inhibitor {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component1.column, row: component1.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(5.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Noncompetitive_Inhibitor
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component2.column, row: component2.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(5.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }
            
            if component2.componentType == ComponentType.Activator {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component1.column, row: component1.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Activator
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component2.column, row: component2.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }

        }
        
    }
    
    func combinedcomponent2(component1: Component, component2: Component) {
        //if component1.componentType == ComponentType.Enzyme {
        
            print("component1: \(component1.componentType, component1.column, component1.row)")
           // print("component1: \(component1.column, component1.row)")
            print("component2: \(component2.componentType, component2.column, component2.row)")
           // print("component2: \(component2.column, component2.row)")
            
            if component1.componentType == ComponentType.Enzyme && component2.componentType == ComponentType.Substrate {
                //if component2.componentType == ComponentType.Substrate {
                let newcomponentType = ComponentType.ESComplex
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(0.05), moveAction]))
                
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(2), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                //self.productpiece(newcomponent)
                
                print("escomplex: \(newcomponent.column, newcomponent.row)")
                
                self.revert2(component1, component2: component2)
        }
        
        //}
    }
    
    
    func revert2(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            if component2.componentType == ComponentType.Substrate {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component2.column, row: component2.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component2.column, row: component2.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                print("enzyme: \(component.column, component.row)")
                
                let newcomponentType = ComponentType.Product
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component1.column, row: component1.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
                
                print("product: \(newcomponent.column, newcomponent.row)")
                
            }
        }
    }
    
    
    
    func combinedcomponent(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            let time = 0.5
            let delay = 0.5
            
            if component1.componentType == ComponentType.Enzyme && component2.componentType == ComponentType.Substrate {
            //if component2.componentType == ComponentType.Substrate {
                let newcomponentType = ComponentType.ESComplex
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component2.column, row: component2.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(0.05), moveAction]))
               

                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(2), scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                //self.productpiece(newcomponent)
                self.revert(component1, component2: component2)
            }

        
            if component2.componentType == ComponentType.Competitive_Inhibitor {
                let newcomponentType = ComponentType.Enzyme_with_Competitive_Inhibitor
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component2.column, row: component2.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                self.revert(component1, component2: component2)
            }
            
            if component2.componentType == ComponentType.Deactivator {
                let newcomponentType = ComponentType.Enzyme_with_deactivator
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component2.column, row: component2.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                self.revert(component1, component2: component2)
            }
            
            if component2.componentType == ComponentType.Noncompetitive_Inhibitor {
                let newcomponentType = ComponentType.Enzyme_with_Noncompetitive_Inhibitor
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component2.column, row: component2.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                
                if newcomponent.column != NumColumns - 1 {
                if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))

                    }
                    
                    else {
                        self.revert(component1, component2: component2)
                    }
                }
                }
                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                    }
                        
                    else {
                        self.revert(component1, component2: component2)
                    }
                    }
                }
                
                if newcomponent.row != NumRows - 1 {
                if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                    }
                        
                    else {
                        self.revert(component1, component2: component2)
                    }
                }
                }
                
                if newcomponent.row != 0 {
                if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                    }
                        
                    else {
                        self.revert(component1, component2: component2)
                    }
                }
                }
    
            }
            
            if component2.componentType == ComponentType.Activator {
                let newcomponentType = ComponentType.Enzyme_with_one_activator
                let newcomponent = Component(column: component2.column, row: component2.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component2.column, row: component2.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                if newcomponent.column != NumColumns - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                            
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.row != NumRows - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.row != 0 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                
                /*if newcomponent.column != NumColumns - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Activator
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                        
                    }
                }
                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Activator
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.row != NumRows - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Activator
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.row != 0 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component1.column, row: component1.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component2.column, row: component2.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Activator
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }*/
                
                
                
                if newcomponent.column != NumColumns - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            if newcomponent2.column != NumColumns - 1 {
                                if let othercomponent2 = level.componentAtColumn(newcomponent2.column + 1, row: newcomponent2.row) {
                                    if othercomponent2.componentType == ComponentType.Substrate {
                                        if let sprite = newcomponent2.sprite {
                                            //if sprite.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        if let sprite2 = othercomponent2.sprite {
                                            //if sprite2.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                        let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                        let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                        sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(sprite)
                                        newcomponent3.sprite = sprite
                                        
                                        let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                        moveAction.timingMode = .EaseOut
                                        sprite.alpha = 0
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                        
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                        
                                        let componentDType = ComponentType.Substrate
                                        let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                        let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                        spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        componentsLayer.addChild(spriteD)
                                        componentD.sprite = spriteD
                                        
                                        let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                        moveActionD.timingMode = .EaseOut
                                        spriteD.alpha = 0
                                        spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                    }
                                        
                                    else {
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                    }
                                }
                                    
                                else {
                                    self.revert(component1, component2: component2)
                                }
                            }
                        }
                    }
                }

                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            if newcomponent2.column != 0 {
                                if let othercomponent2 = level.componentAtColumn(newcomponent2.column - 1, row: newcomponent2.row) {
                                    if othercomponent2.componentType == ComponentType.Substrate {
                                        if let sprite = newcomponent2.sprite {
                                            //if sprite.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        if let sprite2 = othercomponent2.sprite {
                                            //if sprite2.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                        let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                        let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                        sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(sprite)
                                        newcomponent3.sprite = sprite
                                        
                                        let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                        moveAction.timingMode = .EaseOut
                                        sprite.alpha = 0
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                        
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                        
                                        let componentDType = ComponentType.Substrate
                                        let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                        let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                        spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        componentsLayer.addChild(spriteD)
                                        componentD.sprite = spriteD
                                        
                                        let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                        moveActionD.timingMode = .EaseOut
                                        spriteD.alpha = 0
                                        spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                    }
                                        
                                    else {
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                    }
                                }
                                    
                                else {
                                    self.revert(component1, component2: component2)
                                }
                            }
                        }
                    }
                }

                
                if newcomponent.row != NumRows - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            if newcomponent2.row != NumRows - 1 {
                                if let othercomponent2 = level.componentAtColumn(newcomponent2.column, row: newcomponent2.row + 1) {
                                    if othercomponent2.componentType == ComponentType.Substrate {
                                        if let sprite = newcomponent2.sprite {
                                            //if sprite.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        if let sprite2 = othercomponent2.sprite {
                                            //if sprite2.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                        let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                        let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                        sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(sprite)
                                        newcomponent3.sprite = sprite
                                        
                                        let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                        moveAction.timingMode = .EaseOut
                                        sprite.alpha = 0
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                        
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                        
                                        let componentDType = ComponentType.Substrate
                                        let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                        let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                        spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        componentsLayer.addChild(spriteD)
                                        componentD.sprite = spriteD
                                        
                                        let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                        moveActionD.timingMode = .EaseOut
                                        spriteD.alpha = 0
                                        spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                    }
                                        
                                    else {
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component1.column, row: component1.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component2.column, row: component2.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                    }
                                }
                                    
                                else {
                                    self.revert(component1, component2: component2)
                                }
                            }
                        }
                    }
                }
            
            
                if newcomponent.row != 0 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            if newcomponent2.row != 0 {
                            if let othercomponent2 = level.componentAtColumn(newcomponent2.column, row: newcomponent2.row - 1) {
                                if othercomponent2.componentType == ComponentType.Substrate {
                                    if let sprite = newcomponent2.sprite {
                                        //if sprite.actionForKey("removing") == nil {
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        scaleAction.timingMode = .EaseOut
                                        sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        //}
                                    }
                                    
                                    if let sprite2 = othercomponent2.sprite {
                                        //if sprite2.actionForKey("removing") == nil {
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        scaleAction.timingMode = .EaseOut
                                        sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        //}
                                    }
                                    
                                    let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                    let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                    let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                    sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    componentsLayer.addChild(sprite)
                                    newcomponent3.sprite = sprite
                                    
                                    let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                    moveAction.timingMode = .EaseOut
                                    sprite.alpha = 0
                                    sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                    
                                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                    sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                        withKey:"removing")
                                    
                                    
                                    let componentAType = ComponentType.Enzyme
                                    let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                    let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                    spriteA.position = pointForColumn(component1.column, row: component1.row)
                                    componentsLayer.addChild(spriteA)
                                    componentA.sprite = spriteA
                                    
                                    let newPositionA = pointForColumn(component1.column, row: component1.row)
                                    let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                    moveActionA.timingMode = .EaseOut
                                    spriteA.alpha = 0
                                    spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                    
                                    let componentBType = ComponentType.Activator
                                    let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                    let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                    spriteB.position = pointForColumn(component2.column, row: component2.row)
                                    componentsLayer.addChild(spriteB)
                                    componentB.sprite = spriteB
                                    
                                    let newPositionB = pointForColumn(component2.column, row: component2.row)
                                    let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                    moveActionB.timingMode = .EaseOut
                                    spriteB.alpha = 0
                                    spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                    
                                    let componentCType = ComponentType.Activator
                                    let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                    let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                    spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    componentsLayer.addChild(spriteC)
                                    componentC.sprite = spriteC
                                    
                                    let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                    moveActionC.timingMode = .EaseOut
                                    spriteC.alpha = 0
                                    spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                
                                    let componentDType = ComponentType.Substrate
                                    let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                    let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                    spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                    componentsLayer.addChild(spriteD)
                                    componentD.sprite = spriteD
                                    
                                    let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                    let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                    moveActionD.timingMode = .EaseOut
                                    spriteD.alpha = 0
                                    spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                }
                                    
                                else {
                                    
                                    let componentAType = ComponentType.Enzyme
                                    let componentA = Component(column: component1.column, row: component1.row, componentType: componentAType)
                                    let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                    spriteA.position = pointForColumn(component1.column, row: component1.row)
                                    componentsLayer.addChild(spriteA)
                                    componentA.sprite = spriteA
                            
                                    let newPositionA = pointForColumn(component1.column, row: component1.row)
                                    let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                    moveActionA.timingMode = .EaseOut
                                    spriteA.alpha = 0
                                    spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                                    let componentBType = ComponentType.Activator
                                    let componentB = Component(column: component2.column, row: component2.row, componentType: componentBType)
                                    let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                    spriteB.position = pointForColumn(component2.column, row: component2.row)
                                    componentsLayer.addChild(spriteB)
                                    componentB.sprite = spriteB
                            
                                    let newPositionB = pointForColumn(component2.column, row: component2.row)
                                    let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                    moveActionB.timingMode = .EaseOut
                                    spriteB.alpha = 0
                                    spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                                    let componentCType = ComponentType.Activator
                                    let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                    let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                    spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                    componentsLayer.addChild(spriteC)
                                    componentC.sprite = spriteC
                            
                                    let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                    let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                    moveActionC.timingMode = .EaseOut
                                    spriteC.alpha = 0
                                    spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                }
                            }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /*func trySwapHorizontal(horzDelta: Int, vertical vertDelta: Int) {
        let toColumn = swipeFromColumn! + horzDelta
        let toRow = swipeFromRow! + vertDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows {return}
        
        if let toComponent = level.componentAtColumn(toColumn, row: toRow) {
            if let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
                if let handler = swipeHandler {
                    let swap = Swap(componentA: fromComponent, componentB: toComponent)
                    handler(swap)
                }
            }
        }
    }*/

    func animateSwap(swap: Swap, completion: () -> ()) {
        let spriteA = swap.componentA.sprite!
        let spriteB = swap.componentB.sprite!
        
        spriteA.zPosition = 90
        spriteB.zPosition = 100
        
        let Duration: NSTimeInterval = 0.5
        
        let moveA = SKAction.moveTo(spriteB.position, duration: Duration)
        //let moveA = SKAction.moveTo(spriteA.position, duration: Duration)
        moveA.timingMode = .EaseOut
        spriteA.runAction(moveA, completion: completion)
        
        //let moveB = SKAction.moveTo(spriteB.position, duration: Duration)
        let moveB = SKAction.moveTo(spriteA.position, duration: Duration)
        moveB.timingMode = .EaseOut
        spriteB.runAction(moveB)
    }
    
    /*func nosubstrates() {
    
            for column in 0..<NumColumns {
                for row in 0..<NumRows{
                    if let component = level.componentAtColumn(column, row: row) {
                        if component.componentType == ComponentType.Enzyme {
        
                        for row in 0..<NumRows {
                            for column in 0..<NumColumns {
                                swipeFromColumn = column
                                swipeFromRow = row
                                
                                var horzDelta = 0, vertDelta = 0
                                if row == 0 && column == 0 {
                                    var dataConverter = Int(arc4random_uniform(2)+1)
                                    if dataConverter == 1 {
                                        horzDelta = 1
                                    }
                                    else if dataConverter == 2 {
                                        vertDelta = 1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                
                                if row == NumRows - 1 && column == NumColumns - 1 {
                                    var dataConverter = Int(arc4random_uniform(2)+1)
                                    if dataConverter == 1 {
                                        horzDelta = -1
                                    }
                                    else if dataConverter == 2 {
                                        vertDelta = -1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                
                                if row == 0 && column == NumColumns - 1 {
                                    var dataConverter = Int(arc4random_uniform(2)+1)
                                    if dataConverter == 1 {
                                        horzDelta = -1
                                    }
                                    else if dataConverter == 2 {
                                        vertDelta = 1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                
                                if row == NumRows - 1 && column == 0 {
                                    var dataConverter = Int(arc4random_uniform(2)+1)
                                    if dataConverter == 1 {
                                        horzDelta = 1
                                    }
                                    else if dataConverter == 2 {
                                        vertDelta = -1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                    
                                else if row == 0 {
                                    var dataConverter = Int(arc4random_uniform(3)+1)
                                    if dataConverter == 1 {
                                        horzDelta = -1
                                    }
                                    else if dataConverter == 2 {
                                        horzDelta = 1
                                    }
                                    else if dataConverter == 3 {
                                        vertDelta = 1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                    
                                else if row == NumRows - 1 {
                                    var dataConverter = Int(arc4random_uniform(3)+1)
                                    if dataConverter == 1 {
                                        horzDelta = -1
                                    }
                                    else if dataConverter == 2 {
                                        horzDelta = 1
                                    }
                                    else if dataConverter == 3 {
                                        vertDelta = -1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                    
                                else if column == 0 {
                                    var dataConverter = Int(arc4random_uniform(3)+1)
                                    if dataConverter == 1 {
                                        horzDelta = 1
                                    }
                                    else if dataConverter == 2 {
                                        vertDelta = -1
                                    }
                                    else if dataConverter == 3 {
                                        vertDelta = 1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                    
                                else if column == NumColumns - 1 {
                                    var dataConverter = Int(arc4random_uniform(3)+1)
                                    if dataConverter == 1 {
                                        horzDelta = -1
                                    }
                                    else if dataConverter == 2 {
                                        vertDelta = -1
                                    }
                                    else if dataConverter == 3 {
                                        vertDelta = 1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                                    
                                else {
                                    var dataConverter = Int(arc4random_uniform(4)+1)
                                    if dataConverter == 1 {
                                        horzDelta = -1
                                    }
                                    else if dataConverter == 2 {
                                        horzDelta = 1
                                    }
                                    else if dataConverter == 3 {
                                        vertDelta = -1
                                    }
                                    else if dataConverter == 4 {
                                        vertDelta = 1
                                    }
                                    
                                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                                }
                            }
                        }
                    }
                }
                    
            }
        }
    }*/
    
    func animateRxnComponents(rxns: Set2<Rxn>, completion: () -> ()) {
        for rxn in rxns {
            for component in rxn.components {
                /*if component.componentType == ComponentType.Enzyme {
                    let component1 = component
                    if component.componentType == ComponentType.Substrate {
                        let component2 = component
                
                if component.componentType == ComponentType.Enzyme {
                    let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                        if component.componentType == ComponentType.Substrate {
                            let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                            //level.removepieces(component1, component2: component2)
                            self.removecomponents(component1, component2: component2)
                            self.combinedcomponent(component1, component2: component2)
                            self.revert(component1, component2: component2)
                    }
                }
            }
        }
    }*/
             
               if component.componentType == ComponentType.Enzyme {
                    let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                  if let sprite1 = component1.sprite {
                    //if sprite1.actionForKey("removing") == nil {
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        scaleAction.timingMode = .EaseOut
                        sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                        

                
                if component.componentType != ComponentType.Enzyme {
                    let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                    
                    if let sprite2 = component2.sprite {
                        //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                
                //let time = 0.5
                //let delay = 0.5
                
                let newcomponentType = ComponentType.ESComplex
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite3 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite3.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite3)
                newcomponent.sprite = sprite3
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite3.alpha = 0
                sprite3.runAction(SKAction.sequence([SKAction.fadeInWithDuration(0.05), moveAction]))
                
                
                let scaleAction3 = SKAction.scaleTo(0.1, duration: 0.3)
                sprite3.runAction(SKAction.sequence([SKAction.waitForDuration(2), scaleAction3, SKAction.removeFromParent()]),
                    withKey:"removing")
                    
                    
                        let componentType = ComponentType.Enzyme
                        let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                        let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                        sprite1.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(sprite1)
                        component.sprite = sprite1
                        
                        let newPosition1 = pointForColumn(component1.column, row: component1.row)
                        let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                        moveAction1.timingMode = .EaseOut
                        sprite1.alpha = 0
                        sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                        
                        let newcomponent2Type = ComponentType.Product
                        let newcomponent2 = Component(column: component2.column, row: component2.row, componentType: newcomponent2Type)
                        let sprite4 = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite4.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(sprite4)
                        newcomponent2.sprite = sprite4
                        
                        let newPosition2 = pointForColumn(component2.column, row: component2.row)
                        let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                        moveAction2.timingMode = .EaseOut
                        sprite4.alpha = 0
                        sprite4.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
                    }
                    }
                        }
                    }
                    
                }
            //}
            //}

        }
        runAction(SKAction.waitForDuration(0.3), completion: completion)

    }

    
    /*func animateRxnComponents(rxns: Set2<Rxn>, completion: () -> ()) {
        for rxn in rxns {
            for component in rxn.components {
                /*if component.componentType == ComponentType.Enzyme {
                let component1 = component
                if component.componentType == ComponentType.Substrate {
                let component2 = component
                
                if component.componentType == ComponentType.Enzyme {
                let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                if component.componentType == ComponentType.Substrate {
                let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                //level.removepieces(component1, component2: component2)
                self.removecomponents(component1, component2: component2)
                self.combinedcomponent(component1, component2: component2)
                self.revert(component1, component2: component2)
                }
                }
                }
                }
                }*/
                
                if component.componentType == ComponentType.Enzyme {
                    let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                    if let sprite1 = component1.sprite {
                        //if sprite1.actionForKey("removing") == nil {
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        scaleAction.timingMode = .EaseOut
                        sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                        
                        
                        
                        if component.componentType != ComponentType.Enzyme {
                            let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                            
                            if let sprite2 = component2.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                                
                                
                                
                                
                                
                                
                                let time = 0.5
                                let delay = 0.5
                                
                                let newcomponentType = ComponentType.ESComplex
                                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                                
                                let sprite3 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                                sprite3.position = pointForColumn(component1.column, row: component1.row)
                                componentsLayer.addChild(sprite3)
                                newcomponent.sprite = sprite3
                                
                                let newPosition = pointForColumn(component1.column, row: component1.row)
                                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                moveAction.timingMode = .EaseOut
                                sprite3.alpha = 0
                                sprite3.runAction(SKAction.sequence([SKAction.fadeInWithDuration(0.05), moveAction]))
                                
                                
                                let scaleAction3 = SKAction.scaleTo(0.1, duration: 0.3)
                                sprite3.runAction(SKAction.sequence([SKAction.waitForDuration(2), scaleAction3, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                
                                
                                let componentType = ComponentType.Enzyme
                                let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                                sprite1.position = pointForColumn(component1.column, row: component1.row)
                                componentsLayer.addChild(sprite1)
                                component.sprite = sprite1
                                
                                let newPosition1 = pointForColumn(component1.column, row: component1.row)
                                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                                moveAction1.timingMode = .EaseOut
                                sprite1.alpha = 0
                                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                                
                                let newcomponent2Type = ComponentType.Product
                                let newcomponent2 = Component(column: component2.column, row: component2.row, componentType: newcomponent2Type)
                                let sprite4 = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                                sprite4.position = pointForColumn(component2.column, row: component2.row)
                                componentsLayer.addChild(sprite4)
                                newcomponent2.sprite = sprite4
                                
                                let newPosition2 = pointForColumn(component2.column, row: component2.row)
                                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                                moveAction2.timingMode = .EaseOut
                                sprite4.alpha = 0
                                sprite4.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
                            }
                        }
                    }
                }
                
            }
            //}
            //}
            
        }
        runAction(SKAction.waitForDuration(0.3), completion: completion)
        
    }*/

    
    


    
    
    func nosubstrates() {
        for column in 0..<NumColumns {
            for row in 0..<NumRows{
                if let component = level.componentAtColumn(column, row: row) {
                    if component.componentType == ComponentType.Substrate {
                        //self.direction2()
                    }
                }
            }
        }
    }
    
  
    
    /*func trySwapHorizontal2(horzDelta: Int, vertical vertDelta: Int) {
        let toColumn = swipeFromColumn! + horzDelta
        let toRow = swipeFromRow! + vertDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows {return}
        
        //let other = ComponentType.Product
        let type = ComponentType.Enzyme
        let type2 = ComponentType.Substrate
        
        
        if let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
            if let toComponent = level.componentAtColumn(toColumn, row: toRow) {
                
                
                if fromComponent.componentType == type {
                    if toComponent.componentType == type2 {
                        if let handler = swipeHandler {
                            let swap = Swap(componentA: fromComponent, componentB: toComponent)
                            handler(swap)
                            level.removepieces(fromComponent, component2: toComponent)
                            self.removecomponents(fromComponent, component2: toComponent)
                            self.combinedcomponent(fromComponent, component2: toComponent)
                            
                            //self.productcheck()
                            self.substratecheck()
                
                            self.direction2()
                        }
                    }
                }
            
            }
        }
    }*/
    
        
        //if let toComponent = level.componentAtColumn(toColumn, row: toRow) {
            //if let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
    
                /*if fromComponent.componentType == type {
                    if toComponent.componentType == type2 {
                    if let handler = swipeHandler {
                        let swap = Swap(componentA: fromComponent, componentB: toComponent)
                        handler(swap)
                        level.removepieces(fromComponent, component2: toComponent)
                        self.removecomponents(fromComponent, component2: toComponent)
                        self.combinedcomponent(fromComponent, component2: toComponent)
                        
                        self.direction2()
                        
                        //self.direction()
                        
                        //self.nosubstrates()
                        
                        //level.shufflepieces()
                        //self.animateshuffle(fromComponent, component2: toComponent)
                        //self.shuffling()
                        //let columns = level.pieces()
                        //self.animateshuffle(columns) {
                        //}
                        
                        }
                    }
                }
            }
        }*/
    
    
    func productcheck() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                swipeFromColumn = column
                swipeFromRow = row
                
                if let component = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
                    
                    if component.componentType == ComponentType.Product && swipeFromColumn != NumColumns - 1 {
                        let component = level.componentAtColumn(swipeFromColumn! + 1, row: swipeFromRow!)
                        if component!.componentType == ComponentType.Enzyme {
                            //self.direction2()
                            self.direction()
                        }
                    }
                    
                    if component.componentType == ComponentType.Product && swipeFromColumn == NumColumns - 1 {
                        let component = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow! + 1)
                        if component!.componentType == ComponentType.Enzyme{
                            //self.direction2()
                            self.direction()
                        }
                    }
                }
            }
        }

    }

    /*func direction2() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                swipeFromColumn = column
                swipeFromRow = row
                
                
                var horzDelta = 0, vertDelta = 0
                if row == 0 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                
                if row == NumRows - 1 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                
                if row == 0 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                
                if row == NumRows - 1 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                    
                else if row == 0 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                    
                else if row == NumRows - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                    
                else if column == 0 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                    
                else if column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
                    
                else {
                    let dataConverter = Int(arc4random_uniform(4)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    else if dataConverter == 4 {
                        vertDelta = 1
                    }
                    
                    trySwapHorizontal2(horzDelta, vertical: vertDelta)
                }
            }
        }
    }*/
    
    
    //while loop run continuously while there are substrate components on the screen if enzymes are near them
    func substratecheck() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                //swipeFromColumn = column
                //swipeFromRow = row
              
                if let component = level.componentAtColumn(column, row: row) {
                    //let type1 = ComponentType.Enzyme
                    //let type2 = ComponentType.Product
                    let type3 = ComponentType.Substrate
                    /*if component.componentType == type1 && swipeFromColumn != NumColumns - 1 {
                            //let component = level.componentAtColumn(column + 1, row: row)
                            self.substratecheck()
                    }
                    
                    if component.componentType == type1 && swipeFromColumn == NumColumns - 1 {
                            //let component = level.componentAtColumn(column, row: row + 1)
                            self.substratecheck()
                    }
                
                    if component.componentType == type2 && swipeFromColumn != NumColumns - 1 {
                            //let component = level.componentAtColumn(column + 1, row: row)
                            self.substratecheck()
                    }
            
                    if component.componentType == type2 && swipeFromColumn == NumColumns - 1 {
                            //let component = level.componentAtColumn(column, row: row + 1)
                            self.substratecheck()
                    }*/
                    
                    if component.componentType == type3 {
                        self.direction()
                    }
                    
                    else {
                        self.substratecheck()
                    }
                    
                    /*while component.componentType == type3 {
                        self.direction2()
                    }*/
                }
            }
        }
    }
    
    
   
    
    /*func trySwapHorizontal(horzDelta: Int, vertical vertDelta: Int) {
        let toColumn = swipeFromColumn! + horzDelta
        let toRow = swipeFromRow! + vertDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows {return}
        
        let type = ComponentType.Enzyme
        
        if let toComponent = level.componentAtColumn(toColumn, row: toRow) {
            if let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
                
                if fromComponent.componentType == type {
                    if let handler = swipeHandler {
                        let swap = Swap(componentA: fromComponent, componentB: toComponent)
                        handler(swap)
                        level.removepieces(fromComponent, component2: toComponent)
                        self.removecomponents(fromComponent, component2: toComponent)
                        self.combinedcomponent(fromComponent, component2: toComponent)
                        
                        self.direction2()
    */
                /*if fromComponent.componentType == other && swipeFromColumn != NumColumns - 1 {
                let fromComponent = level.componentAtColumn(swipeFromColumn! + 1, row: swipeFromRow!)
                if fromComponent!.componentType == type {
                if toComponent.componentType == type2 {
                if let handler = swipeHandler {
                let swap = Swap(componentA: fromComponent!, componentB: toComponent)
                handler(swap)
                level.removepieces(fromComponent!, component2: toComponent)
                self.removecomponents(fromComponent!, component2: toComponent)
                self.combinedcomponent(fromComponent!, component2: toComponent)
                
                self.direction2()
                }
                }
                }
                
                }
                
                if fromComponent.componentType == other && swipeFromColumn == NumColumns - 1 {
                let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow! + 1)
                if fromComponent!.componentType == type {
                if toComponent.componentType == type2 {
                if let handler = swipeHandler {
                let swap = Swap(componentA: fromComponent!, componentB: toComponent)
                handler(swap)
                level.removepieces(fromComponent!, component2: toComponent)
                self.removecomponents(fromComponent!, component2: toComponent)
                self.combinedcomponent(fromComponent!, component2: toComponent)
                
                self.direction2()
                }
                }
                }
                
                }*/
            
    
    
}

