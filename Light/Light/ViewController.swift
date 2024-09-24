//
//  ViewController.swift
//  Light
//
//  Created by Landyn on 9/14/24.
//


//import UIKit
//
//class ViewController: UIViewController {
//
//    var lightOn = true
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//        updateUI()
//
//    }
//    fileprivate func updateUI() {
//        view.backgroundColor = lightOn ? .white : .black
//    }
//
//    @IBAction func buttonPressed(_ sender: Any) {
//        lightOn.toggle()
//        updateUI()
//    }
//}


import UIKit

class ViewController: UIViewController {
    
    var lightOn = false
    var snakeView: SnakeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSnakeView()
        updateUI()
    }
    
    fileprivate func setupSnakeView() {
        snakeView = SnakeView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        snakeView.center = view.center
        view.addSubview(snakeView)
    }
    
    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
        animateSnake()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
    fileprivate func animateSnake() {
        if lightOn {
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
                self.snakeView.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.snakeView.alpha = 1
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.snakeView.transform = .identity
                self.snakeView.alpha = 0.3
            }, completion: nil)
        }
    }
}

class SnakeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSnake()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSnake()
    }
    
    private func setupSnake() {
        backgroundColor = .clear
        alpha = 0.3
        
        // Snake head (more triangular shape for a cobra-like appearance)
        let headPath = UIBezierPath()
        headPath.move(to: CGPoint(x: 100, y: 20))
        headPath.addCurve(to: CGPoint(x: 180, y: 100), controlPoint1: CGPoint(x: 160, y: 40), controlPoint2: CGPoint(x: 180, y: 70))
        headPath.addCurve(to: CGPoint(x: 100, y: 180), controlPoint1: CGPoint(x: 180, y: 130), controlPoint2: CGPoint(x: 160, y: 160))
        headPath.addCurve(to: CGPoint(x: 20, y: 100), controlPoint1: CGPoint(x: 40, y: 160), controlPoint2: CGPoint(x: 20, y: 130))
        headPath.addCurve(to: CGPoint(x: 100, y: 20), controlPoint1: CGPoint(x: 20, y: 70), controlPoint2: CGPoint(x: 40, y: 40))
        headPath.close()
        
        let headLayer = CAShapeLayer()
        headLayer.path = headPath.cgPath
        headLayer.fillColor = UIColor.systemGreen.cgColor
        layer.addSublayer(headLayer)
        
        // Left eye (slit)
        let leftEyePath = UIBezierPath()
        leftEyePath.move(to: CGPoint(x: 60, y: 70))
        leftEyePath.addLine(to: CGPoint(x: 80, y: 90))
        leftEyePath.move(to: CGPoint(x: 60, y: 90))
        leftEyePath.addLine(to: CGPoint(x: 80, y: 70))
        
        let leftEyeLayer = CAShapeLayer()
        leftEyeLayer.path = leftEyePath.cgPath
        leftEyeLayer.strokeColor = UIColor.black.cgColor
        leftEyeLayer.lineWidth = 3
        leftEyeLayer.lineCap = .round
        layer.addSublayer(leftEyeLayer)
        
        // Right eye (slit)
        let rightEyePath = UIBezierPath()
        rightEyePath.move(to: CGPoint(x: 120, y: 70))
        rightEyePath.addLine(to: CGPoint(x: 140, y: 90))
        rightEyePath.move(to: CGPoint(x: 120, y: 90))
        rightEyePath.addLine(to: CGPoint(x: 140, y: 70))
        
        let rightEyeLayer = CAShapeLayer()
        rightEyeLayer.path = rightEyePath.cgPath
        rightEyeLayer.strokeColor = UIColor.black.cgColor
        rightEyeLayer.lineWidth = 3
        rightEyeLayer.lineCap = .round
        layer.addSublayer(rightEyeLayer)
        
        // Mouth with fangs
        let mouthPath = UIBezierPath()
        mouthPath.move(to: CGPoint(x: 70, y: 130))
        mouthPath.addQuadCurve(to: CGPoint(x: 130, y: 130), controlPoint: CGPoint(x: 100, y: 150))
        
        let mouthLayer = CAShapeLayer()
        mouthLayer.path = mouthPath.cgPath
        mouthLayer.fillColor = UIColor.clear.cgColor
        mouthLayer.strokeColor = UIColor.black.cgColor
        mouthLayer.lineWidth = 3
        layer.addSublayer(mouthLayer)
        
        // Left fang
        let leftFangPath = UIBezierPath()
        leftFangPath.move(to: CGPoint(x: 80, y: 130))
        leftFangPath.addLine(to: CGPoint(x: 90, y: 150))
        leftFangPath.addLine(to: CGPoint(x: 100, y: 130))
        
        let leftFangLayer = CAShapeLayer()
        leftFangLayer.path = leftFangPath.cgPath
        leftFangLayer.fillColor = UIColor.white.cgColor
        leftFangLayer.strokeColor = UIColor.black.cgColor
        leftFangLayer.lineWidth = 1
        layer.addSublayer(leftFangLayer)
        
        // Right fang
        let rightFangPath = UIBezierPath()
        rightFangPath.move(to: CGPoint(x: 100, y: 130))
        rightFangPath.addLine(to: CGPoint(x: 110, y: 150))
        rightFangPath.addLine(to: CGPoint(x: 120, y: 130))
        
        let rightFangLayer = CAShapeLayer()
        rightFangLayer.path = rightFangPath.cgPath
        rightFangLayer.fillColor = UIColor.white.cgColor
        rightFangLayer.strokeColor = UIColor.black.cgColor
        rightFangLayer.lineWidth = 1
        layer.addSublayer(rightFangLayer)
    }
}
