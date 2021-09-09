//
//  StackView.swift
//  City
//
//  Created by Ivan Zakharov on 20/8/21.
//

import Foundation
import UIKit
import Framezilla

class SearchCollectionViewCell: UICollectionViewCell {
    private struct Constants {
        static let meaningLabelLeftInset: CGFloat = 4
    }
    
    private let meaningLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemBlue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        add(view, meaningLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        meaningLabel.configureFrame { maker in
            maker.centerY()
                .left(inset: Constants.meaningLabelLeftInset)
                .sizeToFit()
        }
        
        view.configureFrame { maker in
            maker.top()
                .bottom()
                .right()
                .left()
        }
    }
    
    func refreshContent(_ text: String) {
        meaningLabel.text = text
    }
}
