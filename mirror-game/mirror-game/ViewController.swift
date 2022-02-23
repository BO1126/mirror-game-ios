//
//  ViewController.swift
//  mirror-game
//
//  Created by 이정우 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    let playerView = UIView()
    let mirrorView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let baseview = baseView(frame: CGRect(x: 0, y: 300, width: Int(self.view.frame.width), height: Int(self.view.frame.height-300)))
        self.view.addSubview(baseview)
        
        playerView.frame = CGRect(x: 100, y: 270, width: 30, height: 30)
        playerView.backgroundColor = UIColor.green
        self.view.addSubview(playerView)
        
        mirrorView.frame = CGRect(x: Int(self.view.frame.maxX-200), y: 270, width: 30, height: 30)
        mirrorView.backgroundColor = UIColor.red
        self.view.addSubview(mirrorView)
    }
    
    
    
}

class baseView : UIView {
    let path = UIBezierPath()
    override func draw(_ rect: CGRect) {
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.maxX, y: 0))
        path.lineWidth = 10
        path.stroke()
    }
}

