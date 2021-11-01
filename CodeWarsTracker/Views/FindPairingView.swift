//
//  FindPairingView.swift
//  CodeWarsTracker
//
//  Created by Bienbenido Angeles on 9/9/21.
//

import UIKit
import SnapKit

class FindPairingView: UIView {
    
    private var headerLabel: UILabel = {
        let label = HighlightedLabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    private var subHeadLabel: UILabel = {
        let label = UnhighlightedLabel()
        return label
    }()
    
    private var listHeaderTitleLabel: UILabel = {
        let label = HighlightedLabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    public var tableView: UITableView = {
        let tableView = HighlightedTableView(frame: .zero, style: .insetGrouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //tableView.backgroundColor = .systemGroupedBackground
        return tableView
    }()
    
    private lazy var labels:[UILabel] = {
        let labels = [headerLabel,subHeadLabel, listHeaderTitleLabel]
        for label in labels {
            label.numberOfLines = 0
        }
        return labels
    }()
    
    private var stackView: UIStackView = {
        let sv = UnHighlightedStackView()
        sv.axis = .vertical
        sv.spacing = 13
        sv.distribution = .fill
        sv.alignment = .center
        sv.isLayoutMarginsRelativeArrangement = true
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        //self.backgroundColor = .systemBackground
        loadTextOnView()
        setupStackViewAndContrainsts()
        setupStackViewSubViewsAndContrainsts()
    }
    
    private func setupStackViewAndContrainsts(){
        addSubview(stackView)
        var subViews:[UIView] = labels
        subViews.append(tableView)
        for view in subViews {
            stackView.addArrangedSubview(view)
            //view.backgroundColor = .systemGroupedBackground
            view.layer.cornerRadius = 8
            view.layoutIfNeeded()
            view.sizeToFit()
        }
        
        stackView.snp.makeConstraints { mkr in
            mkr.top.equalToSuperview().offset(8)
            mkr.left.equalToSuperview().offset(8)
            mkr.right.equalToSuperview().offset(-8)
            mkr.bottom.equalToSuperview().offset(-8)
            mkr.center.equalToSuperview()
        }
    }
    
    private func setupStackViewSubViewsAndContrainsts(){
        for (index, subview) in stackView.arrangedSubviews.enumerated(){
            subview.snp.makeConstraints { mkr in
                if index == 0 || index == 2{
                    mkr.height.equalTo(34)
                } else if index == 3 {
                    mkr.height.lessThanOrEqualToSuperview().multipliedBy(0.618)
                    //subview.backgroundColor = .systemBackground
                }
                mkr.width.equalTo(stackView)
            }
        }
    }
    
    private func loadTextOnView(){
        let headLabelText = "Find someone to pair with"
        let headLabelDesc = "Pairing with someone is a great way to hold ourselves accountable to practice, share our knowledge with others and learn from them as well. We have some great volunteers who have set aside time to pair with Pursuit Fellows. This time is not set up as a mock interview but rather a collaborative session to practice. You can find an outline of how these sessions work here."
        let listLabelHeaderText = "People to pair with:"
        headerLabel.text = headLabelText
        subHeadLabel.text = headLabelDesc
        listHeaderTitleLabel.text = listLabelHeaderText
    }
    
}
