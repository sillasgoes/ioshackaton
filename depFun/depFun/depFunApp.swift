//
//  depFunApp.swift
//  depFun
//
//  Created by Evosystems on 07/09/21.
//

import SwiftUI

@main
struct depFunApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(DepViewModel())
				.environmentObject(FunViewModel())
        }
    }
}
