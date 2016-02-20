//
//  SpriteMod.swift
//  spot
//
//  Created by Kyle Zappitell on 2/17/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import Foundation
import SpriteKit

//------Enums-------//

enum spriteColor {
    case blue
    case red
    case green
    case yellow
}

class Sprite: SKSpriteNode{
    
    //------Member Properties-----//
    
    private var ammo = 50;
    private var colorOfSprite: spriteColor
    var spriteTexture: SKTexture
    var spriteSize = CGSize(width: 100, height: 100)
    var spritePhysics = SKPhysicsBody(circleOfRadius: 40)
    
    init(color: spriteColor) {
        
        colorOfSprite = color
        
        //Load Sprite With Color
        switch colorOfSprite {
        case .blue:
            spriteTexture = SKTexture.init(imageNamed: "Sprite3")
            break
        case .red:
            spriteTexture = SKTexture.init(imageNamed: "Sprite2")
            break
        case .yellow:
            spriteTexture = SKTexture.init(imageNamed: "Sprite4")
            break
        case .green:
            spriteTexture = SKTexture.init(imageNamed: "Sprite1")
            break
        }
        
        super.init(texture: spriteTexture, color: UIColor(), size: spriteSize)
        
        //Physics
        spritePhysics.affectedByGravity = false;
        spritePhysics.dynamic = true
        self.physicsBody = spritePhysics

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------Member Functions-------//
    
    func setColor(color: spriteColor) {
        colorOfSprite = color;
    }
    
    func setLocationLeft() {
        self.position = CGPointMake(70, 605)
    }
    
    func setLocationRight() {
        self.position = CGPointMake(950, 170)
    }
    
    func updateLocation(location: CGPoint) {
        self.position = location;
    }
    
    func shoot () {
        ammo--
    }
    
    //-----Get Functions------//
    
    func getLocation() -> CGPoint {
        return self.position;
    }
    
    func getAmmo() -> Int {
        return ammo;
    }
    
    func getColor() -> spriteColor {
        return colorOfSprite;
    }
    
    func getTexture() -> SKTexture {
        return spriteTexture
    }
    
}