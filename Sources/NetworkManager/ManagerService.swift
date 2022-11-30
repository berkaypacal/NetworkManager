//
//  File.swift
//  
//
//  Created by Berkay Paçal on 11/28/22.
//

class ManagerService {

    public init() {
    }
    
    public static var shared = ManagerService()
    
    open func getString(title: String) -> String {
        return title
    }
}
