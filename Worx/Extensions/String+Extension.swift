//
//  String+Extension.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}
