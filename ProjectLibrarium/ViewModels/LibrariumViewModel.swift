//
//  LibrariumViewModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import Foundation

class LibrariumViewModel: ObservableObject{
    @Published var userSearchQuerry: String = ""
    @Published var searchResults: [SearchResults] = []
    @Published var recomended: [String] = ["abc", "cbe", "UwU","abc2", "cb1e", "Uw4U","abcs", "fcbe", "aUwU","abcf", "cbew", "UwUsd","abc65", "c234be", "U3wU"]
}
