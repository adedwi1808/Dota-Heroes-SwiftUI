//
//  ContentView.swift
//  Dota Heroes SwiftUI
//
//  Created by Ade Dwi Prayitno on 02/10/22.
//

import SwiftUI

struct ContentView: View {
   
    private var dotaServices: DotaServices = DotaServices()
    
    var body: some View {
        VStack {
            Button {
                getDotaHeroesFromRemote()
            } label: {
                Text("Test Network")
            }

        }
        .padding()
    }
}

extension ContentView {
    func getDotaHeroesFromRemote() {
        Task {
            do{
                let dotaHeroesData = try await dotaServices.getHeroes(endPoint: .getHeroes)
                print(dotaHeroesData)
            }catch{
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
