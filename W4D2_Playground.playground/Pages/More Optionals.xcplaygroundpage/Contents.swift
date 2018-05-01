/*:
 ## More Optionals
 Let's start off with some review of optionals.
 When we have an optional variable, the variable might contain a value or it can contain nil. Optionals are represented with a '?' after the variable type.
 */
/*:
 - Experiment:
 Declare a optional Double value and set it to nil.
 */
var optD: Double? = nil

/*:
 - Experiment:
 Assign a value your optional Double.
 */
optD = 3.14

/*:
 - Experiment:
 Force unwrap the optional value. Why do you have to be careful about force unwrapping?
 */
optD!
// you have to be careful because it might not be set to a value since it's optional

/*:
 - Experiment:
 Use conditional unwrapping to verify if the optional has a value. Print the value if there is something, otherwise, print out to indicate there is no value present. Why is conditional unwrapping better than force unwrapping?
 */
if (optD != nil) {
    print(optD!)
} else {
    print("optD has no value")
}

/*:
 - Callout(Challenge):
 Create a function that removes the `nil` values from the array and returns a new array with only the valid Strings.
 */
var testData: [String?] = ["Heather", nil, "Mike", "John", nil, nil, "Bob"]

func removeNil (array: Array<String?>) -> Array<String> {
    var stuff: [String] = []
    for e in array {
        if e != nil {
            stuff.append(e!)
        }
    }
    return stuff
}

print(removeNil(array: testData))

/*:
 - Callout(Challenge):
 We want to write a function that validates form data filled in by a user. Once we encounter the first field that is blank, we want to indicate to the user that the field is blank.
 If the user has filled in everything correctly, we want to print all information out.
 Below is some test data you can use to test your function.
 */
// Should pass all checks and print all information
//let username: String? = "user1"
//let password: String? = "password123"
//let email: String? = "user1@lighthouselabs.ca"

// Should stop at password check and indicate password field is empty
let username: String? = "user1"
let password: String? = nil
let email: String? = "user1@lighthouselabs.ca"

// Should stop at username check and indicate username field is empty
//let username: String? = nil
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

func formCheck () {
    if username == nil {
        print("username is blank")
    } else if password == nil {
        print("password is blank")
//    } else if email == nil {
//        print("email is blank")
    } else {
        print("username: \(username ?? "empty") password: \(password ?? "empty") email: \(email ?? "empty")")
    }
}
formCheck()

/*:
 ## Guard Let
 Depending on how you finished the first challenge, the code you've written might not be as readable or optimal as it could be. So let's take a look at how we can improve this.
 A 'guard' statement is similar to an 'if', but a 'guard' statement will only run its block of code if the conditions are NOT met.
 Let's look at a simple guard example below.
 */
let myNumber = 10

// This function checks if the number given to it is a positive or negative value
func isMyNumberANegativeValue(myNumber: Int){
  
  // This guard condition checks if 'myNumber' is less than zero.
  // Remember, if this condition IS FALSE, the block of code within the else block will run
  // Otherwise, the function will continue
  guard myNumber < 0 else {
    print("I am positive")
    return
  }
  
  print("I am negative!")
}

isMyNumberANegativeValue(myNumber: myNumber)

/*:
 - Experiment:
 Try creating your own guard statement with different conditional statements. Notice which boolean condition causes the code the enter the 'else' block or bypass it entirely.
 */
func guardFun(number: Int) {
    
//    guard number < 0 || number > 5 else {
//        print("number is between 0 and 5")
//        return
//    }
//    print("number is less than zero or greater than 5")
//    guard number < 0, number > 5 else {
//        print("number is between 0 and 5")
//        return
//    }
//    print("number is less than zero or greater than 5")
    
    guard number != 2, number != 3 else {
        print("number is 2 or 3")
        return
    }
    print("number is not 2 or 3")
}
guardFun(number: -2)
guardFun(number: 3)
guardFun(number: 5)
guardFun(number: 6)

/*:
 - Experiment:
 Create a function that takes in two number parameters and divide them. We don't like dividing by zero, so ensure this doesn't happen. Otherwise, return the calculated value.
 */
func divide(number1: Double, number2: Double) -> Double? {
    guard number2 != 0 else {
        print("can't divide by zero")
        return nil
    }
    return number1/number2
}

divide(number1: 2, number2: 0)
divide(number1: 6, number2: 3)
divide(number1: 1, number2: 2)

/*:
 Let's take a look at another example and see how we can use guard for optionals
 */

let myOptionalNumber: Int? = 10

// This function just checks if the given parameter is nil or not
func isMyNumberAnOptional(myOptionalNumber: Int?){
  
  // This guard checks if 'myOptionalNumber' has a value or not. Similar concept to conditional unwrapping
  // If 'myOptionalNumber' is indeed nil, the else block will run
  // Otherwise, our guard let statement is looking for a valid value, and the code will continue to run
  guard let myUnwrapped = myOptionalNumber else {
    
    print("This value is nil")
    return
  }
  
  // Lastly, you can see we can use the variable 'myUnwrapped' variable declared above within our entire scope of this function now
  // Very convenient!!
  // A regular 'if let' would not allow this
  print("This unwrapped value is \(myUnwrapped)")
}

isMyNumberAnOptional(myOptionalNumber: myOptionalNumber)

/*:
 - Experiment:
 Create a function that takes in an array of numbers. Have the function add all the numbers together and return the result. Make sure to `guard` against an empty array. Use `array.first` to check if there is at least one value in the array.
 */
func addNumsInArray(array: Array<Int>) -> Int? {
    
    guard var a = array.first else {
        print("array is nil")
        return nil
    }
    for i in 0..<array.count {
        a += array[i]
    }
    return a
}
addNumsInArray(array: [2, 5, 8, 10])
addNumsInArray(array: [])

/*:
 - Callout(Challenge):
 Now that we've learnt this new guard statement, let's rewrite the form validation challenge using the guard statements. How does it improve our current implementation?
 */
func formCheck2() {
    
    guard username != nil else {
        print("username is blank")
        return
    }
    guard password != nil else {
        print("password is blank")
        return
    }
    guard email != nil else {
        print("email is blank")
        return
    }
    print("username: \(username ?? "empty") password: \(password ?? "empty") email: \(email ?? "empty")")
}

formCheck2()

//: [Next](@next)
