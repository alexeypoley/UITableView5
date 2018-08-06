//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var testRecipe1 = Recipe(id: 0, name: "Venskoe", hopsArray: [testHop1], grainsArray: [testGrain1])
var testRecipe2 = Recipe(id: 1, name: "Mezhdurechenskoe", hopsArray: [testHop2], grainsArray: [testGrain1])
var testRecipe3 = Recipe(id: 3, name: "Old Paris", hopsArray: [testHop1, testHop2], grainsArray: [testGrain2])
var testRecipe4 = Recipe(id: 4, name: "Venskoe2", hopsArray: [testHop3], grainsArray: [testGrain3])
var testRecipe5 = Recipe(id: 5, name: "Mezhdurechenskoe2", hopsArray: [testHop4, testHop5], grainsArray: [testGrain5])
var testRecipe6 = Recipe(id: 6, name: "Old Paris2", hopsArray: [testHop1, testHop2], grainsArray: [testGrain4])
var testRecipe7 = Recipe(id: 7, name: "Venskoe3", hopsArray: [testHop8,testHop9, testHop3], grainsArray: [testGrain6,testGrain3])
var testRecipe8 = Recipe(id: 8, name: "Mezhdurechenskoe4", hopsArray: [testHop7], grainsArray: [testGrain6,testGrain1,testGrain2])
var testRecipe9 = Recipe(id: 9, name: "Old Paris5", hopsArray: [testHop4, testHop5], grainsArray: [testGrain4])



var recipesArray: [Recipe] = [testRecipe1, testRecipe2, testRecipe3,testRecipe4, testRecipe5, testRecipe6,testRecipe7, testRecipe8, testRecipe9] //глобальная переменная, хранящая архив рецептов



class Ingredient { //используется как абстрактный класс
    var id: Int
    var name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class Hop : Ingredient { //хмель, в расчётах пока не используется
    var alpha: Double
    var mass: Double
    init(id: Int, name: String, alpha: Double, mass: Double) {
        self.alpha = alpha
        self.mass = mass
        super.init(id: id, name: name)
    }
}

class Grain : Ingredient { //зерно, используется для расчёта алкоголя
    var sigma: Double
    var mass: Double
    init(id: Int, name: String, sigma: Double, mass: Double) {
        self.sigma = sigma
        self.mass = mass
        super.init(id: id, name: name)
    }
}

class Style { //стили пива
    var name: String
    var alcoholLevelMin: Double
    var alcoholLevelMax: Double
    init(name: String, alcoholLevelMin: Double, alcoholLevelMax: Double) {
        self.name = name
        self.alcoholLevelMin = alcoholLevelMin
        self.alcoholLevelMax = alcoholLevelMax
    }
    
}

var testHop1 = Hop(id: 04, name: "Irish", alpha: 0.0234, mass: 1.542)
var testHop2 = Hop(id: 05, name: "Russian", alpha: 0.144, mass: 0.920)
var testHop3 = Hop(id: 06, name: "Siberia", alpha: 0.154, mass: 0.620)
var testHop4 = Hop(id: 07, name: "Deutch", alpha: 0.142, mass: 0.45)
var testHop5 = Hop(id: 08, name: "Luxe", alpha: 0.174, mass: 0.57)
var testHop6 = Hop(id: 09, name: "Malasia", alpha: 0.172, mass: 0.620)
var testHop7 = Hop(id: 10, name: "Vietnam", alpha: 0.14, mass: 0.87)
var testHop8 = Hop(id: 11, name: "Russo", alpha: 0.1, mass: 0.231)
var testHop9 = Hop(id: 12, name: "American", alpha: 0.12, mass: 0.402)
var testHop10 = Hop(id: 13, name: "Gearge", alpha: 0.13, mass: 0.5)


var testGrain1 = Grain(id: 14, name: "English Grain", sigma: 0.2323, mass: 0.434)
var testGrain2 = Grain(id: 15, name: "Russian Grain", sigma: 0.923, mass: 0.012)
var testGrain3 = Grain(id: 16, name: "English Grain", sigma: 0.323, mass: 0.34)
var testGrain4 = Grain(id: 17, name: "Russian Grain", sigma: 0.23, mass: 0.12)
var testGrain5 = Grain(id: 18, name: "English Grain", sigma: 0.223, mass: 0.454)
var testGrain6 = Grain(id: 19, name: "Russian Grain", sigma: 0.213, mass: 0.52)



var testStyle1 = Style(name: "American Ale", alcoholLevelMin: 0.045, alcoholLevelMax: 0.056)




class Recipe {
    var id: Int
    var name: String
    var hopsArray: [Hop]
    var grainsArray: [Grain]
    init(id: Int, name: String, hopsArray: [Hop], grainsArray: [Grain]) {
        self.id = id
        self.name = name
        self.grainsArray = grainsArray
        self.hopsArray = hopsArray
    }
    
    func calcAlcoholLevel () -> Double { //считаем алкоголь рецепта
        var alcoholLevel: Double = 0.0
         for i in 0...grainsArray.count-1 {
         alcoholLevel += grainsArray[i].sigma * grainsArray[i].mass
         }
        return alcoholLevel
        
    }
    
    
    
    
    func matchRecipeToStyle (style: Style) -> Recipe { //приводим заданный рецепт к нужному стилю
        if calcAlcoholLevel() >= style.alcoholLevelMin && calcAlcoholLevel() <= style.alcoholLevelMax {
            print("рецепт соответствует стилю")
            return self
        } else {
            let proportion: Double = ((style.alcoholLevelMin + style.alcoholLevelMax)/2)/calcAlcoholLevel()
            for i in 0...self.grainsArray.count-1 {
                grainsArray[i].mass *= proportion
            }
            return self
        }
    }
    
    
    
    func determineId () -> Int { //функция, расчитывающая новый Id
        var newID: Int = 1
        if recipesArray.count > 0 {
            for i in 0...recipesArray.count-1 {
                if newID < recipesArray[i].id {
                    newID = 1+recipesArray[i].id
                }
            }
        }
        return newID
    }
}




