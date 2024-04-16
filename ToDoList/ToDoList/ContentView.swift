//
//  ContentView.swift
//  ToDoList
//
//  Created by Powers Mikaela on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ToDoListViewModel()
    @State var name = ""
    @State var placeHolder = "Write your new ToDo"
    
    var body: some View {
        NavigationView {
            VStack{
                TextField(placeHolder, text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        viewModel.add(name: name)
                        name = ""
                    }
                .padding()
                
                List {
                    ForEach(viewModel.toDos) { todo in
                        HStack {
                            
                            Button {
                                viewModel.complete(todo: todo)
                            } label : {
                                Image(systemName: todo.isCompleted ? "checkmark" : "circle")
                            }
                            
                            Text (todo.name)
                        }
                    }
                    .onDelete(perform: viewModel.delete(index:))
                }
            }
            .navigationTitle(("My todo list"))
            }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
