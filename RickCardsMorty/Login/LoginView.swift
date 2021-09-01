//
//  ContentView.swift
//  RickCardsMorty
//
//  Created by HanzoMac on 30/08/21.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    
    @EnvironmentObject var authViewModel : AuthenticationViewModel
    
    var body: some View {
        
        ZStack{ // Is better to use ZStack for Background colors∫
            Color("loginBgColor").ignoresSafeArea()
            VStack{
                Image("rickIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120, alignment: .top)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3), radius: 25, x: 0, y: 0)
                ActivityIndicator(show: $authViewModel.loading)
                    .padding(.all, 100)
                SignInButton(){ //This is the target closure in the custom view
                    authViewModel.signIn()
                }
                .padding(.horizontal, 60)
                
            }
        }.onAppear{
            authViewModel.restorePreviousSession()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationViewModel())
    }
}
