//
//  Copyright © 2021 ReshetovE. All rights reserved.
//

import UIKit

final class BorderedView: UIView {

    var path: UIBezierPath? {
        didSet {
            setNeedsDisplay()
        }
    }

    var borderColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }

    var borderWidth: CGFloat = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    

    override func draw(_ rect: CGRect) {
        let path = self.path ?? UIBezierPath(rect: bounds)
        backgroundColor?.setFill()
        path.lineWidth = borderWidth
        borderColor.setStroke()
        path.stroke()
    }
}
