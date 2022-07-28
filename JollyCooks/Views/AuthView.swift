//
//  LoginView.swift
//  JollyCooks
//
//  Created by Aaditya Shankar on 9/7/2022.
//

import SwiftUI

struct AuthView: View {
    
    
    @StateObject var viewModel = AuthViewModel() // Referencing AuthViewModel to call functions from this file in the View.
    @StateObject var listViewModel: ListViewModel = ListViewModel() // Referncing ListViewModel to set environment Object in the view. 

    
    
    var body: some View {
        
        if viewModel.loginSuccess == false {
            
            NavigationView {
                ZStack {
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 1800, height: 1250)
                        .blur(radius: 7)
                    
                    VStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500)
                        TextField("Username...", text: $viewModel.email)
                            .padding()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                        SecureField("Password...", text: $viewModel.password)
                            .padding()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .offset(y:-8)
                        
                        
                        Button {
                            viewModel.login()
                            //Calling the login function from the AuthViewModel
                        } label: {
                            Text("Login")
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color.orange)
                                .cornerRadius(5)
                            
                        }.alert("\(viewModel.failedLoginMessage)", isPresented:$viewModel.displayFailedLogin) { Button("OK", role: .cancel) {} }
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color.orange)
                                .cornerRadius(5)
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            
            
            
        } else {

                SwiftUIView()
            .environmentObject(listViewModel)
        }
        
    }
}







struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}


// Extension from https://www.youtube.com/watch?v=6b2WAePdiqA&list=WL&index=6 allowing for placeholder text that can be recolored. Doesn't work atm with current setup of login screen hoping to get it working in the near future.
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
