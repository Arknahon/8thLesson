
import Foundation


//Воин, Колдун, Медик, Защитник
//У каждого по 1000 ХП изначально (у защитника 1500)
//Каждый раунд наносят удар по 200, 300, 0, 100
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого
//Медик наносить удар не может


//Босс
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока неумрет
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем

var heroes: [String] = ["Warrior", "Witcher", "Medic", "Defender"]
var health: [Int] = [1000, 1000, 1000, 1500]
var power: [Int] = [200, 300, 0, 100]
var healthing = 200
var sumPower = 0
var boss = 5000
var bossPower = 200
var rounds = 1
let gameCompleted = true

func bossHit() {
    for i in 0..<health.count {
        health[i] = health[i] - bossPower
    }
}

func heroesHit() {
    for i in 0..<power.count {
        boss = boss - power[i]
    }
}

func Medic(){
    health[0] = health[0] + healthing
    health[1] = health[1] + healthing
    health[2] = health[2] + healthing
}


func round() {
    print("****************")
    bossHit()
    print("Boss attacks!")
    print("Health: \(health)")
    heroesHit()
    for i in 0..<heroes.count {
        print("\(heroes[i]) attacks!")
}
    Medic()
    print("Health: \(health)")
    print("Boss's health: \(boss)")
    print("****************")
}
while true {
    if health[0] == 0 && health[1] == 0 && health[2] == 0 && health[3] >= 0{
        print("Game Over! Boss win!")
        break
    } else if boss <= 0 {
        print("Heroes win!")
        break
    }
    
    print("\(rounds) round:")
    round()
    rounds = rounds + 1
}
