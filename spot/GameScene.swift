//
//  GameScene.swift
//  spot
//
//  Created by Kyle Zappitell on 2/19/16.
//  Copyright (c) 2016 Kyle Zappitell. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    let joystick = AnalogJoystick(diameters: (substrate: 130, stick: 70), colors: (substrate: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7), stick: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.5)), images: (nil))
    let player = Sprite(color: spriteColor.green)
    let enemy = Sprite(color: spriteColor.red)
    let gameBackgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)

    override func didMoveToView(view: SKView) {
        
        //Set Background Color
        self.scene?.backgroundColor = gameBackgroundColor
        joystick.name = "joystick"
        
        
        player.setLocationLeft()
        enemy.setLocationRight()
        
        self.addChild(player)
        self.addChild(enemy)
        
        joystick.trackingHandler = { jdata in
            self.player.position = CGPointMake((self.player.position.x + jdata.velocity.x*0.1), (self.player.position.y + jdata.velocity.y*0.1))
        }
        
        //Physical Boarder
        let gamePhysics = SKPhysicsBody(edgeLoopFromRect: self.frame)
        gamePhysics.categoryBitMask = mapHitCategory
        self.physicsBody = gamePhysics
        
        joystick.position = CGPoint(x: 200, y: 265)
        
        //Create Map
        self.addChild(createMap())
        self.addChild(joystick)
        //Delegate Contact
        physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        var location = CGPoint(x: 0, y: 0)
        
        for touch in touches {
            location = touch.locationInNode(self)
        }
        
        let projectile = Projectile(sprite: player)
        projectile.position = player.position
        projectile.setVelocity((location.y - projectile.position.y), dx: (location.x-projectile.position.x))
            
        self.addChild(projectile)
        
    }
    
    //Collision Function
    func didBeginContact(contact: SKPhysicsContact) {
        
        //Projectile will be Body2 when hitting wall
        let body1 = contact.bodyA
        let body2 = contact.bodyB
        
        if(body1.categoryBitMask == mapHitCategory && body2.categoryBitMask == projectileHitCategory)
        {
            if let projectile = body2.node as! Projectile?
            {
                if(projectile.getBounce() != 0) {
                    projectile.decBounce()
                }
                else {
                    projectile.explode?.position = projectile.position
                    self.addChild(projectile.explode!)
                    projectile.removeFromParent()
                    //Explode
                }
            }
        }
        else if(body1.categoryBitMask == spriteHitCategory && body2.categoryBitMask == projectileHitCategory)
        {
            let sprite = body1.node as! Sprite?
            let projectile = body2.node as! Projectile?
            if (sprite != nil && projectile != nil)  {
            //If the projectile is NOT from the Sprite who made it...
                if(sprite!.getColor() != projectile!.getColor()) {
                
                    projectile!.explode?.position = projectile!.position
                    self.addChild(projectile!.explode!)
                    projectile!.removeFromParent()
                    sprite!.hit()
                
                    if(sprite!.getLife() == 0)
                    {
                        //Set Position of Explostion
                        sprite?.explode?.position = (sprite?.position)!
                        //Explode
                        self.addChild(sprite!.explode!)
                        sprite!.removeFromParent()
                        print("Game Over")
                        //Figure out "Game Over" Overlay
                        //let startGameScene = StartGameScene(fileNamed: "StartGameScene")
                        //let transition = SKTransition.crossFadeWithDuration(2)
                        
                        //startGameScene!.scaleMode = .AspectFill
                        //self.view?.presentScene(startGameScene!, transition: transition)
                    }
                }
            }
        }
        //If a projectile hits another projectile
        else if(body1.categoryBitMask == projectileHitCategory && body2.categoryBitMask == projectileHitCategory) {
            if let _ = body1.node {
                body1.node?.removeFromParent()
            }
            if let _ = body2.node {
                body2.node?.removeFromParent()
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
    }
}