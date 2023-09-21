//
//  ProjectLibrariumApp.swift
//  ProjectLibrarium
//
//  Created by ios5 on 18/08/2023.
//

import SwiftUI

@main
struct ProjectLibrariumApp: App {
    var body: some Scene {
        WindowGroup {
            LibrariumMainView(viewModel: LibrariumViewModel(searchService: SearchServices()))
        }
    }
}
