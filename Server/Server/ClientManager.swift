//
//  ClientManager.swift
//  Server
//
//  Created by DLL on 17/5/18.
//  Copyright © 2017年 DLL. All rights reserved.
//

import Cocoa

class ClientManager: NSObject {
    var tcpClient = TCPClient()
    fileprivate var isClientConnected : Bool = false
    init(tcpClient : TCPClient) {
        self.tcpClient = tcpClient
    }
}
extension ClientManager{
    func startReadMsg() {
        isClientConnected = true
        while true {
            if let msg = tcpClient.read(9) {
                let msgData = Data(bytes: msg, count: 9)
                let msgStr = String(data: msgData, encoding: .utf8)
                print(msgStr ?? "123456")
            }else{
                isClientConnected = false
                print("服务器断开连接")
            }
        }
    }
}
