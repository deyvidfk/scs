Algoritmo "registros"
// Disciplina  :  [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : estruturas de dados heterogêneas (Registros)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 11/10/2017
tipo

   // Estrutura heterogênea - Serviço
   servico_model = registro
      cod:                  inteiro
      cod_tipo_servico:     inteiro
      cod_cliente:          inteiro
      dia:                  inteiro
      valor:                real
   fimregistro

   // Estrutura heterogênea - Tipo de serviço
   tipo_servico_model = registro
      cod:                  inteiro
      descricao:            caractere
   fimregistro


   // Seção de Declarações das variáveis
Var

   // Lista de serviços - Matriz de 30x3
   lista_servicos: vetor[1..30, 1..3] de servico_model
   lista_servicos_count:inteiro

   // Lista de Tipos de Serviços - Vetor de 4 posições
   lista_tipos_servicos: vetor[1..4] de tipo_servico_model
   lista_tipos_servicos_count:inteiro


Procedimento exibir_menu()
var menu_selecao:inteiro
inicio
   escreval("0 - SAIR")
   escreval("1 - CADASTRAR TIPOS DE SERVIÇOS")
   escreval("2 - REGISTRAR PRESTAÇÃO DE SERVIÇO")
   escreval("3 - BUSCAR SERVIÇOS POR DIA")
   escreval("4 - BUSCAR SERVIÇOS POR INTERVALO DE DATAS")
   escreval("5 - EXIBIR RELATÓRIOS")

   leia(menu_selecao)
   limpatela()
   // a ação é executada com base nas opções acima
   escolha menu_selecao
   caso 0
      escreval("0 - SAIR")
   caso 1
      escreval("CADASTRAR TIPO DE SERVIÇO: ")
      //Chama o método dr cadasto
      registrar_tipo_servico()
   caso 2
      escreval("REGISTRAR PRESTAÇÃO DE SERVIÇO: ")
      registrar_prestacao_servico()
   caso 3
      escreval("BUSCAR SERVIÇOS POR DIA: ")
      listar_servicos_por_dia()
   caso 4
      escreval("BUSCAR SERVIÇOS POR INTERVALO DE DATAS")
      listar_servicos_por_faixa_de_preco()

   caso 5
      escreval("RELATÓRIO")
      listar_servicos_prestados()
      //Execução realizada caso o valor digitado não esteja entre entre os caso esperado
   outrocaso
      // Tratamento de erro:
      escreval("AVISO: A OPÇÃO NÃO É RECONHECIDA PELO SISTEMA. TENTE NOVAMENTE.")
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
      escreval("ATENÇÃO! LIMITE DE ITENS INSERIDOS NO SISTEMA EXCEDIDO.")
   SENAO
      escreval("CÓDIGO PARA O SERVIÇO:")
      leia(lista_tipos_servicos[next_index].cod)
      escreval("DESCRIÇÃO DO SERVIÇO:")
      leia(lista_tipos_servicos[next_index].descricao)
      escreval("SERVIÇO REGISTRADO COM SUCESSO!")

      // Atualiza a variavel com o numero de itens já inseridos na lista
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


      escreval("TIPO DE SERVIÇO:")

      leia(temp_int)

      temp_int <- retornar_index_do_tipo_servico_na_lista(temp_int)

      SE temp_int = -1 ENTAO
         escreval("ATENÇÃO! CÓDIGO NÃO ENCONTRADO, TENTE NOVAMENTE.")
      SENAO

         lista_servicos[temp_dia, temp_contador_servico].cod <- temp_contador_servico


         // insere o códido do tipo de serviço na lista
         lista_servicos[temp_dia, temp_contador_servico].cod_tipo_servico <- temp_int

         escreval("CÓDIGO DO CLIENTE:")
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


   // Atualiza a variavel com o numero de itens já inseridos na lista
   lista_tipos_servicos_count <-  lista_tipos_servicos_count +1
FimProcedimento

// -1 é item não encontrado
// Maior que -1 é o index do item na lista
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
         escreval("Código                        :",lista_servicos[dia, aux_index].cod)
         escreval("Valor                         :",lista_servicos[dia, aux_index].valor)
         escreval("Tipo de Serviço - Código      :",lista_tipos_servicos[aux_index_tipo_servico].cod)
         escreval("Tipo de Serviço - Descrição   :",lista_tipos_servicos[aux_index_tipo_servico].descricao)
         escreval("Código Cliente                :",lista_servicos[dia, aux_index].cod_cliente)
         escreval("-------------------------------------------------------")
         escreval("")
      FIMPARA

   SENAO
      escreval("ERRO: Dia Inválido!")
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
   
   
   escreval("Preço mínimo:")
   leia(preco_min)
   escreval("Preço máximo:")
   leia(preco_max)

   PARA aux_index_dia_mes  DE 1 ATE 30 FACA
      PARA aux_index  DE 1 ATE 3 FACA

         temp_valor   <- lista_servicos[aux_index_dia_mes, aux_index].valor
         SE (temp_valor >= preco_min) E (temp_valor <= preco_max) ENTAO

            escreval("-------------------------------------------------------")
            escreval("Código                        :",lista_servicos[aux_index_dia_mes, aux_index].cod)
            escreval("Código Cliente                :",lista_servicos[aux_index_dia_mes, aux_index].cod_cliente)
            escreval("Valor                         :",lista_servicos[aux_index_dia_mes, aux_index].valor)

            aux_index_tipo_servico <- retornar_index_do_tipo_servico_na_lista(lista_servicos[aux_index_dia_mes, aux_index].cod_tipo_servico)
            escreval("Tipo de Serviço - Código      :",lista_tipos_servicos[aux_index_tipo_servico].cod)
            escreval("Tipo de Serviço - Descrição   :",lista_tipos_servicos[aux_index_tipo_servico].descricao)

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
            escreval("Código                        :",lista_servicos[aux_index_dia_mes, aux_index].cod)
            escreval("Código Cliente                :",lista_servicos[aux_index_dia_mes, aux_index].cod_cliente)
            escreval("Valor                         :",lista_servicos[aux_index_dia_mes, aux_index].valor)

            aux_index_tipo_servico <- retornar_index_do_tipo_servico_na_lista(lista_servicos[aux_index_dia_mes, aux_index].cod_tipo_servico)
            escreval("Tipo de Serviço - Código      :",lista_tipos_servicos[aux_index_tipo_servico].cod)
            escreval("Tipo de Serviço - Descrição   :",lista_tipos_servicos[aux_index_tipo_servico].descricao)

            escreval("-------------------------------------------------------")
            escreval("")
         FIMSE
      FIMPARA
   FIMPARA
Fimprocedimento


Inicio

   // Seção de Comandos, procedimento, funções, operadores, etc...

   exibir_menu() ;

Fimalgoritmo