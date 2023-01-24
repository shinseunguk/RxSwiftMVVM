//
//  WeatherTableViewCell.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/24.
//

import UIKit

class WeatherTableViewCell: UITableViewCell, ViewControllerAttributes {
    
    let label = UILabel().then {
        $0.sizeToFit()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setAttributes()
    }
    
    func setUI() {
        contentView.addSubview(label)
    }
    
    func setAttributes() {
        label.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func bindRx() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
