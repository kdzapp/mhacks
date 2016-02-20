//
//  MapWall.swift
//  spot
//
//  Created by Kyle Zappitell on 2/17/16.
//  Copyright © 2016 Kyle Zappitell. All rights reserved.
//

import Foundation


struct size {
    
    var length = 0;
    var width = 0;
}

class Wall {
    
    var wallsize = size();
    
    func getLength() -> Int {
        return wallsize.length;
    }
    
    func getWidth() -> Int {
        return wallsize.width;
    }
    
    init(length: Int, width: Int) {
        wallsize.length = length;
        wallsize.width = width;
    }
    
}