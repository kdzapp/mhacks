//
//  GameScene.swift
//  spot
//
//  Created by Kyle Zappitell on 2/19/16.
//  Copyright (c) 2016 Kyle Zappitell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    let joystick = AnalogJoystick(diameters: (substrate: 130, stick: 70), colors: (substrate: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7), stick: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.5)), images: (nil))
    let player = Sprite(color: spriteColor.green)
    let enemy = Sprite(color: spriteColor.red)
    let gameBackgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1);
    
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
        self.physicsBody = gamePhysics
        
        joystick.position = CGPoint(x: 200, y: 265)
        
        //Create Map
        self.addChild(createMap())
        self.addChild(joystick)
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
        
        //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //sprite.runAction(SKAction.repeatActionForever(action)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        for child in self.children as [SKNode] {
//            if(child.name == "joystick")
//            {
//                self.removeChildrenInArray([child])
//            }
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        //Updated Every Frame
    }
}

//Create Maop Function

func createMap() -> SKNode {
    
    let viewer = SKNode()
    
    let wallH = Wall(width: 160, height: 50, xCord: 68, yCord: 460)
    viewer.addChild(wallH)
    let wallSqr = Wall(width: 150, height: 150, xCord: 200, yCord: 265)
    viewer.addChild(wallSqr)
    let wallV = Wall(width: 50, height: 345, xCord: 300, yCord: 615)
    viewer.addChild(wallV)
    let wallH2 = Wall(width: 200, height: 50, xCord: 375, yCord: 460)
    viewer.addChild(wallH2)
    let wallH3 = Wall(width: 200, height: 50, xCord: 540, yCord: 220)
    viewer.addChild(wallH3)
    let wallV2 = Wall(width: 50, height: 200, xCord: 500, yCord: 450)
    viewer.addChild(wallV2)
    let wallV3 = Wall(width: 50, height: 150, xCord: 650, yCord: 170)
    viewer.addChild(wallV3)
    let wallH4 = Wall(width: 200, height: 50, xCord: 755, yCord: 450)
    viewer.addChild(wallH4)
    let wallSqr2 = Wall(width: 150, height: 150, xCord: 850, yCord: 500)
    viewer.addChild(wallSqr2)
    let wallH5 = Wall(width: 200, height: 50, xCord: 920, yCord: 260)
    viewer.addChild(wallH5)
    let wallTopBorder = Wall(width: 1100, height: 10, xCord: 500, yCord: 679)
    viewer.addChild(wallTopBorder)
    let wallBottomBorder = Wall(width: 1100, height: 10, xCord: 500, yCord: 89)
    viewer.addChild(wallBottomBorder)
    
    return viewer
}
