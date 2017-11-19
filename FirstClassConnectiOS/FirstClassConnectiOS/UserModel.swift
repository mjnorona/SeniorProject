//
//  UserModel.swift
//  FirstClassConnectiOS
//
//  Created by MJ Norona on 11/19/17.
//  Copyright © 2017 MJ Norona. All rights reserved.
//

import Foundation

class UserModel {
    static func findUser(email: String, password: String, completionHandler: @escaping (_ data : Data?, _ response : URLResponse?, _ error : Error?) -> Void){
        
        let url = URL(string: "http://localhost:3000/auth/signup")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    
    static func addUser(firstName : String, lastName: String, email: String, username: String, password: String, completionHandler : @escaping  (_ data : Data?, _ response : URLResponse?, _ error : Error?) -> Void) {
        if let urlToReq = URL(string: "http://localhost:3000/auth/signup"){
            var request = URLRequest(url: urlToReq)
            
            request.httpMethod = "POST"
            
            
            
            let bodyData = "firstName=\(firstName)&lastName=\(lastName)&email=\(email)&username=\(username)&password=\(password)"
            
            request.httpBody = bodyData.data(using: .utf8)
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            
            task.resume()
        }
    }
}
