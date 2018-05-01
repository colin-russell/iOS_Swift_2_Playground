//: [Previous](@previous)
import UIKit
/*:
 ## Type Casting
 Type casting is a way to check the type of a varible. We can also down cast a variable to a different subclass of its type. For example, we could downcast a `UIView` as a `UIButton` since the button is a subclass of `UIView`.
 There are a few operators in Swift we can use to handle type casting.
 */
/*:
 - Callout(Operator: 'is'):
 We can use the 'is' operator to check if an instance is one of its subclasses
 */
/*:
 - Callout(Operator: 'as?'):
 We can use the 'as?' to attempt a downcast of an instance. Note the '?', meaning this will return an optional value. If the downcast is not possible, nil will be returned.
 */
/*:
 - Callout(Operator: 'as!'):
 We can use the 'as!' to downcast and do a force unwrap of the value in one step. Only use this if you are sure the downcast will succeed.
 */

//: We can look at an example using UIView and UIButton from Apple's UIKit

// Here we declare a variable of type UIView and we assign a UIButton instance to 'myView'
// This is valid since UIButton subclasses UIView
let myView: UIView = UIButton()

/*:
 - Experiment:
 Try using the `is` operator on `myView`. Take a look at the evaluation on the right to see what the results are. ie: `myView is UIView`. Try checking if `myView` is any of the following views: `UIButton`, `UITableView`, `UIImageView`
 */
//if myView is UIView {
//    print("myView is UIView")
//}
if myView is UIButton {
    print("myView is UIButton")
}
if myView is UITableView {
    print("myView is UITableView")
}
if myView is UIImageView {
    print("myView is UIImageView")
}

/*:
 - Experiment:
 Because 'myView' is a UIView, we can't call UIButton specific methods such as 'setTitle'
 */

//myView.setTitle("Test", for: .normal) // The compiler will complain about this code!


/*:
 - Experiment:
 Here we downcast our `myView` variable to an actual UIButton using `as?`. Try changing the type of class you downcast to and check what the behaviour is. For example, what happens when you try to downcast `myView` to a `UITableView`? What happens if you use `as!`?
 */

let myCastedButtonView = myView as? UIButton

/*:
 - Experiment:
 Now that we downcast our `myView` to an actual UIButton, use conditional unwrapping to ensure it is not nil, then try calling the `setTitle` method to ensure it can be called.
 */
func condUnwrap() {
    guard myCastedButtonView != nil else {
        print("myCastedButtonView is nil")
        return
    }
    myCastedButtonView!.setTitle("title", for: UIControlState.disabled)
}
condUnwrap()

/*:
 - Callout(Challenge):
 Every `UIView` has a property called `subviews` that is an array of all of it's subviews. `view.subviews`. Imagine we had a UIView containing many different types of subviews.
 */

let view = UIView()
view.addSubview(UIButton())
view.addSubview(UIButton())
view.addSubview(UILabel())
view.addSubview(UITextField())
view.addSubview(UILabel())
view.addSubview(UIButton())
/*:
 And we need to find all buttons. Write a function to search for `UIButtons` in this view's `subviews`, and return an array will all the buttons.
 */
func findButtons() -> Array<UIButton>{
    var buttons: Array<UIButton> = []
    for view in view.subviews {
        if view is UIButton {
            buttons.append(view as! UIButton)
        }
    }
    return buttons
}
findButtons()

/*:
 - Callout(Challenge - Part 1):
 Finish the implementation of the `Movie` class and `Song` class. The `Movie` class will have a new property called `director` to store the director's name. The `Song` class will have a new property called `artist` to store the artist's name. Ensure you add their respective initializer methods as well to setup their properties.
 */

class MediaItem {
  var name: String
  init(name: String){
    self.name = name
  }
}

class Movie: MediaItem {
    var director = ""
    
    init(name: String, director: String) {
        super.init(name: name)
        self.director = director
    }
}

class Song: MediaItem {
    var artist = ""
    
    init(name: String, artist: String) {
        super.init(name: name)
        self.artist = artist
    }
}

/*:
 - Callout(Challenge - Part 2):
 Now take the array below of MediaItems and create a for loop on the array that prints out what type of media item it is and print out their properties.
 */

let library = [
  Movie(name: "Casablanca", director: "Michael Curtiz"),
  Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
  Movie(name: "Citizen Kane", director: "Orson Welles"),
  Song(name: "The One And Only", artist: "Chesney Hawkes"),
  Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

for i in 0..<library.count {
    if library[i] is Movie  {
        let movie = library[i] as! Movie
        print("Movie with name: \(movie.name) and director: \(movie.director)")
    } else if library[i] is Song {
        let song = library[i] as! Song
        print("Song with name: \(song.name) and artist: \(song.artist)")
    } else {
        print("not a Song or Movie")
    }
}


//: [Next](@next)
