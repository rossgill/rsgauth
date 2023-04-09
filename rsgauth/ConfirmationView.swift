//
//  ConfirmationView.swift
//  swift-amplify-cognito
//
//  Created by Ross Gill on 3/30/23.
//

import SwiftUI

struct ConfirmationView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var confirmationCode = ""
    
    let username: String
    
    var body: some View {
        VStack {
            Text("Username: \(username)")
            TextField("Confirmation Code", text: $confirmationCode)
            Button("Confirm", action: {
                Task {
                    await sessionManager.confirmSignUp(
                        for: username,
                        with: confirmationCode
                    )
                }
                
            })
        }
        .padding()
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(username: "Ross Gill")
    }
}
