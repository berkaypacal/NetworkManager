//
//  File.swift
//  
//
//  Created by Berkay Paçal on 11/28/22.
//

//
//  NetworkManager.swift
//  PayT
//
//  Created by Berkay Paçal on 11/13/22.
//

import Foundation
import Alamofire
import Logging

protocol INetworkManager {
    func request<T: Codable>(responseType: T.Type, urlRequest: URLRequestConvertible, completion: @escaping (Bool, T?) -> Void)
    var sessionManager: Session { get }
}

class NetworkManager: INetworkManager {
    let sessionManager: Session
    
    
    init(networkInterceptor: RequestInterceptor) {
        self.sessionManager = {
            let configuration = URLSessionConfiguration.af.default
            let networkLogger = NetworkLogger()

            configuration.timeoutIntervalForRequest = 30
            configuration.waitsForConnectivity = true
            return Session(configuration: configuration, interceptor: networkInterceptor, eventMonitors: [networkLogger])
        }()
    }




    public func request<T: Codable>(responseType: T.Type, urlRequest: URLRequestConvertible, completion: @escaping (Bool, T?) -> Void) {
        sessionManager.request(urlRequest).responseDecodable(of: responseType) { response in
            guard response.error == nil else {
                response.error?.showError()
                completion(false, nil)
                return
            }
            guard let items = response.value else {
                completion(false, nil)
                return
            }
            completion(true, items)
        }
    }


}

extension AFError {
    private static let logger = Logger(label: "com.payT")

    func showError() {
        AFError.logger.error("\(errorDescription?.description ?? "")")
    }
}



