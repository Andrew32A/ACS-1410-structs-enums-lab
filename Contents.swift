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
    print("\(name) ordered \(boba.tea) \(boba.hasBoba ? "boba" : "") tea, \(boba.sweetness)% sweetness, \(boba.hasBoba ? "with boba" : "no boba")")
  }
}

let boba = BobaTea(tea: "black", sweetness: 25, hasBoba: true)
print(boba.tea) // black
print(boba.sweetness) // 25

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
let customer = Customer(firstName: "Monica", lastName: "Geller")
print(customer.firstName) // Monica

let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: customer.firstName, includeBoba: true)
newOrder.printDescription()


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
