//
//  WeatherParametersCell.swift
//  WeatherApp
//
//  Created by Victor on 16.08.2024.
//

import UIKit
import SnapKit

final class WeatherParametersCell: BaseCollectionViewCell {
    static let identifier = "WeatherParametersCell"
    
    // connect xib from class to this cell
    lazy private var parameters: WeatherParameterSectionView = {
        WeatherParameterSectionView.instanceFromNib()
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 0
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.backgroundColor = .lightGray

        return stack
    }()
    
    override func setupViews() {
        addSubview(stackView)
        addSubview(parameters)
        stackView.addArrangedSubview(parameters)
        
        stackView.snp.makeConstraints({ make in
            make.leading.trailing.centerY.equalToSuperview()
            make.height.equalTo(180)
        })
    }
}
