//
//  GameScene.swift
//  spot
//
//  Created by Kyle Zappitell on 2/19/16.
//  Copyright (c) 2016 Kyle Zappitell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //Set Up Players
    let player = Sprite(color: spriteColor.blue)
    let enemy = Sprite(color: spriteColor.red)
    let gameBackgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1);
    
    override func didMoveToView(view: SKView) {
        /*Set Up Scene Here*/
        
        //Set Background Color
        self.scene?.backgroundColor = gameBackgroundColor

        
        player.setLocationLeft()
        enemy.setLocationRight()
        
        self.addChild(player)
        self.addChild(enemy)
        
        //Physical Boarder
        let gamePhysics = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = gamePhysics
        
        let wall = Wall(width: 60, height: 120, xCord: 1, yCord: 1)
        wall.position = view.center
        
        self.addChild(wall)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let projectile = Projectile(sprite: player)
            
            projectile.position = player.position
            projectile.setVelocity((location.y - projectile.position.y), dx: (location.x-projectile.position.x))
            
            self.addChild(projectile)
            
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            //sprite.runAction(SKAction.repeatActionForever(action))
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            player.position = location
        }
    }
    
    //override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //    <#code#>
    //}
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
