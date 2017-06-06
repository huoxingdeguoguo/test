//
//  ServerManager.swift
//  Server
//
//  Created by DLL on 17/5/18.
//  Copyright © 2017年 DLL. All rights reserved.
//

import Cocoa

class ServerManager: NSObject {
    fileprivate var clientMrgs : [ClientManager] = [ClientManager]()
    fileprivate var isServerRuuning : Bool = false
    fileprivate lazy var serverSocket : TCPServer = TCPServer(addr: "0.0.0.0", port: 7878)
}

extension ServerManager{
    func startRunning() {
        //开启监听
        serverSocket.listen()
        isServerRuuning = true
        //开始接收客户端
        DispatchQueue.global().async {
            while self.isServerRuuning{
                if let client = self.serverSocket.accept() {
                    print("接收的一个客户端连接")
                    self.handleClient(client)
                }
            }

        }

    }
    func stopRunning() {
        isServerRuuning = false
    }
}
extension ServerManager{
    fileprivate func handleClient(_ client : TCPClient){
        let mrg = ClientManager(tcpClient: client)
        clientMrgs.append(mrg)
        mrg.startReadMsg()
    }
}
