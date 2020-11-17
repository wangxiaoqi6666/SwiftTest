//
//  SDMainTableViewCell.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

typealias clickCallBtn = () -> () // 声明闭包 call按钮点击事件

class SDMainTableViewCell: UITableViewCell {
    
    var callBtnClick: clickCallBtn?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    var titleStr: String? {
//        get {
//            return self.topTitle.text
//        }
//        set {
//            self.topTitle.text = newValue
//        }
//    }
//    var _model: SDCallLog?
//    var model: SDCallLog? {
//        get {
//            return _model
//        }
//        set {
//            _model = newValue
//            self.topTitle.text = _model?.remote
//            let detailM = model?.details![0]
//            self.detailLab.text = detailM?.name
//        }
//    }
    
    var _model: SDCallLogModel?
    var model: SDCallLogModel? {
        get {
            return _model
        }
        set {
            _model = newValue
            self.topTitle.text = _model?.remote
            let detailM = model?.details![0]
            self.detailLab.text = detailM?.name
        }
    }
    
    @objc func callBtnClickMethod() {
        callBtnClick!()
    }
    
    func addSubUI() {
        self.contentView.addSubview(callBtn)
        callBtn.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.right.equalTo(-25)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        self.contentView.addSubview(topTitle)
        topTitle.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(callBtn.snp.left).offset(-25)
            make.top.equalTo(10)
        }
        
        self.contentView.addSubview(detailLab)
        detailLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(topTitle)
            make.top.equalTo(topTitle.snp.bottom).offset(5)
        }
    }

    lazy var topTitle: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = kGlobalBlackColor
        label.font = SDFontSF(20, .medium)
        return label
    }()
    
    lazy var detailLab = { () -> UILabel in
        let label = UILabel.init()
        label.text = "detaildetail"
        label.textColor = kGlobalGrayColor
        label.font = SDFontSF(17, .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var callBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_call_mc56"), for: .normal)
        btn.addTarget(self, action: #selector(callBtnClickMethod), for: .touchUpInside)
        return btn
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
