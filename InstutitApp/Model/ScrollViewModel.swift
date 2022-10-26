//
//  ScrollViewModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct ScrollItem :Identifiable,Hashable {
    var id = UUID()
    var name:String
}

let scrollData :[ScrollItem] = [
    .init(name: "anime1"),
    .init(name: "anime2"),
    .init(name: "anime3"),
    .init(name: "anime4")
]
