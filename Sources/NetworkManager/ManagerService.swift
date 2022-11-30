//
//  File.swift
//  
//
//  Created by Berkay Paçal on 11/28/22.
//

public struct ManagerService {
    public var text = "Hello, World!"

    public init() {
    }
    
    public static var shared = ManagerService()
    
    public func getString() -> String {
        return text
    }
}
