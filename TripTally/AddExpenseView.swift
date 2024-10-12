//
//  AddExpenseView.swift
//  TripTally
//
//  Created by Martin on 2024/10/12.
//

import SwiftUI

struct AddExpenseView: View {
    @Binding var totalExpenses: Double // Binding to totalExpenses from the parent view
    
    @State private var selectedCategory: String = ""
    @State private var expenseAmount: String = ""
    
    var categories = ["Accommodation", "Admission Fees", "Excursions", "Tours", "Food", "Fuel", "Rental Car", "Shows", "Events", "Taxi", "Tips"]

    var body: some View {
        VStack {
            Text("Add Expense")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            // Category picker
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
            .padding(.bottom, 20)
            
            // Expense amount input
            TextField("Amount", text: $expenseAmount)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.bottom, 20)
            
            // Add expense button
            Button(action: {
                if let amount = Double(expenseAmount) {
                    totalExpenses += amount
                    // Clear the fields after adding expense
                    selectedCategory = ""
                    expenseAmount = ""
                }
            }) {
                Text("+ Add Expense")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
    }
}

// Preview
struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        // Using a mock binding with a constant value for preview purposes
        AddExpenseView(totalExpenses: .constant(100.0))
    }
}
