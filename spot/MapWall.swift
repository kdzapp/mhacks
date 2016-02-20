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
    private var wallColor = UIColor.blackColor()
    private var wallSize = CGSize()
    
    init(width: CGFloat, height: CGFloat, xCord: CGFloat, yCord: CGFloat) {
        wallSize.width = width
        wallSize.height = height
        
        location = CGPointMake(xCord, yCord)
        super.init(texture: nil, color: wallColor, size: wallSize)
        
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