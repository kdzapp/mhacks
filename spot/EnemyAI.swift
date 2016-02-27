//
//  EnemyAI.swift
//  spot
//
//  Created by Mike Wiitala on 2/26/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

func moveTowardPlayer(player: Sprite, enemy: Sprite) -> CGPoint {
    var moveEnemy: CGPoint
    moveEnemy = CGPointMake(0, 0)
    moveEnemy.y = (enemy.position.y + ((player.position.y - enemy.position.y) / 100 ))
    moveEnemy.x = (enemy.position.x + ((player.position.x - enemy.position.x) / 100 ))
    
    return moveEnemy
    
}



func moveAwayFromPlayer(player: Sprite, enemy: Sprite) -> CGPoint {
    var moveEnemy: CGPoint
    moveEnemy = CGPointMake(0, 0)
    moveEnemy.y = (enemy.position.y - ((player.position.y - enemy.position.y) / 100 ))
    moveEnemy.x = (enemy.position.x - ((player.position.x - enemy.position.x) / 100 ))
    
    return moveEnemy
    
}

func enemyProjectile(player: Sprite, enemy: Sprite) -> Projectile {
    
    let projectile = Projectile(sprite: enemy)
    var location: CGPoint
    location = player.position
    
    projectile.setVelocity((location.y - enemy.position.y), dx: (location.x - enemy.position.x), playerPos: enemy.position)
    
    return projectile
    
}

/*func clearLineOfSight(player: Sprite, enemy: Sprite) -> Bool {
let hieght = Double(player.position.x - enemy.position.x)
let width = Double(player.position.y - enemy.position.y)
let hypotenuse = CGFloat(sqrt(pow(hieght, 2) + pow(width, 2)))
let lineOfSight = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(3, hypotenuse))
return false
}*/
//REMOVE
//self.enemy.position = moveTowardPlayer(self.player, enemy: self.enemy)
//self.addChild(enemyProjectile(self.player, enemy: self.enemy))

