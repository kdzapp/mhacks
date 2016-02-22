//
//  Maps.swift
//  spot
//
//  Created by Kyle Zappitell on 2/22/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import SpriteKit

//Create Map Functions

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

func createMap2() -> SKNode {
    let viewer = SKNode()
    
    let wallSqr0 = Wall(width: 150, height: 150, xCord: 200, yCord: 510)
    viewer.addChild(wallSqr0)
    let wallSqr1 = Wall(width: 150, height: 150, xCord: 500, yCord: 510)
    viewer.addChild(wallSqr1)
    let wallSqr2 = Wall(width: 150, height: 150, xCord: 800, yCord: 510)
    viewer.addChild(wallSqr2)
    let wallSqr3 = Wall(width: 150, height: 150, xCord: 200, yCord: 260)
    viewer.addChild(wallSqr3)
    let wallSqr4 = Wall(width: 150, height: 150, xCord: 500, yCord: 260)
    viewer.addChild(wallSqr4)
    let wallSqr5 = Wall(width: 150, height: 150, xCord: 800, yCord: 260)
    viewer.addChild(wallSqr5)
    let wallTopBorder = Wall(width: 1100, height: 10, xCord: 500, yCord: 679)
    viewer.addChild(wallTopBorder)
    let wallBottomBorder = Wall(width: 1100, height: 10, xCord: 500, yCord: 89)
    viewer.addChild(wallBottomBorder)
    
    return viewer
}

func createMap3() -> SKNode {
    let viewer = SKNode()
    let angle: CGFloat = CGFloat(M_PI)
    let rotate = SKAction.rotateByAngle(angle, duration: 2)
    let repeateAction = SKAction.repeatActionForever(rotate)
    
    let wallTopLeft = Wall(width: 180, height: 20, xCord: 205, yCord: 520)
    wallTopLeft.zRotation = 0.78
    viewer.addChild(wallTopLeft)
    let wallBottomLeft = Wall(width: 180, height: 20, xCord: 205, yCord: 245)
    wallBottomLeft.zRotation = -0.78
    viewer.addChild(wallBottomLeft)
    let wallTopRight = Wall(width: 180, height: 20, xCord: 800, yCord: 520)
    wallTopRight.zRotation = -0.78
    viewer.addChild(wallTopRight)
    let wallBottomRight = Wall(width: 180, height: 20, xCord: 800, yCord: 245)
    wallBottomRight.zRotation = 0.78
    viewer.addChild(wallBottomRight)
    let wallSqr = Wall(width: 120, height: 120, xCord: 500, yCord: 380)
    wallSqr.runAction(repeateAction, withKey: "rotate")
    viewer.addChild(wallSqr)
    let wallTopBorder = Wall(width: 1100, height: 10, xCord: 500, yCord: 679)
    viewer.addChild(wallTopBorder)
    let wallBottomBorder = Wall(width: 1100, height: 10, xCord: 500, yCord: 89)
    viewer.addChild(wallBottomBorder)
    
    //let changeColorAction = SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 0.08, duration: 1.5)
    // wallSqr.runAction(changeColorAction) {
    //     wallSqr.wallColor = UIColor.redColor()
    //}
    
    return viewer
}

/*func createMap4() -> SKNode {
let viewer = SKNode()
let distance: CGVector = CGVectorMake(0, 100)
let reverse: CGVector = CGVectorMake(0, -100)
let translate = SKAction.moveBy(distance, duration: 1.5)
let translateBack = SKAction.moveBy(reverse, duration: 1.5)
let repeateAction = SKAction.repeatAction(translate, count: 400)
let repeatActionBack = SKAction.repeatAction(translateBack, count: 400)

let wallSqr = Wall(width: 120, height: 120, xCord: 500, yCord: 380)
wallSqr.runAction(repeateAction, withKey: "translate")
wallSqr.runAction(repeatActionBack, withKey: "reverse")
viewer.addChild(wallSqr)
return viewer
}*/

