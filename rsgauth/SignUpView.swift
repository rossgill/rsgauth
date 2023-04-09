//
//  SignUpView.swift
//  swift-amplify-cognito
//
//  Created by Ross Gill on 3/30/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Username", text: $username)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Sign Up", action: {
                Task {
                    await sessionManager.signUp(
                        username: username,
                        password: password,
                        email: email
                    )
                }
            })
            
            Spacer()
            Button("Already have an account? Log in", action: {
                sessionManager.showLogin()
            })
        }
        .padding()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

