//
//  SunriseCollectionViewCell.swift
//  WeatherApp
//
//  Created by Victor on 25.07.2024.
//

import UIKit
import SnapKit

final class SunriseCollectionViewCell: BaseCollectionViewCell {
    static let identifier = "SunriseCollectionViewCell"
    
    // connect xib from class to this cell
    lazy private var sunriseConditionView: SunriseView = {
        SunriseView.instanceFromNib()
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 0
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.backgroundColor = .cyan

        return stack
    }()
    
    override func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(sunriseConditionView)
        
        stackView.snp.makeConstraints({ make in
            make.leading.trailing.centerY.equalToSuperview()
            make.height.equalTo(120)
        })
    }
    
}
