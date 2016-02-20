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
    
    private var colorOfProjectile: spriteColor;
    let projectilePhysics = SKPhysicsBody(circleOfRadius: 8)
    
    init (sprite: Sprite) {
        
        colorOfProjectile = sprite.getColor();
        
        super.init(texture: sprite.getTexture(), color: UIColor(), size: CGSize(width: 20, height: 20))
        
        projectilePhysics.dynamic = true
        projectilePhysics.affectedByGravity = false
        self.physicsBody = projectilePhysics
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setVelocity(dy: CGFloat, dx: CGFloat) {
        projectilePhysics.velocity = CGVector(dx: dx*(0.5), dy: dy*(0.5))
    }
    
}