//
//  CTiOSAudit.swift
//  CTiOSAudit
//
//  Created by Jay Mehta on 12/08/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import Foundation

public class CTiOSAudit {
    
    public init(){
        if let documentsPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
                    let logPath = documentsPathString.appending("/app.txt")
        //            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stdin)
                    freopen(logPath.cString(using: String.Encoding.ascii),"a+",stderr)
        //            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stdout)
                }
    }
    
    public func startAudit(){
//        if let documentsPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
//            let logPath = documentsPathString.appending("/app.txt")
////            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stdin)
//            freopen(logPath.cString(using: String.Encoding.ascii),"a+",stderr)
////            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stdout)
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.getDataLogs()
        })
    }
    
    func getDataLogs() {
        do {
            // get the documents folder url
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("app.txt")
                let savedText = try String(contentsOf: fileURL)
                print("savedText:", savedText)
                let arrayOfLines =  savedText.components(separatedBy: .newlines)
                let filteredArray = arrayOfLines.filter {$0.contains("[CleverTap]:")}
                print("Array Of Line ",filteredArray)
                pasrseLogs(dataLogs: filteredArray)
                let file = FileManager.default
                try file.removeItem(at: fileURL)
            }
        } catch {
            print("error:", error)
        }
    }
    
    func pasrseLogs(dataLogs : [String]){
        
        for logs in dataLogs{
            if logs.contains("Auto Integration Enabled"){
                print(logs)
            }else if logs.contains("Initializing"){
                checkForSDKInitialise(dataLogs: logs)
            }
        }
    }
    
    func checkForSDKInitialise(dataLogs : String) {
        let tempArr = dataLogs.components(separatedBy: "[CleverTap]:")
        let strTemp = tempArr[1]
        print(strTemp)
    }
}
