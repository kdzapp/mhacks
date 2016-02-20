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
    
    override func didMoveToView(view: SKView) {
        //Background Color
        self.scene?.backgroundColor = gameBackgroundColor
        
        //Create Scene
        let headerText = SKSpriteNode(imageNamed: "header")
        headerText.size = CGSize(width: 744, height: 297)
        headerText.position = CGPoint(x: 500,y: 490)
        
        let playButton = SKSpriteNode(texture: SKTexture(imageNamed: "play"), color: UIColor(), size: CGSize(width: 200, height: 200))
        playButton.position = CGPoint(x: 500,y: 230)
        playButton.name = "play";
        
        self.addChild(headerText)
        self.addChild(playButton)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
            for touch in touches
            {
                let position = touch.locationInNode(self)
                let node = self.nodeAtPoint(position)
                
                if(node.name == "play") {
                    let playGameScene = PlayerSelectGameScene(fileNamed: "PlayerSelectGameScene")
                    let transition = SKTransition()
                    
                    playGameScene!.scaleMode = .AspectFill
                    
                    self.view?.presentScene(playGameScene!, transition: transition)
                }
                
            }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
