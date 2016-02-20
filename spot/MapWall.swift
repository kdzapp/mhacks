//
//  MapWall.swift
//  spot
//
//  Created by Kyle Zappitell on 2/17/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import Foundation
import SpriteKit

class Wall: SKSpriteNode {
    private var location: CGPoint
    
    init(var color: UIColor, xCord: CGFloat, yCord: CGFloat) {
        
        color = UIColor.blackColor()
        location = CGPointMake(xCord, yCord)
        
        super.init(texture: SKTexture.init(), color: UIColor.blackColor(), size: CGSize.init(width: 60, height: 120))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}