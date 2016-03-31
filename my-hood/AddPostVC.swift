//
//  AddPostVC.swift
//  my-hood
//
//  Created by 蔡智斌 on 16/3/16.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{//用UIImagePickerController就要用这两个继承

    @IBAction func CancelBtn(sender: AnyObject) {//part2***
        dismissViewControllerAnimated(true, completion: nil)//part2***
    }

    @IBAction func addPicBtnPressed(sender: UIButton!) {//part2***
        
        sender.setTitle("", forState: .Normal)//part2***//设置以后当点击按钮原字符可改变变成setTitle函数内“”中间的字符不如setTitle（“FUCK”）按钮的字符就会变成FUCK
        presentViewController(imagePicker, animated: true, completion: nil)//和imagePicker一起可以选取一个图片（已有的）
    }
    
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        
        if let title = titleField.text,let desc = descField.text,let img = postImg.image{
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)//图片路径
            let post = Post(imagePath: imgPath, title: title, description: desc)//根据数据创建post
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
            
        }
    }
    
    
    var imagePicker:UIImagePickerController!//用于获取图片
    ////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = postImg.frame.size.width/2//把方形改成原型//part2***
        postImg.clipsToBounds = true //默认是false如果不改就是方形//part2***
        
        imagePicker = UIImagePickerController()//创建一个实例
        imagePicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {//告诉imagePicker用户选了一个图片
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    
    /////////////////////////////////////
    @IBOutlet weak var titleField: UITextField!//part2***
    @IBOutlet weak var postImg: UIImageView!//part2***

    @IBOutlet weak var descField: UITextField!//part2***
}
