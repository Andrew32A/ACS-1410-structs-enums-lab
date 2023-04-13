import UIKit

// classes
class Customer {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

//structs
struct BobaTea {
  let tea: String
  let sweetness: Int
  let hasBoba: Bool
}

struct Coffee {
  let beanType: String
  let sugarLevel: Int
  let containsMilk: Bool
}

struct Order {
  var boba: BobaTea
  let name: String
  
  func printDescription() {
    print("\(name) ordered \(boba.tea) \(boba.hasBoba ? "boba" : "")tea, \(boba.sweetness)% sweetness, \(boba.hasBoba ? "with boba" : "no boba")")
  }
}

let boba = BobaTea(tea: "black", sweetness: 25, hasBoba: true)
//print(boba.tea) // black
//print(boba.sweetness) // 25

// functions
func createBoba(teaType: String, sweetness: Int, hasBoba: Bool) -> BobaTea {
  let boba = BobaTea(tea: teaType, sweetness: sweetness, hasBoba: hasBoba)
  return boba
}

func createCoffee(beanType: String, sugarLevel: Int, containsMilk: Bool) -> Coffee {
  let coffee = Coffee(beanType: beanType, sugarLevel: sugarLevel, containsMilk: containsMilk)
  return coffee
}

func createOrder(withTea tea: String, sweetness: Int, forCustomer customer: String, includeBoba: Bool) -> Order {
  let boba = createBoba(teaType: tea, sweetness: sweetness, hasBoba: includeBoba)
  let order = Order(boba: boba, name: customer)
  return order
}

// instantiation and output
//let customer = Customer(firstName: "Monica", lastName: "Geller")
//print(customer.firstName) // Monica
//
//let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: customer.firstName, includeBoba: true)
//newOrder.printDescription()


// enums
enum TeaType: String {
    case black = "black"
    case oolong = "oolong"
    case lavender = "lavender"
    case chai = "chai"
}

var typeOfTea = TeaType.chai

switch typeOfTea {
case .black, .chai:
    print("This is a house favorite.")
case .oolong, .lavender:
    print("This is a seasonal special.")
}


enum CoffeeType: String {
    case robusta = "robusta"
    case liberica = "liberica"
    case arabica = "arabica"
}

var typeOfCoffee = CoffeeType.robusta

switch typeOfCoffee {
case .robusta:
    print("Robusta")
case .liberica:
    print("Liberica")
case .arabica:
    print("arabica")
}


enum MilkType: String {
    case whole = "whole"
    case almond = "almond"
    case oat = "oat"
}

var typeOfMilk = MilkType.whole

switch typeOfMilk {
case .whole:
    print("whole milk")
case .almond:
    print("almond milk")
case .oat:
    print("oat milk")
}


enum OrderFullfilment {
  case success(message: String)
  case error(message: String)
}

func makeOrder(order: Order) -> OrderFullfilment {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    print(hour)
    if hour < 17 && hour > 9{
        return .success(message: "You can pick up your order in 30 min")
    }else{
        return .error(message: "We are closed, try tomorrow")
    }
}

// my order
let newcustomer = Customer(firstName: "Andrew", lastName: "Alsing")

let myOrder = createOrder(withTea: "chai", sweetness: 50, forCustomer: "Andrew", includeBoba: false)
myOrder.printDescription()

let orderResult = makeOrder(order: myOrder)

switch orderResult {
case .success(let message):
  print("Order result: \(message)")
case .error(let message):
  print("Order result: \(message)")
}


//Q1: Which of the following would be best represented with an enumeration?
//
//Names of people in a room
//Political parties x
//Addresses
//Compass degrees

//Q2: Which of the following would be best represented with an enumeration? Choose all that apply
//
//Hair colors x
//T-shirt sizes x
//Favorite numbers
//Car speed

//Q3: Which of the following would be best represented with an enumeration? Choose all that apply
//
//Car manufacturers x
//Wi-fi network names
//Professional basketball teams x
//Shoe brands
