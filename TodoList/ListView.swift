//
//  ListView.swift
//  TodoList
//
//  Created by Deltrin Sam on 12/10/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .edgesIgnoringSafeArea(.all) // 🔥 Important
                    .transition(.opacity)
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .padding(.top, -20) // 🔥 Remove excess top space
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        .navigationViewStyle(StackNavigationViewStyle()) // ✅ Optional fix for iPad spacing
    }
}
