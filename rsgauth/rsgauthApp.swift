//
//  rsgauthApp.swift
//  rsgauth
//
//  Created by Ross Gill on 4/8/23.
//

import Amplify
import AWSCognitoAuthPlugin
import SwiftUI

@main
struct rsgauthApp: App {
    @ObservedObject var sessionManager = SessionManager()
    
    init() {
        configureAmplify()
        sessionManager.getCurrentAuthUser()
        print("sessionManager.authState: \(sessionManager.authState)")
    }

    var body: some Scene {
        
        WindowGroup {
            switch sessionManager.authState {
            case .login:
                LoginView()
                    .environmentObject(sessionManager)

            case .signUp:
                SignUpView()
                    .environmentObject(sessionManager)

            case .confirmCode(let username):
                ConfirmationView(username: username)
                    .environmentObject(sessionManager)

            case .session(let user):
                SessionView(user: user)
                    .environmentObject(sessionManager)
            }
        }
    }

    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify configured successfully")
        }
        catch {
            print("Could not initialize Aplify", error)
        }
    }
}
