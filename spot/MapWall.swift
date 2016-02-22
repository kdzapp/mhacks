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
    private var wallColor = UIColor.whiteColor()
    private var wallSize = CGSize()
    var wallPhysics: SKPhysicsBody
    
    init(width: CGFloat, height: CGFloat, xCord: CGFloat, yCord: CGFloat) {
        wallSize.width = width
        wallSize.height = height
        
        location = CGPoint(x: xCord, y: yCord)
        wallPhysics = SKPhysicsBody(rectangleOfSize: wallSize)
        super.init(texture: nil, color: wallColor, size: wallSize)
        
        self.position = location
        
        //Physics
        wallPhysics.dynamic = false
        self.physicsBody = wallPhysics
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getWidth() -> CGFloat {
        return wallSize.width;
    }
    
    func getHeight() -> CGFloat {
        return wallSize.height;
    }
    
}
        