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
    
    let playerHitCategory: UInt32 = 1
    let enemyHitCategory: UInt32 = 2
    
    let player = Sprite(color: spriteColor.green, hitCategory: 1)
    let enemy = Sprite(color: spriteColor.red, hitCategory: 2)
    
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
            let position = touch.locationInNode(self)
            let node = self.nodeAtPoint(position)
            
            location = touch.locationInNode(self)
            
            if(node.name == "gameover") {
                
                let startGameScene = StartGameScene(fileNamed: "StartGameScene")
                let transition = SKTransition.fadeWithColor(gameBackgroundColor, duration: 2)
                
                startGameScene!.scaleMode = .AspectFill
                self.view?.presentScene(startGameScene!, transition: transition)
                
            }
        }
        
        let projectile = Projectile(sprite: player)
        projectile.position = player.position
        projectile.setVelocity((location.y - projectile.position.y), dx: (location.x-projectile.position.x))
            
        self.addChild(projectile)
        
    }
    
    //------------------Collision Function------------------//
    func didBeginContact(contact: SKPhysicsContact) {
        
        //Projectile will be Body2 when hitting wall
        let body1 = contact.bodyA
        let body2 = contact.bodyB
        
        
        /************* Wall Collisions **************/
        if(body1.categoryBitMask == mapHitCategory || body2.categoryBitMask == mapHitCategory ) {
            if body2.node?.name == "projectile" {
                if let projectile = body2.node as! Projectile? {
                    if(projectile.getBounce() != 0) {
                        projectile.decBounce()
                    }
                    else {
                        projectile.explode?.position = projectile.position
                        self.addChild(projectile.explode!)
                        projectile.removeFromParent()
                    }
                }
            }
            else if body1.node?.name == "projectile" {
                if let projectile = body1.node as! Projectile? {
                    if(projectile.getBounce() != 0) {
                        projectile.decBounce()
                    }
                    else {
                        projectile.explode?.position = projectile.position
                        self.addChild(projectile.explode!)
                        projectile.removeFromParent()
                    }
                }
            }
        }
        
        /*********** All Other Collision **********/
        else {
            
            /***** Projectile-Projectile Collision *****/
            if body1.node?.name == "projectile" {
                if let projectile = body1.node as! Projectile? {
                    if body2.node?.name == "projectile" {
                        if let projectile2 = body2.node as! Projectile? {
                            //Explode Projectile 1
                            projectile.explode?.position = projectile.position
                            self.addChild(projectile.explode!)
                            //Explode Projectile 2
                            projectile2.explode?.position = projectile.position
                            self.addChild(projectile2.explode!)
                            //Remove Projectiles
                            projectile2.removeFromParent()
                            projectile.removeFromParent()
                        }
                    }
            /*********** Projectile-Sprite Collision ***********/
                    else {
                        if let sprite = body2.node as! Sprite? {
                            spriteGotShot(sprite, projectile: projectile)
                        }
                    }
                }
            }
        
            /*********** Projectile-Sprite Collision ***********/
            else if body2.node?.name == "projectile" {
                if let projectile = body2.node as! Projectile? {
                    if let sprite = body1.node as! Sprite? {
                        spriteGotShot(sprite, projectile: projectile)
                    }
                }
            }
            else {
                //Two Sprites Are Interacting
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    
    /*********** Sprite Contact with Projectile *************/
    
    func spriteGotShot(sprite: Sprite, projectile: Projectile) {
        
        if sprite.getColor() != projectile.getColor() {
            projectile.explode?.position = projectile.position
            self.addChild(projectile.explode!)
            projectile.removeFromParent()
            sprite.hit()
            
            if(sprite.getLife() == 0)
            {
                //Set Position of Explostion
                sprite.explode?.position = sprite.position
                //Explode
                self.addChild(sprite.explode!)
                sprite.removeFromParent()
                print("Game Over")
                //"Game Over" Overlay
                let overlay = SKSpriteNode(color: UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 0.85), size: self.size)
                let gameOver = SKSpriteNode(imageNamed: "gameover")
                overlay.zPosition = 100
                gameOver.zPosition = 101
                gameOver.name = "gameover"
                gameOver.position = CGPointMake(CGRectGetMaxX(self.frame)/2, CGRectGetMaxY(self.frame)/2)
                overlay.position = CGPointMake(CGRectGetMaxX(self.frame)/2, CGRectGetMaxY(self.frame)/2)
                self.addChild(overlay)
                self.addChild(gameOver)
            }
        }
    }
}