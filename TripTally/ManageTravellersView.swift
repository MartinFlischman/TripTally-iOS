//
//  ManageTravellersView.swift
//  TripTally
//
//  Created by Martin on 2024/10/12.
//

import SwiftUI

struct ManageTravellersView: View {
    @State private var travelers: [String] = []
    @State private var newTravelerName = ""
    
    var body: some View {
        VStack {
            Text("Manage Travellers")
                .font(.headline)
                .padding(.top)
            
            // Add new traveler
            HStack {
                TextField("Enter traveler name", text: $newTravelerName)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                
                Button(action: addTraveler) {
                    Text("Add")
                        .foregroundColor(.white)
                        .frame(width: 60, height: 40)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            // List of travelers
            List {
                ForEach(travelers, id: \.self) { traveler in
                    HStack {
                        Text(traveler)
                        Spacer()
                        Button(action: { deleteTraveler(traveler) }) {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func addTraveler() {
        if !newTravelerName.isEmpty {
            travelers.append(newTravelerName)
            newTravelerName = ""
        }
    }
    
    func deleteTraveler(_ traveler: String) {
        if let index = travelers.firstIndex(of: traveler) {
            travelers.remove(at: index)
        }
    }
}


#Preview {
    ManageTravellersView()
}
