//
//  NetworkLogger.swift
//  NetworkManager
//
//  Created by Berkay Paçal on 11/14/22.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "NetworkManager")

    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    func request<Value>(
        _ request: DataRequest,
        didParseResponse response: DataResponse<Value, AFError>
    ) {
        guard let data = response.data else {
            return
        }

        if let json = try? JSONSerialization
            .jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
