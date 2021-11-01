//
//  fellowCardCell.swift
//  CodeWarsTracker
//
//  Created by Juan Ceballos on 8/26/21.
//

import UIKit
import SnapKit

class FellowCardCell: HighlightedCollectionViewCell {
    
    static let reuseIdentifier = "fellowCardCell"
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
    }
    
    public lazy var usernameLabel: UILabel = {
        let label = HighlightedLabel()
        label.numberOfLines = 2
        return label
    }()
    
    public lazy var honorLabel: UILabel = {
        let label = HighlightedLabel()
        label.font = .systemFont(ofSize: 33)
        return label
    }()
    
    public lazy var clanLabel: UILabel = {
        let label = HighlightedLabel()
        return label
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = HighlightedLabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    public lazy var pointsThisWeekLabel: UILabel = {
        let label = HighlightedLabel()
        return label
    }()
    
    public lazy var pointsThisMonthLabel: UILabel = {
        let label = HighlightedLabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupNameLabelConstraints()
        setupUsernameLabelConstraints()
        setupClanLabelConstraints()
        setupPointsThisWeekLabel()
        setupPointsThisMonthLabel()
        setupHonorLabelConstraints()
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().offset(-11)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }
    
    private func setupUsernameLabelConstraints() {
        addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().offset(-11)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
    }
    
    private func setupClanLabelConstraints() {
        addSubview(clanLabel)
        clanLabel.snp.makeConstraints { (make) in
            make.top.equalTo(usernameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(11)
        }
    }
    
    private func setupPointsThisWeekLabel() {
        addSubview(pointsThisWeekLabel)
        pointsThisWeekLabel.snp.makeConstraints { (make) in
            make.top.equalTo(clanLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(11)
        }
    }
    
    private func setupPointsThisMonthLabel() {
        addSubview(pointsThisMonthLabel)
        pointsThisMonthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pointsThisWeekLabel.snp.bottom)
            make.leading.equalToSuperview().offset(11)
        }
    }
    
    private func setupHonorLabelConstraints() {
        addSubview(honorLabel)
        honorLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-11)
        }
    }
    
}
