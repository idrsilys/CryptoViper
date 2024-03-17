//
//  Presenter.swift
//  CryptoViper
//
//  Created by Edris ILYAS on 17.03.2024.
//

import Foundation

//Class, protocol
// talksto interactor,router,view

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter?{ get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(resault: Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter {
    var router: (any AnyRouter)?
    
    var interactor: (any AnyInteractor)? {
        didSet{
            interactor?.downloadCryptos()
        }
    }
    
    var view: (any AnyView)?
    
    func interactorDidDownloadCrypto(resault: Result<[Crypto], any Error>) {
        switch resault {
        case .success(let cryptos):
                //view.update
            view?.update(with: cryptos)
        case .failure(_):
                //view.update error
            view?.update(with: "Try again later....")
            
            
        }
    }
    
    
}
