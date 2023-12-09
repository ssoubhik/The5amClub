//
//  OnboardingPaginationView.swift
//  The5amClub
//
//  Created by Rhymetech on 21/12/22.
//

import SwiftUI

// MARK: - Onboarding Pagination View

struct OnboardingPaginationView: View {
    let onboardingData: [OnboardingData] = [.welcome1, .welcome2, .welcome3]

    init() {
        // change tabview page indicator color
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: StaticColor.yellowLabel)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
    }

    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                TabView {
                    ForEach(onboardingData) { data in
                        // child view
                        OnboardingView(
                            data: data,
                            screenSize: proxy.size
                        )
                    }
                }
                .tabViewStyle(.page)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .navigationViewStyle(.stack)
        }
    }
}

// MARK: - Onboarding View

struct OnboardingView: View {
    let data: OnboardingData
    let screenSize: CGSize
    var body: some View {
        VStack(spacing: 56) {
            // image
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: screenSize.width * 0.8)

            // title
            Text(data.title)
                .font(.system(size: 30))

            // lets begin button
            if data.title == OnboardingData.welcome3.title {
                NavigationLink {
                    LoginView()
                } label: {
                    ButtonComponent(title: StaticText.begin)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct OnboardingPaginationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPaginationView()
    }
}
