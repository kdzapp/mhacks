//
//  PlayerSelectGameScene.swift
//  spot
//
//  Created by Kyle Zappitell on 2/20/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import SpriteKit

class PlayerSelectGameScene: SKScene {
    
    let green = UIColor(red: 0, green: (230/255), blue: (118/255), alpha: 1)
    let red = UIColor(red: 1, green: (23/255), blue: (68/255), alpha: 1)
    let blue = UIColor(red: (41/255), green: (121/255), blue: 1, alpha: 1)
    let yellow = UIColor(red: 1, green: (234/255), blue: 0, alpha: 1)
    let selection = SKSpriteNode(texture: SKTexture(imageNamed: "selection"), size: CGSize(width: 200, height: 200))
    
    var gameBackgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
    var currentSelection = SKNode()
    
    override func didMoveToView(view: SKView) {
        //Background Color
        self.scene?.backgroundColor = gameBackgroundColor
        selection.name = "selection"
        
        //Create Scene
        let headerText = SKSpriteNode(imageNamed: "selectplayer")
        headerText.position = CGPoint(x: 500,y: 490)
        headerText.name = "header"
        
        let sprite1 = SKSpriteNode(texture: SKTexture(imageNamed: "Sprite1"), color: UIColor(), size: CGSize(width: 200, height: 200))
        sprite1.position = CGPoint(x: 200,y: 280)
        sprite1.name = "sprite1";
        
        let sprite2 = SKSpriteNode(texture: SKTexture(imageNamed: "Sprite2"), color: UIColor(), size: CGSize(width: 200, height: 200))
        sprite2.position = CGPoint(x: 400,y: 280)
        sprite2.name = "sprite2";
        
        let sprite3 = SKSpriteNode(texture: SKTexture(imageNamed: "Sprite3"), color: UIColor(), size: CGSize(width: 200, height: 200))
        sprite3.position = CGPoint(x: 600,y: 280)
        sprite3.name = "sprite3";
        
        let sprite4 = SKSpriteNode(texture: SKTexture(imageNamed: "Sprite4"), color: UIColor(), size: CGSize(width: 200, height: 200))
        sprite4.position = CGPoint(x: 800,y: 280)
        sprite4.name = "sprite4";

        self.addChild(headerText)
        self.addChild(sprite1)
        self.addChild(sprite2)
        self.addChild(sprite3)
        self.addChild(sprite4)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //Set Color
        for touch in touches {
            let position = touch.locationInNode(self)
            
            if let node = self.nodeAtPoint(position) as SKNode? {
            
                if(node.name == "sprite1" || node.name == "sprite2" ||
                    node.name == "sprite3" || node.name == "sprite4") {
                        selection.position = node.position
                        selection.zPosition = -1
                        currentSelection = node
                        self.addChild(selection)
                }
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let position = touch.locationInNode(self)
            
            if let node = nodeAtPoint(position) as SKNode? {
                if(node != currentSelection) {
                    for child in self.children {
                        if child.name == "selection" {
                            child.removeFromParent()
                        }
                    }
                if(node.name == "sprite1" || node.name == "sprite2" ||
                    node.name == "sprite3" || node.name == "sprite4") {
                        selection.position = node.position
                        selection.zPosition = -1
                        currentSelection = node
                        self.addChild(selection)
                    }

                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let position = touch.locationInNode(self)
            if let node = self.nodeAtPoint(position) as SKNode? {
                
                let playGameScene = GameScene(fileNamed: "GameScene")
                var transition = SKTransition()
                playGameScene!.scaleMode = .AspectFill
                if (node.name != nil) {
                    switch node.name! {
                    case "sprite1":
                        playGameScene!.player.setColor(spriteColor.green)
                        playGameScene!.enemy.setColor(spriteColor.yellow)
                        transition = SKTransition.fadeWithColor(green, duration: 1)
                        self.view?.presentScene(playGameScene!, transition: transition)
                        break
                    case "sprite2":
                        playGameScene!.player.setColor(spriteColor.red)
                        playGameScene!.enemy.setColor(spriteColor.blue)
                        transition = SKTransition.fadeWithColor(red, duration: 1)
                        self.view?.presentScene(playGameScene!, transition: transition)
                        break
                    case "sprite3":
                        playGameScene!.player.setColor(spriteColor.blue)
                        playGameScene!.enemy.setColor(spriteColor.red)
                        transition = SKTransition.fadeWithColor(blue, duration: 1)
                        self.view?.presentScene(playGameScene!, transition: transition)
                        break
                    case "sprite4":
                        playGameScene!.player.setColor(spriteColor.yellow)
                        playGameScene!.enemy.setColor(spriteColor.green)
                        transition = SKTransition.fadeWithColor(yellow, duration: 1)
                        self.view?.presentScene(playGameScene!, transition: transition)
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //If Object is bigger than X, then fade out and start game :D
    }
}
