//
//  TJQDraggingScrollView.swift
//  Pods
//
//  Created by TJQ on 16/8/11.
//
//

import UIKit


public class TJQParallaxTableViewController: UITableViewController {
    
    var topImageHeight: CGFloat = 200
    var topImage: UIImageView!
    var offsetRatio: CGFloat = 0.1
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup ()
    {
        self.automaticallyAdjustsScrollViewInsets = false
        topImage = UIImageView(frame: CGRect(x: 0, y:-topImageHeight, width: view.bounds.width, height: topImageHeight))
        topImage.image = UIImage(named: "image")
        topImage.contentMode = .ScaleAspectFill
        topImage.clipsToBounds = true
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(topImageHeight, 0, 0, 0)
        tableView.addSubview(topImage)
    }
    
    func setImagewithName (name: String)
    {
        topImage.image = UIImage(named: name)
    }
    
    func setImageHeight (height: CGFloat)
    {
        topImageHeight = height
        topImage.frame = CGRect(x: 0, y:-topImageHeight, width: view.bounds.width, height: topImageHeight)
        tableView.contentInset = UIEdgeInsetsMake(topImageHeight, 0, 0, 0)
    }
    
    func setDraggingRatio (ratio: CGFloat)
    {
        self.offsetRatio = ratio
    }
    
    public override func scrollViewDidScroll(scrollView: UIScrollView)
    {
        
        let offY = scrollView.contentOffset.y
        if offY < -topImageHeight {
            topImage.frame.origin.y = offY
            topImage.frame.size.height = topImageHeight - (topImageHeight + offY) * offsetRatio
        }
        print("\(offY)  height = \(-offY * offsetRatio)")
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

