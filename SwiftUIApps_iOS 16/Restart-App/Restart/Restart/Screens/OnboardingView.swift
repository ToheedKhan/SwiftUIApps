//
//  OnboardingView.swift
//  Restart
//
//  Created by Toheed Jahan Khan on 23/11/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    
    @State private var textTitle: String = "Share."
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                /*
                 In general, we know that Swiftui does a fantastic job when it comes to monitoring each view and property
                 change that can occur while running the application.
                 However, when we change the value of any text view, it turns out that Swiftui works differently.
                 The problem that prevents triggering the opacity transition is the following.
                 Swiftui does not consider this string value change to a view change.
                 Yes, we are changing the value of this text from the word share to the word gif.
                 However, the program still considers this text view the same, which is the source of the problem.
                 Logically, we think that changing the string value makes this text view different, but in reality
                 the Swiftui framework recognizes it the same and that is why we could not trigger the opacity transition.
                 To fix this we can use.
                 Identifiable views.
                 */
                
                /*
                 Every Swiftui view has got a particular method so called ID and the ID methods job is to
                 bind the views identity to the given proxy value.
               
                 We use the ID method to tell Swiftui that a view is no longer the same view, and by doing that we can
                 trigger the desired opacity transition.
                 */
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                    //Identifiable Views
                        .id(textTitle)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                /*
                 Basically, we have to tell the program what value that causes the change in the animation.
                 */
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - CENTER
                
                ZStack {
                    //Ring
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    /*
                     since we would like to move the ring in the opposite direction than the dragging, therefore
                      make the offsets value the opposite.
                     
                     So when users drag the graphic to the left direction, then the rings offset value must be in the positive
                     number range.
                     On the contrary, when users drag the graphic in the right direction, then the rings offset value must
                     be in the negative number range.
                     
                     This bi directional movement creates an illusion of viewport changing, and the combination of these
                     actions will create an advanced horizontal parallax effect at the end.
                     */
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                    /*
                     Swiftui has a rotation effect and this new rotation effect modifier rotates a view
                     around a specific point.
                     This rotation effect has two parameters.
                     The first parameter is the angle, and the second parameter is the anchor.
                     In this case, we are only using the angle parameter by specifying the degree to set how much the image
                     should be rotated.
                     
                     We don't need to specify the anchor because its default location is the center, which is precisely
                     what we want.
                     As far as the rotations degree, we want to use a dynamic value and we can do it with the size of the
                     image offset divided by 20.
                     */
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    /*
                                     Please keep in mind that this gestures translation provides us the necessary information about the total
                                     movement from the start of the drag gesture to the current event of the drag gesture.
                                     From now on we can store and update this information with the image offset property and the only thing
                                     that we need to do after this to move the image horizontally is to add a new offset modifier to it.
                                     */
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                   
                                }
                                .onEnded { _ in
                                  imageOffset = .zero
                                  
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }

                                }
                            ) //: GESTURE
                            .animation(.easeOut(duration: 1), value: imageOffset)
                }//: CENTER
                .overlay(
                  Image(systemName: "arrow.left.and.right.circle")
                    .font(.system(size: 44, weight: .ultraLight))
                    .foregroundColor(.white)
                    .offset(y: 20)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                    .opacity(indicatorOpacity)
                  , alignment: .bottom
                )
                
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // PARTS OF THE CUSTOM BUTTON
                    
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }//: HStack
                    
                    // 4. CIRCLE (DRAGGABLE)
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        } //: ZStack
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x:buttonOffset)
                        .gesture (
                            DragGesture()
                                .onChanged{ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        //80 bcz red button size is 80X80
                                        buttonOffset = gesture.translation.width
                                    }
                                }.onEnded{ _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset  = 0
                                        }
                                    }
                                    
                                } //Animation: OnEnded
                        )//: GESTURE
                        
                        Spacer()
                    }//: HStack
                }//: Footer
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            }//: VStack
        }//: ZStack
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
        //Shift + cmd + A
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
