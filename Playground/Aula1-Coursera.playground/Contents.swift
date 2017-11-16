//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground";

//Aula 2 (variáveis e constantes)

var string2: String = "The winter is coming"

var numeroInteiro = 42 //no swift não é preciso declarar o tipo da variável, ela é inferida automaticamente... mas não se pode mudar o tipo se a variávle já tiver valor

//numeroInteiro = "Novo Text"

var numeroInteiro2: Int = 10

var soma = numeroInteiro + numeroInteiro2

var numeroDecimal = 1.2

var numeroDecimal2: Double = 22.4

var soma2 = Double(numeroInteiro) + numeroDecimal

var ligado = true

var fechado: Bool = false

let stringConstante = "Winterfell" //constantes no swift é um boa prática e não podem ser mudadas de valor

//stringConstante = "Soda"




//Aula 3 (Comandos básicos em Swift)

var poder = 9000

if poder > 8000 {
    print("É mais alto que 8000!!!")
}else{
    print("É menor ou igual a 8000!!!")
}

if (poder == 9000){
    print("É igual a 9000!!!")
}


for esfera in 1...7{
    print(esfera)
}

var esferaAchadas = 10
switch esferaAchadas {
case 0:
    print("só faltam 7")
case 1,2,3:
    print("Continue procurando...")
case 4...6:
    print("falta pouco")
case 7:
    print("Qual o sei desejo?")
default:
    print("Mais de 7?")
}

var personagem = "Kame"

switch personagem {
case "Goku":
    print("O Principal")
case "Kame":
    print("O Mestre")
case "Shenlong":
    print("O Dragão")
default:
    print("Sem descrição")
}


//Aula 4 (Manipulação de Strings)

let trecho1 = "Qual o significado da vida, "
let trecho2 = "do Universo e tudo mais?"

let perguntaFundamental = trecho1 + trecho2

let resposta = 42

let fraseResposta = "A resposta é " + String(resposta)

let fraseResposta2 = "A resposta é \(resposta)"

fraseResposta.uppercased()
fraseResposta2.lowercased()

fraseResposta.characters.count


let frase1 = "Não entre em pânico"
let frase2 = "Até mais, e obrigado pelos peixes"

if frase1 < frase2{
    print("frase1 vem antes da frase2 na ordem alfabética")
} else if frase1 > frase2 {
    print("frase2 vem antes da frase1 na ordem alfabética")
}else{
    print("frase1 e frase2 são iguais")
}


import Foundation

let strLista = "ratos,golfinho,humanos"
var array = strLista.components(separatedBy: ",")
print(array[1])



//Aula 5 (Vetores e Matrizes)

var arrayDeStrings = ["Neo", "Trinity", "Morpheus"]

var arrayDeinteiros = [1, 4, 7]

var arrayDeDecimais: [Double] = []

//acessando o valor no array de Strings
arrayDeStrings[1]

//tamanho do vetor
let tamanho = arrayDeStrings.count
//print(tamanho)

arrayDeStrings.append("Agent Smith")
arrayDeinteiros.append(10)

arrayDeStrings[0] = "Mr. Anderson"
arrayDeStrings

arrayDeinteiros.remove(at: 0)
arrayDeinteiros

//laço em vetores
for i in 0..<arrayDeStrings.count{
    var str = arrayDeStrings[i]
}

for str in arrayDeStrings{
    print(str)
}

var matrix = [[10,20], [30,40]]
matrix.append([50,60])

matrix[0][0]


//aula 6 (optionals)

var numero: Int?
print(numero)

numero = 2

//unwrap seguro
if let naoEhNulo = numero{
    var soma1 = 1 + naoEhNulo
}

//forcar unwrap

var soma3 = 1 + numero!

var naoEhNulo2: Int!
naoEhNulo2 = numero


//aula 7 (funções)

func imprimeAviso(){
    print("Imprimendo aviso!")
}


imprimeAviso()

func ImprimeValorDoQuadradoDeUmInteiro(numeroInteiro: Int){
    print(numeroInteiro*numeroInteiro)
}

ImprimeValorDoQuadradoDeUmInteiro(numeroInteiro: 5)
ImprimeValorDoQuadradoDeUmInteiro(numeroInteiro: 10)



func CalculaEImprimeIMC(altura: Double, peso: Double){
    let imc = peso / (altura * altura)
    print("IMC eh: \(imc)")
}

CalculaEImprimeIMC(altura: 1.77, peso: 120.0)

func EstahComPesoSaudavel(altura: Double, peso: Double) -> Bool {
    let imc = peso/(altura * altura)
    if imc > 18.5 && imc < 25.0{
        return true
    }else {
        return false
    }
}

var pesoSaudavel1 = EstahComPesoSaudavel(altura: 1.70, peso: 70.0)
var pesoSaudavel2 = EstahComPesoSaudavel(altura: 1.70, peso: 100.0)

func CalculaIMCeVerificaPesoSaudavel(altura: Double, peso: Double) -> (imc: Double, pesoSaudavel: Bool){
    
    let imc = peso/(altura*altura)
    var pesoSaudavel: Bool
    
    if imc > 18.5 && imc < 25.0{
        pesoSaudavel = true
    }else {
        pesoSaudavel = false
    }
    return (imc,pesoSaudavel)
}

let tupla = CalculaIMCeVerificaPesoSaudavel(altura: 1.70, peso: 70.0)

tupla.imc
tupla.pesoSaudavel

tupla.0
tupla.1


//aula 8 (classes)


class Pessoa{
    
    var nome = ""
    var peso = 0.0
    var altura = 0.0
    
    func CalculaIMC() -> Double{
        let imc = self.peso / (self.altura * self.altura)
        
        return imc
    }
    
    func RetornaNomeeIMC() -> String{
        return "O IMC de \(self.nome) eh \(self.CalculaIMC())"
    }
    
    func RetornaDescricaoDaClasse() -> String{
        
        return "Este eh um objeto de uma classe Pessoa"
    }
}

//criando um objeto da classe Pessoa

var pessoa1 = Pessoa()
pessoa1.nome = "Pedro"
pessoa1.altura = 1.77
pessoa1.peso = 120.0

pessoa1.CalculaIMC()
pessoa1.RetornaNomeeIMC()
pessoa1.RetornaDescricaoDaClasse()


class Personagem : Pessoa {
    var nomeDoFilme = ""
    
    func RetornaNomePersonagemeFilme() -> String{
        return "Personagem \(nome) eh do filme \(nomeDoFilme)"
    }
    
    override func RetornaDescricaoDaClasse() -> String {
        return "Este eh um objeto da subclasse Personagem"
    }
}

var personagem1 = Personagem()
personagem1.nome = "Clark Kent"
personagem1.nomeDoFilme = "Superman 1"

personagem1.RetornaNomePersonagemeFilme()
personagem1.RetornaDescricaoDaClasse()

for i in 0..<100{
    print(i)
    
}

//Quiz

var str1 = "Winter is coming!"
var stark = str1.characters.count


var array3 = ["Neo","Trinity","Morpheus"]
array3.append("Agent Smith")
array3.remove(at: 0)
array3[0] = "Oracle"

print(array3)

let matrix3 = [[12,11,10],[9,8,7],[6,5,4],[3,2,1]]
var elemento = matrix3 [2][1]


func FuncaoQueRetornaUmaTupla(a: Int, b: Int) -> (c: Int, d: Int){
    return (a * a, b * b)
}
let valores10 = FuncaoQueRetornaUmaTupla(a: 2, b: 5)

valores10.d
































