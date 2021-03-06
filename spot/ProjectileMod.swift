//
//  ProjectileMod.swift
//  spot
//
//  Created by Kyle Zappitell on 2/17/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import Foundation
import SpriteKit

class Projectile: SKSpriteNode {
    
    private var colorOfProjectile: spriteColor
    private var bounce = 1
    var projectileHitCategory: UInt32 = 0
    var explode = SKEmitterNode(fileNamed: "ParticleSplat")
    let projectilePhysics = SKPhysicsBody(circleOfRadius: 8)
    
    init (sprite: Sprite) {
        
        colorOfProjectile = sprite.getColor()
        explode?.particleTexture = sprite.getTexture()
        explode?.name = "ParticleExplosion"
        projectileHitCategory = sprite.spriteHitCategory
        
        super.init(texture: sprite.getTexture(), color: UIColor(), size: CGSize(width: 20, height: 20))
        
        self.name = "projectile"
        
        projectilePhysics.dynamic = true
        projectilePhysics.affectedByGravity = false
        projectilePhysics.density = 0
        projectilePhysics.mass = 0
        
        projectilePhysics.categoryBitMask = projectileHitCategory
        
        projectilePhysics.contactTestBitMask = mapHitCategory
        projectilePhysics.collisionBitMask = mapHitCategory
        self.physicsBody = projectilePhysics
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*-----------Setters----------*/
    
    func setVelocity(dy: CGFloat, dx: CGFloat, playerPos: CGPoint) {
        //Shoot Downward Fix
        if(dy < 0) {
            self.position.y = playerPos.y - 1
            self.position.x = playerPos.x
        }
        else {
            self.position.y = playerPos.y + 1
            self.position.x = playerPos.x
        }
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