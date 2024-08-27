//
//  ConditionTableViewCell.swift
//  WeatherApp
//
//  Created by Victor on 22.07.2024.
//

import UIKit
import SnapKit

// MARK: - top cell that loads XIB view
final class CurrentConditionTableViewCell: BaseTableViewCell {
    
    lazy private var currentConditionView: CurrentConditionView = {
        CurrentConditionView.instanceFromNib()
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    lazy private var bgImage: UIImageView = {
        let image = UIImageView(image: UIImage(resource: .bg))
        image.alpha = 0.4
        return image
    }()
    
    override func setupViews(){
        contentView.addSubview(currentConditionView)
        contentView.addSubview(stackView)
//        stackView.addArrangedSubview(bgImage)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(currentConditionView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        
//        bgImage.snp.makeConstraints { make in
//            make.trailing.leading.equalToSuperview()
//            make.height.equalTo(130)
//        }
        
        currentConditionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//            make.height.equalTo(120)
//            make.top.greaterThanOrEqualTo(80)
//            make.bottom.lessThanOrEqualToSuperview().offset(90)
        }
    }
}
