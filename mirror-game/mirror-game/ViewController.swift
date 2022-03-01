//
//  ViewController.swift
//  mirror-game
//
//  Created by 이정우 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var longPressGestureRecognizer : UILongPressGestureRecognizer!
    
    let playerView = UIView()
    let mirrorView = UIView()
    var timer = Timer()
    
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
        longPressGestureRecognizer.minimumPressDuration = 0.01
    }
    
    @IBAction func longPressView(){
        guard let ges = longPressGestureRecognizer else { return }
        
        switch ges.state{
        case .began:
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(hold), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer.invalidate()
        default:
            break
        }
    }
    
    @objc func hold(){
        let tapLocation = longPressGestureRecognizer.location(in: self.view)
        if tapLocation.x < (self.view.frame.maxX/2){
            playerView.frame = CGRect(x: (playerView.frame.minX-2), y: playerView.frame.minY, width: 30, height: 30)
            mirrorView.frame = CGRect(x: (mirrorView.frame.minX+2), y: mirrorView.frame.minY, width: 30, height: 30)
        }else{
            playerView.frame = CGRect(x: (playerView.frame.minX+2), y: playerView.frame.minY, width: 30, height: 30)
            mirrorView.frame = CGRect(x: (mirrorView.frame.minX-2), y: mirrorView.frame.minY, width: 30, height: 30)
        }
    }
    
    @IBAction func tapTwoFingersView(){
        UIView.animate(withDuration: 0.7, animations: {
            self.playerView.frame = CGRect(x: self.playerView.frame.minX, y: (self.playerView.frame.minY-170), width: 30, height: 30)
            self.mirrorView.frame = CGRect(x: self.mirrorView.frame.minX, y: (self.mirrorView.frame.minY-170), width: 30, height: 30)
        }, completion: { finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.playerView.frame = CGRect(x: self.playerView.frame.minX, y: (self.playerView.frame.minY+170), width: 30, height: 30)
                self.mirrorView.frame = CGRect(x: self.mirrorView.frame.minX, y: (self.mirrorView.frame.minY+170), width: 30, height: 30)
            })
        })
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

