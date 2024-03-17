//
//  Router.swift
//  CryptoViper
//
//  Created by Edris ILYAS on 17.03.2024.
//

import Foundation

// Class, protocol
// EntryPoint


protocol AnyRouter {
    static func startExecution() -> AnyRouter
}


class CryptoRouter : AnyRouter {
    
    static func startExecution() -> any AnyRouter {
        let router = CryptoRouter()
        
        return router
    }
     
}
