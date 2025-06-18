//
//  NoItemsView.swift
//  TodoList
//
//  Created by Deltrin Sam on 12/10/23.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")

    var body: some View {
        VStack(spacing: 20) {
            Text("There is no items!")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!!")
                .multilineTextAlignment(.center)

            NavigationLink(destination: AddView()) {
                Text("Add Something 😘")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal, animate ? 30 : 50)
            .shadow(
                color: animate ? secondaryAccentColor : Color.accentColor,
                radius: animate ? 30 : 10,
                x: 0.0,
                y: animate ? 50 : 30)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}
