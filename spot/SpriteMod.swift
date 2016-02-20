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

class Sprite {
    
    //------Member Properties-----//
    
    private var ammo = 50;
    private var colorOfSprite: spriteColor
    private var location: CGPoint
    
    init(color: spriteColor, xCord: CGFloat, yCord: CGFloat) {
        
        colorOfSprite = color
        location = CGPointMake(xCord, yCord)
        
    }
    
    init(color: spriteColor) {
        
        colorOfSprite = color
        location = CGPoint()
        
    }
    
    //------Member Functions-------//
    
    func setColor(color: spriteColor) {
        colorOfSprite = color;
    }
    
    func setLocationLeft() {
        //location = CGPointMake()
        //Will set to default location top left of screen
    }
    
    func setLocationRight() {
        //location = CGPointMake()
        //Will set to default location top right of the screen
    }
    
    func updateLocation(location: CGPoint) {
        
        self.location = location;
        
    }
    
    func shoot () {
        ammo--
    }
    
    //-----Get Functions------//
    
    func getLocation() -> CGPoint {
        return location;
    }
    
    func getAmmo() -> Int {
        return ammo;
    }
    
    func getColor() -> spriteColor {
        return colorOfSprite;
    }
    
}