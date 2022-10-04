//
//  ContentView.swift
//  Dota Heroes SwiftUI
//
//  Created by Ade Dwi Prayitno on 02/10/22.
//

import SwiftUI

struct ContentView: View {
    
    private let dotaServices: DotaServices = DotaServices()
    private let prefs: UserDefaults = UserDefaults()
    @State private var dotaHeroesDictionary = [String:[DotaModelElement]]()
    @State var heroName: String = ""
    @State var heroAttribute: String = ""
    @State var isNavigate: Bool = false
    
    var body: some View {
        ScrollView {
            NavigationLink(destination: DotaHeroesDetail(heroName: heroName, heroattribute: heroAttribute), isActive: $isNavigate, label: {EmptyView()})
            
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(dotaHeroesDictionary.keys.sorted(), id: \.self) { key in
                    Section {
                        ForEach(dotaHeroesDictionary["\(key)"]!, id: \.name){hero in
                            Button {
                                self.heroName = hero.localizedName
                                self.heroAttribute = hero.primaryAttr
                                isNavigate = true
                            } label: {
                                Text(hero.localizedName)
                            }
                        }
                    } header: {
                        Text("\(key)")
                            .textCase(.uppercase)
                            .font(.largeTitle)
                    }
                    Divider()
                }
            }
        }
        .padding()
        .onAppear {
            getDotaHeroesFromRemote()
            dotaHeroesDictionary = classifyDotaHeroesData(data: getDotaHeroesDataFromLocale())
        }
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
    
    func classifyDotaHeroesData(data: DotaModel) -> [String : [DotaModelElement]] {
        var res = [String : [DotaModelElement]]()
        data.forEach {
            if res[$0.primaryAttr] == nil {res[$0.primaryAttr] = []}
            res[$0.primaryAttr]?.append($0)
        }
        return res
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
