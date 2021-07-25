//
//  String+Utils.swift
//  Blity
//
//  Created by Eduardo Dias on 26/07/21.
//

import Foundation

extension String {
    var splitCapitalWordsWithSpace: String {
        self.replacingOccurrences(of: "([A-Z])",
                                  with: " $1",
                                  options: .regularExpression,
                                  range: range(of: self))
    }
    
    var titleCased: String {
        let separatedWords = splitCapitalWordsWithSpace
        return separatedWords.prefix(1).uppercased() + separatedWords.lowercased().dropFirst()
    }
    
    var capitalisedWords: String {
        splitCapitalWordsWithSpace.capitalized.replacingOccurrences(of: " ", with: "")
    }
}
