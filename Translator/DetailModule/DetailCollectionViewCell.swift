//
//  DetailCollectionViewCell.swift
//  Translator
//
//  Created by Ivan Zakharov on 8/9/21.
//

import Foundation
import UIKit
import Framezilla

class DetailCollectionViewCell: UICollectionViewCell {
    private struct Constants {
        static let meaningLabelLeftInset: CGFloat = 4
    }
    
    private let meaningLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let meaningImageView = UIImageView()
    
    private let borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        return view
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        add(borderView, view, meaningLabel, meaningImageView)
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
        
        meaningImageView.configureFrame { maker in
            maker.centerY()
                .right(inset: 10)
                .size(width: 50, height: 50)
        }
        
        view.configureFrame { maker in
            maker.top(inset: 5)
                .bottom(inset: 5)
                .right(inset: 2)
                .left(inset: 2)
        }
        
        borderView.configureFrame { maker in
            maker.top()
                .bottom()
                .right()
                .left()
        }
    }
    
    func refreshContent(_ text: String, imageUrl: String) {
        meaningLabel.text = text
        let urlString = "http:" + imageUrl
        let url = URL(string: urlString)
        self.meaningImageView.kf.setImage(with: url)
    }
}
