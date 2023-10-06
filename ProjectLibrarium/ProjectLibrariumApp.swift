//
//  ProjectLibrariumApp.swift
//  ProjectLibrarium
//
//  Created by ios5 on 18/08/2023.
//

import SwiftUI

@main
struct ProjectLibrariumApp: App {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "PageColor")
        UITabBar.appearance().barTintColor = UIColor(named: "PageColor")
        UISearchBar.appearance().backgroundColor = UIColor(named: "PageColor")
    }
    var body: some Scene {
        WindowGroup {
            LibrariumMainView(viewModel: LibrariumViewModel(searchService: SearchServices()))
        }
    }
}
