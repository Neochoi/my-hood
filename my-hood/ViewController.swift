//
//  ViewController.swift
//  my-hood
//
//  Created by 蔡智斌 on 16/3/15.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {//part1
    
//    var posts = [Post]()//创建Post的数组//part1
    
    @IBOutlet weak var tableView : UITableView!//part1

    override func viewDidLoad() {//part1
        super.viewDidLoad()//part1
        
        tableView.delegate = self//part1
        tableView.dataSource = self//part1
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
        DataService.instance.loadPosts()
        
//        let post = Post(imagePath: "", title: "Post1", description: "no big deal")//part1
//        let post2 = Post(imagePath: "", title: "Post2", description: "no big problem")//part1
//        let post3 = Post(imagePath: "", title: "Post3", description: "no big deal too")//part1
//        
//        posts.append(post)//part1
//        posts.append(post2)//part1
//        posts.append(post3)//part1
//        
//        tableView.reloadData()//part1
        
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {//part1//行出现的次数，如果有2行，如果return 2的话就会变成4行//part1
        return 1//part1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//创建cell***//part1
        
        let post  = DataService.instance.loadedPosts[indexPath.row]//part1
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell{//part1
            
            cell.configureCell(post)//part1
            return cell//part1
            
        }
        else {//part1
            return PostCell()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {//part1//控制tableViewCell的高度
        return 99//part1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  //tableView行数//part1
        return DataService.instance.loadedPosts.count//part1
    }
    
    func onPostsLoaded(notif:AnyObject){
        tableView.reloadData()
    }

}

