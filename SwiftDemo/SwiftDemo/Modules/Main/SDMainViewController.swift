//
//  SDMainViewController.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

class SDMainViewController: SDBaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    var dataList = [[String: Any]]()
    var modelList = [SDCallLogModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataSources()
        
        createTableViewUI()
        
    }
    
    func getDataSources() {
        
        let dic0 = ["callID":"123", "remoteNumber":"620-1234564", "details":[["name":"fd2222fs", "type":0],["name":"f11dfs", "type":1]]] as [String : Any]
        let dic1 = ["callID":"234", "remoteNumber":"620-4324422", "details":[["name":"fd1111fs", "type":0],["name":"fd33fs", "type":0]]] as [String : Any]
        let dic2 = ["callID":"345", "remoteNumber":"620-6543464", "details":[["name":"fd5555fs", "type":1],["name":"fd55fs", "type":1]]] as [String : Any]
        let dic3 = ["callID":"567", "remoteNumber":"620-4333213", "details":[["name":"fd333fs", "type":0],["name":"fd555fs", "type":1]]] as [String : Any]
        let dic4 = ["callID":"678", "remoteNumber":"620-2342342", "details":[["name":"f111dfs", "type":1],["name":"fd66fs", "type":0]]] as [String : Any]
        let dic5: [String: Any] = ["callID":"789", "remoteNumber":"620-1132433", "details":[["name":"fd543fs", "type":0],["name":"fd777fs", "type":0]]]
        dataList.append(dic0)
        dataList.append(dic1)
        dataList.append(dic2)
        dataList.append(dic3)
        dataList.append(dic4)
        dataList.append(dic5)
        
//        let json: [String: Any] = ["code":200, "msg":"success", "data":dataList]
        
        for dic in dataList {
            /// testSwiftyJSON
//            let dic = JSON(dic)
//            let model = SDCallLog(dic)
//            let detailM = model.details![0]
//            print(detailM.name as Any)
//            modelList.append(model)
            /// testHandyJSON
            if let model = SDCallLogModel.deserialize(from: dic) {
                modelList.append(model)
                let detailM = model.details![0]
                print(detailM.type as Any)
            }
//            if let model = JSONDeserializer<SDCallLogModel>.deserializeFrom(dict: dic) {
//                print(model.callID ?? "")
//                modelList.append(model)
//            }
        }
        
    }
    
    func createTableViewUI() {
        tableView = UITableView.init(frame: self.view.frame, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()
        tableView.register(SDMainTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(SDMainTableViewCell.self))
        self.view.addSubview(tableView)
    }
    
    

}

/// TableViewDataSource & TableViewDelegate
extension SDMainViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SDMainTableViewCell.self), for: indexPath) as!SDMainTableViewCell
        cell.model = modelList[indexPath.row]
        cell.callBtnClick = {() -> () in
            print("callBtnClick")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(indexPath.row)")
    }
}
