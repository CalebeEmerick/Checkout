//
//  Message.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct Message {
    
    static let generalError = "Aconteceu algo inesperado. Por favor, tente novamente."
    
    struct Login {
        
        static let missingData = "Os campos Usuário e Senha são obrigatórios. Por favor, preencha-os e tente novamente."
        static let wrongData = "Usuário ou Senha inválidos. Por favor, tente novamente."
    }
}
