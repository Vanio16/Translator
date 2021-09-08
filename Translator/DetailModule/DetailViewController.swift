//
//  DetailViewController.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation
import UIKit
import Framezilla

protocol DetailViewOutput {
    
}

final class DetailViewController: UIViewController {
    
    private struct Constants {
        static let headerImageHeight: CGFloat = 60
        static let backButtonInsetLeft: CGFloat = 10
        static let backButtonSize: CGSize = .init(width: 40, height: 40)
    }
    
    private let output: DetailViewOutput
    
    // MARK: - Subviews
    let textLabel = UILabel()
    let translationLabel = UILabel()
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = .init(named: "bg")
        return image
    }()
    
    // MARK: - Lifecycle
    
    init(output: DetailViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.add(backgroundImage)
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        backgroundImage.configureFrame { maker in
            maker.top()
                .right()
                .left()
                .bottom()
        }
    }
}
