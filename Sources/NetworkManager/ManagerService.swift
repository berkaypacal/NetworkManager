//
//  File.swift
//  
//
//  Created by Berkay Paçal on 11/28/22.
//

public struct ManagerService {
    private static var text = "Hello, World!"

    public init() {
    }
    
    public static var shared = ManagerService()
    
    public static func getString() -> String {
        return text
    }
}
