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
        
    }
    
    public func startAudit(){
        if let documentsPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let logPath = documentsPathString.appending("app.log")
            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stdin)
            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stderr)
            freopen(logPath.cString(using: String.Encoding.ascii), "a+",stdout)
        }
    }
}
