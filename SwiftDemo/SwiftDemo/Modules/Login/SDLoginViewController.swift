//
//  SDLoginViewController.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

class SDLoginViewController: SDBaseViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "LOGIN"
        
        self.addUI()
        
    }
    
    func requestLoginApi() {
        
        let p: [String: Any] = ["username":"15110199262", "password":"123456", "loginEquipment":UIDevice.current.model]
        HN.fetch(API.LoginApi.loginApi, parameters: p).success { response in
            print("response -->", response)
        }.failed {error in
            print("error -->", error)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 点击了键盘的return按钮
        textField.resignFirstResponder()
        print("\(String(describing: textField.text))")
        return true
    }
    
    @objc func loginBtnClick() {
        if phoneNumTF.text!.count > 0 && passWordTF.text!.count > 0 {
            requestLoginApi()
//            (UIApplication.shared.delegate as! AppDelegate).changeRootVC(isLogin: true)
//            UserDefaults.standard.setValue(true, forKey: "AlreadyLogin")
        } else {
            SDMBProgressHUD.showTextHudTips(message: "请输入手机号或者密码", view: self.view, isMask: true, afterDelay: 1, isTranslucent: true)
        }
    }
    
    func addUI() {
        
        self.view.addSubview(phoneNumTF)
        phoneNumTF.snp.makeConstraints { (make) in
            make.top.equalTo(kStaNavBarH + 100)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(55)
        }
        
        self.view.addSubview(passWordTF)
        passWordTF.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumTF.snp.bottom).offset(40)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(55)
        }
        
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(48)
            make.bottom.equalTo(-(kBottomSafeH + 80))
        }
        
    }
    
    lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = kGlobleColor
        btn.setTitle("JOIN US", for: .normal)
        btn.setTitleColor(kGlobalWhiteColor, for: .normal)
        btn.setBackgroundImage(UIImage.mavlCreateImageWithColor(color: kGlobalPressedColor), for: .highlighted)
        btn.setTitleColor(kTabbarNormalColor, for: .selected)
        btn.titleLabel?.font = SDFontPF(20, .regular)
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var phoneNumTF: UITextField = {
        let textF = UITextField()
        textF.borderStyle = .roundedRect
        textF.adjustsFontSizeToFitWidth = true
        textF.minimumFontSize = 14
        textF.textAlignment = .left
        textF.contentVerticalAlignment = .center
        textF.clearButtonMode = .whileEditing
        textF.delegate = self
        textF.font = SDFontPF(18, .regular)
        textF.becomeFirstResponder()
        textF.placeholder = "put in phone number"
        textF.keyboardType = UIKeyboardType.phonePad
        return textF
    }()
    
    lazy var passWordTF: UITextField = {
        let textF = UITextField()
        textF.borderStyle = .roundedRect
        textF.adjustsFontSizeToFitWidth = true
        textF.minimumFontSize = 12
        textF.textAlignment = .left
        textF.contentVerticalAlignment = .center
        textF.clearButtonMode = .whileEditing
        textF.returnKeyType = UIReturnKeyType.join
        textF.font = SDFontPF(18, .regular)
        textF.delegate = self
        textF.placeholder = "put in password"
        return textF
    }()

}
