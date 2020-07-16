Image for post
Apple introduced SwiftUI during WWDC 19, It is an innovative simpler way to build user interfaces for ios products. Therefore I decided to explore this fairly new technology by building a slot matching Game using SwiftUI. Before diving in, it is key to note that SwiftUI only supports ios13 or above.

Image for post
As you can see a User Interface appears side by side next to the contentView.swift editor. Also, there is no AutoLayout. By holding the command key and click the text label, there things like HStack, VStack, Groups, etc, any changes to the text label appear in a coded form in ContenView editor simultaneously.

The Slot Matching Game consists of 9 cards in the center of the interface, the user will have an initial credit of 100 points with two betting options, one minimum bet option which costs 10 points, another one maximum bet option costs 20 points. User gain points if a row of images matches, in contrast, User lose points if the image didn’t match.

Image for post
When there is a row of match images, the card will turn green, the user will gain credits depends on which betting option was selected.

Image for post
if no matches, the card will remain white, the user will lose credits depends on which betting option was selected.

Image for post

To Conclude, SwiftUI saves a lot of time comparing to UIKit, Using UIKit, we were able to code to build the UI programmatically, it works, but it was easy to make mistakes, SwiftUI solved this problem by replacing interface builder with a live preview of the app when modifying the element in the interface, it auto-generates the code in the corresponding editor, vise versa, changing code in the editor, the interface will live preview the interface for the user as well. Overall, SwiftUI is a great tool making the development of User Interface much easier and bugfree.
