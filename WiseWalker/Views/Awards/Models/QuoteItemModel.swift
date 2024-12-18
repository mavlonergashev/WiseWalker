//
//  QuoteItemModel.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 18/12/24.
//

import Foundation

struct QuoteItemModel: Identifiable {
    let id: UUID = UUID()
    let title: String
    let author: String
    let description: String
}
