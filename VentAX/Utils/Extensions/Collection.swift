//
//  Collection.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 28/04/21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index{
    subscript(safe index: Index) -> Iterator.Element?{
        return indices.contains(index) ? self[index] : nil
    }
}
