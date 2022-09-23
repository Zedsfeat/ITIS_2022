import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = false

let view = UIView()
let layer = view.layer
let mainLayer = CALayer()
let textLayer = CATextLayer()
let backgroundLayer = CAGradientLayer()

// View and his layer
view.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 450))
view.backgroundColor = .systemBlue

// Text layer
textLayer.frame = CGRect(x: 20, y: 30, width: 260, height: 400)
textLayer.fontSize = 60
textLayer.alignmentMode = .center
textLayer.string = "Have a madness birthday ❤️"
textLayer.isWrapped = true

textLayer.foregroundColor = UIColor.systemPink.cgColor

// Main layer
mainLayer.frame = CGRect(x: view.center.x - 150,
                           y: 50,
                           width: 300,
                           height: 350)
mainLayer.backgroundColor = UIColor.white.cgColor
mainLayer.cornerRadius = 25


// Background layer
backgroundLayer.startPoint = .zero
backgroundLayer.endPoint = CGPoint(x: 1, y: 4)
backgroundLayer.colors = [
    UIColor.red.cgColor,
    UIColor.purple.cgColor,
    UIColor.systemPink.cgColor
]
backgroundLayer.frame = layer.bounds


layer.addSublayer(backgroundLayer)
layer.addSublayer(mainLayer)
mainLayer.addSublayer(textLayer)

PlaygroundPage.current.liveView = view


