Algoritmo "registros"
// Disciplina  :  [Linguagem e L�gica de Programa��o]
// Professor   : Antonio Carlos Nicolodi
// Descri��o   : estruturas de dados heterog�neas (Registros)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 11/10/2017
tipo

   // Estrutura heterog�nea - Servi�o
   servico_model = registro
      cod:                  inteiro
      cod_tipo_servico:     inteiro
      cod_cliente:          inteiro
      dia:                  inteiro
      valor:                real
   fimregistro

   // Estrutura heterog�nea - Tipo de servi�o
   tipo_servico_model = registro
      cod:                  inteiro
      descricao:            caractere
   fimregistro


   // Se��o de Declara��es das vari�veis
Var

   // Lista de servi�os - Matriz de 30x3
   lista_servicos: vetor[1..30, 1..3] de servico_model
   lista_servicos_count:inteiro

   // Lista de Tipos de Servi�os - Vetor de 4 posi��es
   lista_tipos_servicos: vetor[1..4] de tipo_servico_model
   lista_tipos_servicos_count:inteiro


Procedimento exibir_menu()
var menu_selecao:inteiro
inicio
   escreval("0 - SAIR")
   escreval("1 - CADASTRAR TIPOS DE SERVI�OS")
   escreval("2 - REGISTRAR PRESTA��O DE SERVI�O")
   escreval("3 - BUSCAR SERVI�OS POR DIA")
   escreval("4 - BUSCAR SERVI�OS POR INTERVALO DE DATAS")
   escreval("5 - EXIBIR RELAT�RIOS")

   leia(menu_selecao)
   limpatela()
   // a a��o � executada com base nas op��es acima
   escolha menu_selecao
   caso 0
      escreval("0 - SAIR")
   caso 1
      escreval("CADASTRAR TIPO DE SERVI�O: ")
      //Chama o m�todo dr cadasto
      registrar_tipo_servico()
   caso 2
      escreval("REGISTRAR PRESTA��O DE SERVI�O: ")
      registrar_prestacao_servico()
   caso 3
      escreval("BUSCAR SERVI�OS POR DIA: ")
      listar_servicos_por_dia()
   caso 4
      escreval("BUSCAR SERVI�OS POR INTERVALO DE DATAS")
      listar_servicos_por_faixa_de_preco()

   caso 5
      escreval("RELAT�RIO")
      listar_servicos_prestados()
      //Execu��o realizada caso o valor digitado n�o esteja entre entre os caso esperado
   outrocaso
      // Tratamento de erro:
      escreval("AVISO: A OP��O N�O � RECONHECIDA PELO SISTEMA. TENTE NOVAMENTE.")
   fimescolha

   SE  menu_selecao <> 0 ENTAO
      exibir_menu()
   FIMSE
FimProcedimento


Procedimento registrar_tipo_servico()

var next_index :inteiro

inicio

   next_index <- lista_tipos_servicos_count +1

   SE next_index > 4 ENTAO
      escreval("ATEN��O! LIMITE DE ITENS INSERIDOS NO SISTEMA EXCEDIDO.")
   SENAO
      escreval("C�DIGO PARA O SERVI�O:")
      leia(lista_tipos_servicos[next_index].cod)
      escreval("DESCRI��O DO SERVI�O:")
      leia(lista_tipos_servicos[next_index].descricao)
      escreval("SERVI�O REGISTRADO COM SUCESSO!")

      // Atualiza a variavel com o numero de itens j� inseridos na lista
      lista_tipos_servicos_count <-  next_index
   FIMSE
FimProcedimento


Procedimento registrar_prestacao_servico()

var temp_int:inteiro
   temp_dia:inteiro
   // Variavel para guardar a quantidade de itens inseridos ni dua
   temp_contador_servico:inteiro
inicio

   temp_contador_servico <- 1

   escreval("DIA DO MES:")
   leia(temp_dia)


   ENQUANTO temp_contador_servico <= 3 FACA

      lista_servicos[temp_dia, temp_contador_servico].dia <- temp_dia

      //Pula linha
      escreval("")


      escreval("TIPO DE SERVI�O:")

      leia(temp_int)

      temp_int <- retornar_index_do_tipo_servico_na_lista(temp_int)

      SE temp_int = -1 ENTAO
         escreval("ATEN��O! C�DIGO N�O ENCONTRADO, TENTE NOVAMENTE.")
      SENAO

         lista_servicos[temp_dia, temp_contador_servico].cod <- temp_contador_servico


         // insere o c�dido do tipo de servi�o na lista
         lista_servicos[temp_dia, temp_contador_servico].cod_tipo_servico <- temp_int

         escreval("C�DIGO DO CLIENTE:")
         leia(lista_servicos[temp_dia, temp_contador_servico].cod_cliente)

         escreval("VALOR:")
         leia(lista_servicos[temp_dia, temp_contador_servico].valor)

         escreval("ITEM INSERIDO COM SUCESSO!")
         //Pula linha
         escreval("")
         //Pula linha
         escreval("")
      FIMSE


      temp_contador_servico <- temp_contador_servico +1
   FIMENQUANTO


   // Atualiza a variavel com o numero de itens j� inseridos na lista
   lista_tipos_servicos_count <-  lista_tipos_servicos_count +1
FimProcedimento

// -1 � item n�o encontrado
// Maior que -1 � o index do item na lista
Funcao retornar_index_do_tipo_servico_na_lista(cod:inteiro):inteiro

var temp_int:inteiro
   index_retorno:inteiro
inicio

   index_retorno <- -1
   temp_int <- 1

   ENQUANTO (temp_int <= lista_tipos_servicos_count ) FACA

      SE lista_tipos_servicos_count = 0 ENTAO
         INTERROMPA
      FIMSE

      SE lista_tipos_servicos[temp_int].cod = cod  ENTAO
         index_retorno <- temp_int
         interrompa
      FIMSE
      temp_int <- temp_int + 1
   FIMENQUANTO

   RETORNE index_retorno

Fimfuncao

Procedimento listar_servicos_por_dia()
var aux_index:inteiro
   aux_index_tipo_servico:inteiro
   dia:inteiro
INICIO
   escreval("Informa o dia")
   leia(dia)

   SE dia > 0  ENTAO

      PARA aux_index  DE 1 ATE 3 FACA
         aux_index_tipo_servico <- retornar_index_do_tipo_servico_na_lista(lista_servicos[dia, aux_index].cod_tipo_servico)
         escreval("-------------------------------------------------------")
         escreval("C�digo                        :",lista_servicos[dia, aux_index].cod)
         escreval("Valor                         :",lista_servicos[dia, aux_index].valor)
         escreval("Tipo de Servi�o - C�digo      :",lista_tipos_servicos[aux_index_tipo_servico].cod)
         escreval("Tipo de Servi�o - Descri��o   :",lista_tipos_servicos[aux_index_tipo_servico].descricao)
         escreval("C�digo Cliente                :",lista_servicos[dia, aux_index].cod_cliente)
         escreval("-------------------------------------------------------")
         escreval("")
      FIMPARA

   SENAO
      escreval("ERRO: Dia Inv�lido!")
   FIMSE

Fimprocedimento


Procedimento listar_servicos_por_faixa_de_preco()
var aux_index:inteiro
   aux_index_dia_mes:inteiro
   aux_index_tipo_servico:inteiro
   preco_min:real
   preco_max:real
   temp_valor:real
INICIO
   aux_index_dia_mes <-1
   aux_index <-1
   
   
   escreval("Pre�o m�nimo:")
   leia(preco_min)
   escreval("Pre�o m�ximo:")
   leia(preco_max)

   PARA aux_index_dia_mes  DE 1 ATE 30 FACA
      PARA aux_index  DE 1 ATE 3 FACA

         temp_valor   <- lista_servicos[aux_index_dia_mes, aux_index].valor
         SE (temp_valor >= preco_min) E (temp_valor <= preco_max) ENTAO

            escreval("-------------------------------------------------------")
            escreval("C�digo                        :",lista_servicos[aux_index_dia_mes, aux_index].cod)
            escreval("C�digo Cliente                :",lista_servicos[aux_index_dia_mes, aux_index].cod_cliente)
            escreval("Valor                         :",lista_servicos[aux_index_dia_mes, aux_index].valor)

            aux_index_tipo_servico <- retornar_index_do_tipo_servico_na_lista(lista_servicos[aux_index_dia_mes, aux_index].cod_tipo_servico)
            escreval("Tipo de Servi�o - C�digo      :",lista_tipos_servicos[aux_index_tipo_servico].cod)
            escreval("Tipo de Servi�o - Descri��o   :",lista_tipos_servicos[aux_index_tipo_servico].descricao)

            escreval("-------------------------------------------------------")
            escreval("")
         FIMSE
      FIMPARA
   FIMPARA
Fimprocedimento




Procedimento listar_servicos_prestados()
var aux_index:inteiro
   aux_index_dia_mes:inteiro
   aux_index_tipo_servico:inteiro
   temp_valor:real
INICIO
   aux_index_dia_mes <-1
   aux_index <-1

   PARA aux_index_dia_mes  DE 1 ATE 30 FACA
      PARA aux_index  DE 1 ATE 3 FACA

         SE (lista_servicos[aux_index_dia_mes, aux_index].cod > 0) ENTAO

            escreval("DIA: ", aux_index_dia_mes)
            escreval("-------------------------------------------------------")
            escreval("C�digo                        :",lista_servicos[aux_index_dia_mes, aux_index].cod)
            escreval("C�digo Cliente                :",lista_servicos[aux_index_dia_mes, aux_index].cod_cliente)
            escreval("Valor                         :",lista_servicos[aux_index_dia_mes, aux_index].valor)

            aux_index_tipo_servico <- retornar_index_do_tipo_servico_na_lista(lista_servicos[aux_index_dia_mes, aux_index].cod_tipo_servico)
            escreval("Tipo de Servi�o - C�digo      :",lista_tipos_servicos[aux_index_tipo_servico].cod)
            escreval("Tipo de Servi�o - Descri��o   :",lista_tipos_servicos[aux_index_tipo_servico].descricao)

            escreval("-------------------------------------------------------")
            escreval("")
         FIMSE
      FIMPARA
   FIMPARA
Fimprocedimento


Inicio

   // Se��o de Comandos, procedimento, fun��es, operadores, etc...

   exibir_menu() ;

Fimalgoritmo