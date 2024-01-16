//
//  LogoComponentView.swift
//  iChef
//
//  Created by Nathalia Inacio on 15/01/24.
//

import Foundation
import SwiftUI

struct LogoComponentView: View {
    
    var body: some View {
        ZStack {
            SemiCircleShape()
                .fill(AppTheme.primaryColor)
                .frame(height: 150)
                .offset(y: -210)
                .ignoresSafeArea()
                       
            VStack(alignment: .center, spacing: 60) {
                AppIcons.logo
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.top, 120)
                    
                HStack(spacing: 0) {
                    Text("i")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
               
                    Text("Chef")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                }
            }
       }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct SemiCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
        return path
    }
}

struct LogoComponentView_Previews: PreviewProvider {
    static var previews: some View {
        LogoComponentView()
    }
}

