// Calculo de imposto sobre o salario
funcao impSalario(salario: real) : real
var
mensal: real
inicio
   mensal <- salario / 12
   
   se mensal < 3000.0 entao
      retorne 0.00
   senao
      se mensal < 5000.0 entao
         retorne salario * 0.1
      senao
         retorne salario * 0.2
      fimse
   fimse
fimfuncao

// Calculo de imposto sobre o servico
funcao impServi(servico: real) : real
inicio
      retorne servico * 0.15
fimfuncao

// Calculo de imposto sobre o capital
funcao impCapital(capital: real) : real
inicio
      retorne capital * 0.2
fimfuncao

// Calculo de imposto total
funcao impTotal(salario: real; servico: real; cap: real) : real
inicio
  retorne impSalario(salario) + impServi(servico) + impCapital(cap)
fimfuncao

// Calculo de valores dedutiveis
funcao abatimento(salario: real; servicos: real; cap: real; medico: real; educacao: real) : real
var
   gasDed: real
   maxDed: real
inicio

  maxDed <- impTotal(salario, servicos, cap) * 0.30
  gasDed <- medico + educacao
  
  se gasDed > maxDed entao
     retorne maxDed(salario, servicos, cap)
  senao
     retorne gasDed
  fimse
fimfuncao

// Calculo de imposto devido
funcao impDevido(salario: real; servico: real; cap: real; medico: real; educacao: real): real
inicio
   retorne impTotal(salario, servico, cap) - abatimento(salario, servico, cap, medico, educacao)
fimfuncao

Algoritmo "CONTRIBUINTES"

Var
// Variaveis do usuario
   anSalario, anServico, anCapital, medico, educacao : real
Inicio

   escreval("Digite os dados do contribuinte: ")
   escreva("Renda anual com salario: ")
   leia(anSalario)
   escreva("Renda anual com prestação de serviço: ")
   leia(anServico)
   escreva("Renda anual com ganho de capital: ")
   leia(anCapital)
   escreva("Gastos médicos: ")
   leia(medico)
   escreva("Gastos educacionais: ")
   leia(educacao)
   escreval

 // Apresentação do realtorio
 escreval("RELATÓRIO:")
 escreval
 escreval("Imposto sobre salário: ", impSalario(anSalario):4:2)
 escreval("Imposto sobre serviços: ", impServi(anServico):4:2)
 escreval("Imposto sobre ganho de capital: ", impCapital(anCapital):4:2)
 escreval("Imposto bruto total: ", impTotal(anSalario, anServico, anCapital):4:2)
 escreval("Abatimento: ", abatimento(anSalario, anServico, anCapital, medico, educacao):4:2)
 escreval("Imposto devido: ", impDevido(anSalario, anServico, anCapital, medico, educacao):4:2)

Fimalgoritmo