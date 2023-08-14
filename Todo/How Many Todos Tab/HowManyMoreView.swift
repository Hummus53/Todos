//
//  HowManyMoreView.swift
//  Todo
//
//  Created by Anas Muhsin on 14/08/2023.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        VStack {
            Text("You Have:")
                .font(.largeTitle)
            Text("\(todoManager.numTodosLeft)")
                .font(.system(size: 140))
                    .foregroundColor(.accentColor)
                    .padding()
            Text("todos left.")
                .font(.largeTitle)
            Text("You have completed \(todoManager.numTodosDone) todos. Good Job.")
                .padding(.top)
        }
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
