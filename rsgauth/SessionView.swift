//
//  SessionView.swift
//  swift-amplify-cognito
//
//  Created by Ross Gill on 3/30/23.
//

import SwiftUI
import Amplify

struct SessionView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: AuthUser
    
    var body: some View {
        VStack {
            Spacer()
            Text("You signed in as \(user.username) using Amplify!!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            Button("Sign Out", action: {
                Task {
                    await sessionManager.signOut()
                }
            })
        }
        .padding()
    }
}

struct SessionView_Previews: PreviewProvider {
    private struct DummyUser: AuthUser {
        let userId: String = "1"
        let username: String = "dummy"
    }
    
    static var previews: some View {
        SessionView(user: DummyUser())
    }
}

