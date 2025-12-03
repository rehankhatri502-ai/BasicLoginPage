//
//  ContentView.swift
//  BasicLoginPage
//
//  Created by student on 03/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username",text:$username)
                        .padding()
                        .frame(width:300,height: 50)
                        .background(.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongUsername))
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width:300,height: 50)
                        .background(.opacity(0.1))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .padding()
                    .frame(width:300,height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Hey , \(username) Welcome Back."), isActive: $showingLoginScreen){
                        
                        EmptyView()
                    }
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
    func authenticateUser(username: String,password:String){
        if username.lowercased() == "rehan1234" {
            wrongUsername = 0
            if password.lowercased() == "12345" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        }else {
            wrongUsername = 2
        }
    }
}



struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
    
}

