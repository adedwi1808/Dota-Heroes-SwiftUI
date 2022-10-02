//
//  ContentView.swift
//  Dota Heroes SwiftUI
//
//  Created by Ade Dwi Prayitno on 02/10/22.
//

import SwiftUI

struct ContentView: View {
   
    private var dotaServices: DotaServices = DotaServices()
    private let prefs: UserDefaults = UserDefaults()
    
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
                setDotaHeroesToLocale(data: dotaHeroesData)
            }catch{
                print(error)
            }
        }
    }
    
    func setDotaHeroesToLocale(data: DotaModel) {
        prefs.setDataToLocal(data.self, with: .dotaHeroes)
    }
    
    func getDotaHeroesDataFromLocale() -> DotaModel {
        prefs.getDataFromLocal(DotaModel.self, with: .dotaHeroes) ?? DotaModel()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
