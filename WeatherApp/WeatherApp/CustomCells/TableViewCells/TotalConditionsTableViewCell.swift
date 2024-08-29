//
//  TotalConditionsTableViewCell.swift
//  WeatherApp
//
//  Created by Victor on 25.07.2024.
//

import UIKit
import SnapKit

// MARK: - tableViewCell for collectionView with page control
final class TotalConditionsTableViewCell: BaseTableViewCell {
    
    lazy private var sunriseConditionView: SunriseView = {
        SunriseView.instanceFromNib()
    }()
    
    lazy private var weather: WeatherParameterSectionView = {
        WeatherParameterSectionView.instanceFromNib()
    }()
    
    lazy private var collectionsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func setupViews() {
        contentView.addSubview(collectionsStackView)
        collectionsStackView.addArrangedSubview(sunriseConditionView)
        collectionsStackView.addArrangedSubview(weather)
        weather.backgroundColor = .blue
        
        // MARK: - snapkit
        
        collectionsStackView.snp.makeConstraints({ make in
            make.leading.trailing.centerY.equalToSuperview()
            make.height.equalTo(120)
        })
        
    }
    
}
