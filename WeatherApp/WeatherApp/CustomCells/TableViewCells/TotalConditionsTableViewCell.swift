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
    
    lazy private var collectionsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        //stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    // MARK: - Collection view created
    lazy private var collectionView: UICollectionView = {
        // layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        // collection
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.focusGroupIdentifier = "conditionsInfo"
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        contentView.addSubview(collectionsStackView)
        collectionsStackView.addArrangedSubview(collectionView)
        
        // MARK: - collectionView register cell
        collectionView.register(SunriseCollectionViewCell.self, forCellWithReuseIdentifier: "SunriseCollectionViewCell")
        collectionView.register(WeatherParametersCell.self, forCellWithReuseIdentifier: "WeatherParametersCell")
        
        // MARK: - snapkit
        
        collectionsStackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(15)
            make.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints({
            $0.height.equalTo(100)
        })
        
    }
    
}

// MARK: - Misc additions
extension TotalConditionsTableViewCell {
    // MARK: - Sections
    enum CollectionViewSections: Int, CaseIterable {
        case sunriseSection, weatherParametersSection
    }
    
    // MARK: - FocusGroup
    enum CollectionViewFocusGroup: String {
        case conditionsInfo = "conditionsInfo" // surise and weather sections here
    }
}

// MARK: - UICollectionView protocols

extension TotalConditionsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let focusGroup = CollectionViewFocusGroup(rawValue: collectionView.focusGroupIdentifier ?? "") else { fatalError("Invalid section") }
        
        switch focusGroup {
        case .conditionsInfo:
            return CollectionViewSections.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let focusGroup = CollectionViewFocusGroup(rawValue: collectionView.focusGroupIdentifier ?? "") else { fatalError("Invalid section") }
        
        switch focusGroup {
        case .conditionsInfo:
            return CollectionViewSections(rawValue: section) == .sunriseSection ? 1 : 19
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let focusGroup = CollectionViewFocusGroup(rawValue: collectionView.focusGroupIdentifier ?? "") else { fatalError("Invalid section") }
        
        switch focusGroup {
        case .conditionsInfo:
            guard let collectionViewSections = CollectionViewSections(rawValue: indexPath.section) else { fatalError("Invalid section") }
            
            switch collectionViewSections {
            case .sunriseSection:
                guard let sunriseCell = collectionView.dequeueReusableCell(withReuseIdentifier: SunriseCollectionViewCell.identifier, for: indexPath) as? SunriseCollectionViewCell else { fatalError("falied to dequeue CurrentConditionsCollectionViewCell") }
                
                return sunriseCell
                
            case .weatherParametersSection:
                guard let weatherCell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherParametersCell.identifier, for: indexPath) as? WeatherParametersCell else { fatalError("falied to dequeue CurrentConditionsCollectionViewCell") }
                
                return weatherCell
            }
        }
    }
}

extension TotalConditionsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CollectionViewFocusGroup(rawValue: collectionView.focusGroupIdentifier ?? "") == .conditionsInfo ? CGSize.init(width: 180, height: 180) :  CGSize.init(width: contentView.frame.width, height: 90)
    }
    
    // vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    // horizontal spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    // spacing between sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionViewFocusGroup(rawValue: collectionView.focusGroupIdentifier ?? "") == .conditionsInfo ? UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) :  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
