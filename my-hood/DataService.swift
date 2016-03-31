//
//  DataService.swift
//  my-hood
//
//  Created by 蔡智斌 on 16/3/16.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import Foundation
import UIKit

class DataService{
    
    let KEY_POSTS = "posts"
    
    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts:[Post]{
        
        return _loadedPosts
    }
    
    func savePosts(){
        
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)//把数据储存到postsData
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    
    func loadPosts(){
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post]{
                _loadedPosts = postsArray
                
            }
            
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
        
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String//有UIXXX的地方就要import UIKit
    {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
        
    }
    
    func imageForPath(path:String) -> UIImage?{
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
        
    }
    
    func addPost(post: Post){
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    func documentsPathForFileName(name: String) -> String{//搜索文件名称得到路径储存到paths中（p.s：paths是一个数组）
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }

}
