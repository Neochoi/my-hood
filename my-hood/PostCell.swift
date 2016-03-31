//
//  PostCell.swift
//  my-hood
//
//  Created by 蔡智斌 on 16/3/15.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {//part1
    
    @IBOutlet weak var postImg: UIImageView!//part1
    @IBOutlet weak var titleLbl: UILabel!//part1
    @IBOutlet weak var descLbl: UILabel!//part1

    override func awakeFromNib() {//part1
        super.awakeFromNib()//part1
        
        postImg.layer.cornerRadius = postImg.frame.size.width/2//part2***
        postImg.clipsToBounds = true//part2***
    }
    
    func configureCell(post:Post){//part1
        titleLbl.text = post.title//part1
        descLbl.text = post.postDesc//part1
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        
    }

}
