//
//  Scholar.swift
//  The Test's The Thing
//
//  Created by Student on 11/2/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Scholar{
    var corpus:[String] = []
    var wordFrequencies:NSCountedSet = []
    
    private static var _scholar:Scholar!
    static var scholar:Scholar{
        if _scholar == nil{
            _scholar = Scholar()
        }
        return _scholar
    }
    
    subscript(idx:Int) -> (String,Int)?{
        return (corpus[idx], wordFrequencies.count(for:corpus[idx]))
    }
    
    subscript(wordIdx:String) -> Int?{
        return wordFrequencies.count(for:wordIdx)
    }
    
    mutating func readCorpus(from file:String){
        if let path = Bundle.main.path(forResource: file, ofType: "txt"){
            let compendium = try! String(contentsOfFile: path)
            corpus = compendium.components(separatedBy: CharacterSet.alphanumerics.inverted)
            corpus = corpus.map{ $0.lowercased()}
            corpus = corpus.filter { $0 != ""}
            for word in corpus{
                wordFrequencies.add(word)
            }
            corpus = wordFrequencies.allObjects as! [String]
        }
    }
    init() {
        readCorpus(from:"plays")
    }
    
}

