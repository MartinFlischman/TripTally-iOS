//
//  ContentView.swift
//  TripTally
//
//  Created by Martin on 2024/10/12.
//

import SwiftUI

struct ContentView: View {
    @State private var totalExpenses: Double = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                // App Title and Total Expenses
                Text("🧳 Trip Tally")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Total Expenses: R \(String(format: "%.2f", totalExpenses))")
                    .font(.title2)
                    .padding(.bottom, 20)
                
                // Manage Travelers Button
                NavigationLink(destination: ManageTravellersView()) {
                    Text("Manage Travellers")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
                
                // Add Expense Form
                AddExpenseView(totalExpenses: $totalExpenses)
                
                Spacer()
            }
            .background(Color(UIColor.systemBackground)) // Automatically adjusts for dark/light mode
        }
    }
}


#Preview {
    ContentView()
}
