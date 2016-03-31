//
//  Post.swift
//  my-hood
//
//  Created by 蔡智斌 on 16/3/15.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import Foundation
class Post: NSObject, NSCoding {
    private var _imagePath:String!//part1
    private var _title:String!//part1
    private var _postDesc:String!//part1
    
    var imagePath:String{//part1
        
        
        return _imagePath//part1
        
    }
    
    var title:String{//part1
        
        return _title//part1
    }
    
    var postDesc:String{//part1
        
        return _postDesc//part1
    }
    
    init(imagePath: String,title: String,description: String){//part1
        self._imagePath = imagePath//part1
        self._title = title//part1
        self._postDesc = description//part1
    }
    
        override init() {
            
        
    }
    
    required convenience init?(coder aDecoder:NSCoder){
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("descriptions") as? String
        
    }//如果没有这一段会出现“Type 'Post' does not conform to protocol 'NSCoding'“
    
    func encodeWithCoder(aCoder:NSCoder){
        aCoder.encodeObject(self._postDesc, forKey: "descriptions")
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        
    }//如果没有这一段会出现“Type 'Post' does not conform to protocol 'NSCoding'“
        
    
    
    
}
