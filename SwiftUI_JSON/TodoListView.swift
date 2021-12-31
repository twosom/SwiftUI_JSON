//
// Created by Desire L on 2022/01/01.
//

import SwiftUI

struct TodoListView: View {

    var todo: TodoModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(todo.title ?? "")
                    .font(.headline)
                    .lineLimit(2)

                Spacer()
                VStack {
                    Text("todo ID : \(todo.id?.description ?? "")")
                    Text("user ID : \(todo.userId?.description ?? "")")
                }
            }
                .padding([.trailing, .leading], 10)

            HStack {
                Spacer()
                Text(todo.completed ?? false ? "Completed" : "Not yet")
                    .font(.subheadline)
                    .shadow(color: .gray, radius: 20)
                    .foregroundColor(todo.completed ?? false ? .blue : .red)
                Spacer()
            }
        }
    }

}


struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todo: TodoModel(userId: 1, id: 1, title: "Test", completed: false))
            .previewLayout(.device)
    }
}
