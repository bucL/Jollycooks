//
//  AndrewInfo.swift
//  JollyCooks
//
//  Created by Phillip Shen on 23/7/2022.
//

import SwiftUI

struct AndrewInfo: View {
    var body: some View {
        VStack{
            Image("Person1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay {

                    Circle().stroke(.white, lineWidth: 4)

                }
                .shadow(radius: 7)
                .padding()
            Text("")//Suggestion from Phil: Maybe talk about how you designed early algorithms and prototypes for the app. 
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
                .background(Image("orangegradient")
                    .resizable()
                    .scaledToFill()
                    )
                .cornerRadius(10)
                .padding()
            
            Spacer()
        }
        
        
    }
}

struct AndrewInfo_Previews: PreviewProvider {
    static var previews: some View {
        AndrewInfo()
    }
}