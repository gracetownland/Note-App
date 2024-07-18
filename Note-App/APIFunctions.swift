//
//  APIFunctions.swift
//  Note-App
//
//  Created by Ayush S on 2024-07-13.
//

import Foundation
import Alamofire

struct Note:Decodable, Hashable{
    var title : String
    var date: String
    var _id: String
    var note: String
}

class APIFunctions{
    var delegate:DataDelegate?
    static let functions = APIFunctions()
    func fetchNotes(){
        AF.request("http://192.168.0.179:8081/fetch").response { response in
//            print (response.data)
            
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data ?? "")
            
            
        }
    }
    
}
