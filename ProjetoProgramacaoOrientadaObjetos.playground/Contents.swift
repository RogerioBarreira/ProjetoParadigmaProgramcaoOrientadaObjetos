import UIKit

class Person {
    var name: String
    var gender: Character
    var age: Int = 0
    
    init(name: String, gender: Character) {
        self.name = name
        self.gender = gender
    }
    
    func speak(setence: String) {
        if age < 3 {
            print("gugu dada")
        } else {
            print(setence)
        }
    }
    
    func introduce() {
        speak(setence: "Olá meu nome '\(name)")
    }
}

class Job {
    var title: String
    var sallary: Double
    
    init(title: String, sallary: Double) {
        self.title = title
        self.sallary = sallary
    }
}

let joao = Person(name: "João", gender: "M")
let clara = Person(name: "Clara", gender: "F")
let fabio = Person(name: "Fábio", gender: "M")

joao.age = 34
clara.age = 27
fabio.age = 1

joao.introduce()
clara.introduce()
fabio.introduce()

//Herança

class Animal {
    let color: String
    let gender: Character
    let breed: String
    
    init(color: String, gender: Character, breed: String) {
        self.color = color
        self.gender = gender
        self.breed = breed
    }
    
    func emiteSound() {
        print("...")
    }
}

class Dog: Animal {
    func run() {
        print("O cachorro está correndo")
    }
}

class Bird: Animal {
    
    let canFly: Bool
    
    func fly() {
        if canFly {
            print("O pássaro está voando")
        } else {
            print("Este pássaro não voa")
        }
    }
    
    init(color: String, gender: Character, breed: String, canFly:
         Bool) {
        self.canFly = canFly
        super.init(color: color, gender: gender, breed: breed)
    }
}

let billy = Dog(color: "Preto e Branco", gender: "M", breed: "Vira Lata")
let zeCarioca = Bird(color: "Verde", gender: "M", breed: "Papagaio", canFly: true)

billy.emiteSound()
zeCarioca.emiteSound()

//Encapsulamento

class CreditCard {
    let number: String
    let limit: Double
    //Aqui estou privando o acesso a essa variável forada classe, isso se chama Encapsulamento
    private var invoiceValue: Double = 0
    
    //Neste caso estou dando acesso a somente leitura de varialvel
    var invoice: Double {
        return invoiceValue
    }
    
    let iof: Double = 6.38
    
    init(number: String, limit: Double) {
        self.number = number
        self.limit = limit
    }
    
    //Com a palavra reservada final eu estou protegendo esse metodo para que não seka possível fazer um override nesse metodo
    final func makePurchase(off value: Double, isInternational: Bool) -> Bool
    {
        let debit = isInternational ? value * (1 + iof/100) : value
        let finalValue = invoiceValue + debit
        if finalValue > limit {
            return false
        } else {
            invoiceValue = finalValue
            return true
        }
        
    }
}

let creditCard = CreditCard(number: "1245-9985-1234-3210", limit: 5000)
creditCard.makePurchase(off: 1500, isInternational: true)


//Polimorfismo

class Duke: Bird {
    
     init(color: String, gender: Character, breed: String) {
         super.init(color: color, gender: gender, breed: breed, canFly: true)
    }
    
    //Polimorfismo alteração do comportamento do metodo herdado da Classe Mãe
    override func emiteSound() {
        print("Quak, quak, quak")
    }
}

let donald = Duke(color: "Branca", gender: "M", breed: "Pato")
donald.emiteSound()



