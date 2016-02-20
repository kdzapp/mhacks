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
    private var location: CGPoint;
    private var touchLocation: CGPoint;
    
    init (sprite: Sprite, touch: CGPoint) {
        
        colorOfProjectile = sprite.getColor();
        self.location = sprite.getLocation();
        touchLocation = touch;
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLocation() {
        //location.x
        //location.y
    }
}