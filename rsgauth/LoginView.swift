//
//  LoginView.swift
//  swift-amplify-cognito
//
//  Created by Ross Gill on 3/30/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button("Login", action: {
                Task {
                    await sessionManager.login(
                        username: username,
                        password: password
                    )
                }
            })
            
            Spacer()
            Button("Already have an account? Log in", action: {
                sessionManager.showSignUp()
            })
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
