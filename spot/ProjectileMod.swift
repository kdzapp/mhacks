//
//  ProjectileMod.swift
//  spot
//
//  Created by Kyle Zappitell on 2/17/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import Foundation
import SpriteKit

let projectileHitCategory: UInt32 = 1

class Projectile: SKSpriteNode {
    
    private var colorOfProjectile: spriteColor
    private var bounce = 1
    let projectilePhysics = SKPhysicsBody(circleOfRadius: 8)
    
    init (sprite: Sprite) {
        
        colorOfProjectile = sprite.getColor();
        
        super.init(texture: sprite.getTexture(), color: UIColor(), size: CGSize(width: 20, height: 20))
        
        projectilePhysics.dynamic = true
        projectilePhysics.affectedByGravity = false
        
        projectilePhysics.categoryBitMask = projectileHitCategory
        projectilePhysics.contactTestBitMask = mapHitCategory
        projectilePhysics.collisionBitMask = mapHitCategory
        self.physicsBody = projectilePhysics
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*-----------Setters----------*/
    
    func setVelocity(dy: CGFloat, dx: CGFloat) {
        
        projectilePhysics.velocity = CGVector(dx: dx*3, dy: dy*3)
    }
    
    func decBounce() {
        bounce--;
    }
    
    /*-----------Getters----------*/
    
    func getColor() -> spriteColor {
        return colorOfProjectile
    }
    
    func getBounce() -> Int {
        return bounce
    }
    
}