//
//  ContentView.swift
//  SummerOlympics
//
//  Created by John Kearon on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    
    private let logos = ["1924-Paris-France.jpg",
                         "1932-los-angeles-usa.jpg",
                         "1936-berlin-germany.png",
                         "1948-london-england.jpg",
                         "1952-helsinki-finland.jpg",
                         "1956-melbourne-australia.jpg",
                         "1960-rome-italy.jpg",
                         "1964-tokyo-japan.jpg",
                         "1968-mexico-city-mexico.jpg",
                         "1972-munich-germany.png",
                         "1976-montreal-canada.jpg",
                         "1980-moscow-russia.jpg",
                         "1984-los-angeles-usa.jpg",
                         "1988-seoul-south-korea.jpg",
                         "1992-barcelona-spain.jpg",
                         "1996-atlanta-usa.jpg",
                         "2000-sydney-australia.jpg",
                         "2004-athens-greece.png",
                         "2008-beijing-china.jpg",
                         "2012-london-england.jpg",
                         "2016-rio-brazil.jpg",
                         "2020-tokyo-japan.jpeg",
                         "2024-paris-france.png",
                         "2028-los-angeles-usa.png",
                         "2032-brisbane-australia"]
    @State private var logoNumber = 22
    
    //FIXME:
    //MARK:
    //TODO: - dashes add lines -
    
    
    var body: some View {
        VStack {
            Text("Olympic Logos")
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            
            //            image(getImageName(logoName: logos[logoNumber]))
            Image(getImageName(logoName: logos[logoNumber]))
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            VStack {
                Text("\(getCity(logoName: logos[logoNumber])), \(getCountry(logoName: logos[logoNumber]))")
                Text(getYear(logoName: logos[logoNumber]))
            }
            .font(.largeTitle)
            .fontWeight(.thin)
            
            Spacer()
            
            HStack {
                Button {
                    logoNumber -= 1
                } label: {
                    Image(systemName: "chevron.left.to.line")
                }
                .disabled(logoNumber == 0)
                
                Spacer()
                
                Button {
                    //TODO:
                    forWard()
                } label: {
                    Image(systemName: "chevron.right.to.line")
                }
                .disabled(logoNumber == logos.count - 1 ? true : false)
                
            }
            .font(.largeTitle)
            .fontWeight(.black)
            .tint(.black)
        }
        .padding()
    }
    
    // private means these functions are only available in this struct
    
    private func backWard() {
        if logoNumber > 0 {
            logoNumber -= 1
        } else {
            //            logoNumber = logos.count - 1
            
        }
//        print("logoNumber=\(logoNumber)")
    }
    
    private func forWard() {
        if logoNumber < logos.count - 1 {
            logoNumber += 1
        } else {
            //                logoNumber = 0
        }
    }
    
    private func getImageName(logoName: String) -> String {
        // 3 extensions: .png, .jpg, and .jpeg
        var newLogoName = logoName.replacingOccurrences(of: ".jpg", with: "")
        newLogoName = newLogoName.replacingOccurrences(of: ".jpeg", with: "")
        newLogoName = newLogoName.replacingOccurrences(of: ".png", with: "")
        return newLogoName
    }
    
    private func getYear(logoName: String) -> String {
        let componentsArray = logoName.components(separatedBy: "-")
        return componentsArray[0]
    }
    
    private func getCountry(logoName: String) -> String {
        let componentsArray = logoName.components(separatedBy: "-")
        var country = componentsArray.last ?? ""
        //    print("\(componentsArray) country=\(country)")
        country = getImageName(logoName: country)
        if country.lowercased() == "usa" {
            country = country.uppercased()
        } else {
            country = country.capitalized
        }
        return country
    }
    
    private func getCity(logoName: String) -> String {
        var componentsArray = logoName.components(separatedBy: "-")
        //    print(componentsArray)
        componentsArray.removeFirst()
        componentsArray.removeLast()
        var city = ""
        for component in componentsArray {
            city = city + component + " "
        }
        //    Remove space at the end of the city
        city.removeLast()
        
        return city.capitalized
    }
    
}

#Preview {
    ContentView()
}
