//
//  ContentView.swift
//  SwiftUI_JSON
//
//  Created by Desire L on 2022/01/01.
//
//

import SwiftUI

struct ContentView: View {
    private var webService = WebService()

    @State
    var todoList: [TodoModel] = [TodoModel]()

    var body: some View {

        List(todoList) { (todo: TodoModel) in
            TodoListView(todo: todo)
        }
            .onAppear {
                webService.getTodos { todoList in
                    self.todoList = todoList
                }
            }
            .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
