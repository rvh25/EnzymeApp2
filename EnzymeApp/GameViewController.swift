//
//  GameViewController.swift
//  EnzymeApp
//
//  Created by admin on 2/22/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController : UIViewController {
    var scene : GameScene!
    var level: Level!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.AllButUpsideDown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the view
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        //Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        level = Level()
        scene.level = level
        scene.swipeHandler = handleSwipe
        
        //Present the scene
        skView.presentScene(scene)
        
        beginGame()
    }
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        //scene.removeAllComponentSprites()
        let newComponents = level.shuffle()
        scene.addSpritesForComponents(newComponents)
    }
    
    /*func handleSwipe(swap:Swap) {
        view.userInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.performSwap(swap)
        /*scene.animateSwap(swap){
            self.view.userInteractionEnabled = true
        }*/
            scene.animateSwap(swap, completion: handleRxns)
            /*scene.animateSwap(swap, completion:
                {
                self.view.userInteractionEnabled = true
            })*/
        } else {
            //scene.direction()
            //beginNextTurn()
            //scene.animateInvalidSwap(swap) {
                self.view.userInteractionEnabled = true
            
            //}
        }
        
    }*/
    
    
    func handleSwipe(swap:Swap) {
        view.userInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.performSwap(swap)
            /*scene.animateSwap(swap){
            self.view.userInteractionEnabled = true
            }*/
            //scene.animateSwap(swap, completion: handleRxns)
            scene.animateSwap(swap, completion:
            {
            self.view.userInteractionEnabled = true
            })
        } else {
            //scene.direction()
            //beginNextTurn()
            //scene.animateInvalidSwap(swap) {
            self.view.userInteractionEnabled = true
            
            //}
        }
        
    }
    
    
    
    
    
    /*func handleRxns() {
        let rxns = level.removepieces(component1: Component, component2: Component)
        scene.removecomponents(rxns)
    }*/
    
    func handleRxns() {
        let rxns = level.removeRxns()
        if rxns.count == 0 {
            beginNextTurn()
            return
        }
        scene.animateRxnComponents(rxns) {
            //self.handleRxns()
            self.view.userInteractionEnabled = true
            /*let columns = self.level.newcomponents(columns) {
                self.scene.animateNewComponents(columns) {
                    self.handleRxns()
                }
            }*/
        }
    }
    
    /*func handleRxns() {
        let columns = self.level.newcomponents()
        self.scene.animateNewComponents(columns) {
            self.view.userInteractionEnabled = true
        }
    }*/
    
    
    
    func beginNextTurn() {
        level.detectPossibleSwaps()
        view.userInteractionEnabled = true
    }
    

}