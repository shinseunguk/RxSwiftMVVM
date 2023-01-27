//
//  KioskTableViewCell.swift
//  RxSwiftMVVM
//
//  Created by plsystems on 2023/01/27.
//

import Foundation
import UIKit

final class KioskTableViewCell : UITableViewCell, ViewControllerAttributes{
    
    lazy var plusBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .systemBlue
    }
    lazy var minusBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "minus"), for: .normal)
        $0.tintColor = .systemBlue
    }
    lazy var foodLabel = UILabel().then {
        $0.sizeToFit()
        $0.textColor = .black
        $0.text = "감자튀김"
    }
    lazy var priceLabel = UILabel().then {
        $0.sizeToFit()
        $0.textColor = .black
        $0.text = "800"
    }
    
//    func setData(_ data: ) {
//        foodLabel.text = ""
//        priceLabel = ""
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setAttributes()
        bindRx()
    }
    
    func setUI() {
        contentView.addSubview(plusBtn)
        contentView.addSubview(minusBtn)
        contentView.addSubview(foodLabel)
        contentView.addSubview(priceLabel)
    }
    
    func setAttributes() {
        plusBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(20)
        }
        minusBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(plusBtn.snp.right).offset(10)
        }
        foodLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(minusBtn.snp.right).offset(20)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-20)
        }
    }
    
    func bindRx() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
