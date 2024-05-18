//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by apple on 12/30/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                //Mark: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month,
                    transaction in
                    Section {
                        //Mark: Transaction List
                        ForEach(transaction) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }
                header: {
                    //Mark: Transaction Month
                    Text(month)
                }
                .listSectionSeparator(.hidden)
                  }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView{
            TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
