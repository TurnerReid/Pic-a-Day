//
//  DateCollectionViewCell.swift
// Team 6: Pic-A-Day
// Developed by: Clifford
//List of Changes:
//  - Reduced the size of the radius when merging with master
//  - Reduced the line lineWidth after the radius reduction

//List of Known Bugs:
//  - Upon loading the simulation, the circle path on the date is not centred properly
//  - After changing the month, and going back to current month, the circle path appears to be centred correctly


import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var Circle: UIView!
    
    func DrawCircle() {
        
        let circleCenter = Circle.center
        
        //initializes the size and shape of the circle that is to be traced over the date in the collection view cell
        let circlePath = UIBezierPath(arcCenter: circleCenter, radius: (Circle.bounds.width/2 - 14), startAngle: -CGFloat.pi/2, endAngle: (2 * CGFloat.pi), clockwise: true)
        
        //defines the features of the circle path
        let CircleLayer = CAShapeLayer()
        CircleLayer.path = circlePath.cgPath
        CircleLayer.strokeColor = UIColor.red.cgColor
        CircleLayer.lineWidth = 1.5
        CircleLayer.strokeEnd = 0
        CircleLayer.fillColor = UIColor.clear.cgColor
        CircleLayer.lineCap = CAShapeLayerLineCap.round
        
        //sets the animation of the circle parh when loaded
        let Animation = CABasicAnimation(keyPath: "strokeEnd")
        Animation.duration = 1.5
        Animation.toValue = 1
        Animation.fillMode = CAMediaTimingFillMode.forwards
        Animation.isRemovedOnCompletion = false
        
        CircleLayer.add(Animation, forKey: nil)
        Circle.layer.addSublayer(CircleLayer)
        Circle.layer.backgroundColor = UIColor.clear.cgColor
        
    }
}
