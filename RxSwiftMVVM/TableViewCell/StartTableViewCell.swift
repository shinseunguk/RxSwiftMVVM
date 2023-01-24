//
//  StartTableViewCell.swift
//  RxSwiftMVVM
//
//  Created by ukBook on 2023/01/23.
//

import UIKit

class StartTableViewCell: UITableViewCell {

    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// UI 초기설정
    func configureUI() {
        // MARK: - addView
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(15)
        }
    }

}
