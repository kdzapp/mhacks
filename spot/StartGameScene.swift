//
//  StartGameScene.swift
//  spot
//
//  Created by Kyle Zappitell on 2/20/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import SpriteKit

class StartGameScene: SKScene {
    
    var gameBackgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
    let gameStartColor = UIColor(red: 0, green: (230/255), blue: (118/255), alpha: 1)
    let playButton = SKSpriteNode(texture: SKTexture(imageNamed: "play"), size: CGSize(width: 200, height: 200))
    let shade = SKSpriteNode(texture: SKTexture(imageNamed: "shade"), size: CGSize(width: 277, height: 277))
    
    override func didMoveToView(view: SKView) {
        //Background Color
        self.scene?.backgroundColor = gameBackgroundColor
        
        //Create Scene
        let headerText = SKSpriteNode(imageNamed: "header")
        headerText.size = CGSize(width: 744, height: 297)
        headerText.position = CGPoint(x: 500,y: 490)
        
        playButton.position = CGPoint(x: 500,y: 230)
        shade.position = playButton.position
        shade.zPosition = 100
        playButton.name = "play"
        shade.name = "shade"
        
        self.addChild(headerText)
        self.addChild(playButton)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //Set Color
        for touch in touches {
            let position = touch.locationInNode(self)
            if let node = self.nodeAtPoint(position) as SKNode? {
                if(node.name == "play") {
                    self.addChild(shade)
                }
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let position = touch.locationInNode(self)
            if let node = self.nodeAtPoint(position) as SKNode? {
                if(node.name != "shade") {
                    for child in self.children {
                        if child.name == "shade" {
                            child.removeFromParent()
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
            for touch in touches
            {
                let position = touch.locationInNode(self)
                let node = self.nodeAtPoint(position)
                
                if(node.name == "shade") {
                    node.removeFromParent()
                    let playGameScene = PlayerSelectGameScene(fileNamed: "PlayerSelectGameScene")
                    let transition = SKTransition.fadeWithColor(gameStartColor, duration: 1)
                    
                    playGameScene!.scaleMode = .AspectFill
                    self.view?.presentScene(playGameScene!, transition: transition)
                }
                
            }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /*Called Every Frame*/
    }
}
