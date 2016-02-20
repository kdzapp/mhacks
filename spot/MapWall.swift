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

/*let wallH = Wall(width: 160, height: 50, xCord: 68, yCord: 460)
self.addChild(wallH)
let wallSqr = Wall(width: 150, height: 150, xCord: 200, yCord: 265)
self.addChild(wallSqr)
let wallV = Wall(width: 50, height: 345, xCord: 300, yCord: 615)
self.addChild(wallV)
let wallH2 = Wall(width: 200, height: 50, xCord: 375, yCord: 460)
self.addChild(wallH2)
let wallH3 = Wall(width: 200, height: 50, xCord: 540, yCord: 220)
self.addChild(wallH3)
let wallV2 = Wall(width: 50, height: 200, xCord: 500, yCord: 450)
self.addChild(wallV2)
let wallV3 = Wall(width: 50, height: 150, xCord: 650, yCord: 170)
self.addChild(wallV3)
let wallH4 = Wall(width: 200, height: 50, xCord: 755, yCord: 450)
self.addChild(wallH4)
let wallSqr2 = Wall(width: 150, height: 150, xCord: 850, yCord: 500)
self.addChild(wallSqr2)
let wallH5 = Wall(width: 200, height: 50, xCord: 920, yCord: 260)
self.addChild(wallH5)
*/
        