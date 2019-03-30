//
//  ViewController.swift
//  ToyStoryScrollView
//
//  Created by Chang Sophia on 3/13/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headScrollView: UIScrollView!
    @IBOutlet weak var bodyScrollView: UIScrollView!
    @IBOutlet weak var footScrollView: UIScrollView!
    
    let head = ["Woody", "Jessie","Aliens","Barbie","Buzz","Evil Man", "Hamm","Lotso", "Mr. Potato Head", "Mrs. Potato Head", "Old Man", "Red Heart", "Rex", "Slinky"]
    let body = ["Woody", "Jessie", "Aliens","Barbie","Buzz","Evil Man", "Hamm","Lotso", "Mr. Potato Head", "Mrs. Potato Head", "Old Man", "Red Heart", "Rex", "Slinky"]
    let foot = ["Woody", "Jessie", "Aliens","Barbie","Buzz","Evil Man", "Hamm","Lotso", "Mr. Potato Head", "Mrs. Potato Head", "Old Man", "Red Heart", "Rex", "Slinky", ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let imageWidth = headScrollView.frame.width
        
        //contentSize 滾動區域的大小；CGSize 指定區域大小
        
        headScrollView.contentSize = CGSize(width: imageWidth*14, height: headScrollView.frame.height)
        bodyScrollView.contentSize = CGSize(width: imageWidth*14, height: bodyScrollView.frame.height)
        footScrollView.contentSize = CGSize(width: imageWidth*14, height: footScrollView.frame.height)
        
        //CGRect定義出UIView的矩形範圍，ClipToBounds 超出視界的圖片修剪掉
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        var z: CGFloat = 0
      
        for i in 0...13{
            let frame1 = CGRect(x:x, y:0, width:imageWidth, height: headScrollView.frame.height*3)
            let frame2 = CGRect(x:x, y:-(bodyScrollView.frame.height), width:imageWidth, height: bodyScrollView.frame.height*3)
            let frame3 = CGRect(x:x, y:-(footScrollView.frame.height)*2, width:imageWidth, height: footScrollView.frame.height*3)
            let imageView1 = UIImageView(frame: frame1)
            let imageView2 = UIImageView(frame: frame2)
            let imageView3 = UIImageView(frame: frame3)
            imageView1.clipsToBounds = true
            imageView2.clipsToBounds = true
            imageView3.clipsToBounds = true
            imageView1.image = UIImage(named: head[i])
            imageView2.image = UIImage(named: body[i])
            imageView3.image = UIImage(named: foot[i])
            headScrollView.addSubview(imageView1)
            bodyScrollView.addSubview(imageView2)
            footScrollView.addSubview(imageView3)
            x = x + imageWidth
            y = y + imageWidth
            z = z + imageWidth
            
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats:true) { (_) in
            var offsetX = self.headScrollView.contentOffset.x + self.headScrollView.frame.width
            if offsetX == self.headScrollView.contentSize.width {
                offsetX = 0
            }
            self.headScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (_) in
            var offsetX = self.bodyScrollView.contentOffset.x + self.bodyScrollView.frame.width
            if offsetX == self.bodyScrollView.contentSize.width {
                offsetX = 0
            }
            self.bodyScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
            
        }
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (_) in
            var offsetX = self.footScrollView.contentOffset.x + self.footScrollView.frame.width
            if offsetX == self.footScrollView.contentSize.width {
                offsetX = 0
            }
            self.footScrollView.setContentOffset(CGPoint(x: offsetX, y:0), animated: true)
        }

}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

