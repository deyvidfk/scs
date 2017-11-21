# scs - Sistema de Controle de Serviços

Aplicação desenvolvida em Portugol - VisualG para resolução do exercício abaixo:

Todas as soluções devem ser feitas através das estruturas de dados heterogêneas (Registros) e implementadas no visualg.

4-Uma empresa prestadora de serviços armazena informações sobre os serviços prestados. Sabe-se que a empresa pode realizar no máximo três serviços diariamente. É de interessa da direção manter um histórico mensal  (30 dias) sobre os serviços prestados. A empresa realiza quatro tipos de serviços: pintura, jardinagem, faxina e reforma em geral. Cada serviço deve ser cadastrado por código e descrição. Para isso utilize um vetor de quatro posições. O programa deverá mostrar o seguinte menu de opções:

1-cadastro dos tipos de serviços
2-cadastro dos serviços executados
3- Mostrar os serviços prestados em determinado dia
4-Mostrar os serviços prestado dentro de um intervalo de valor
5- Mostrar um relatório geral
6-Sair

Para Opção 1: 
Deve-se cadastrar os tipos de serviços oferecidos pela empresa com código e descrição

Para Opção 2: 
Deve-se considerar que deverão ser cadastrados os serviços prestados ao longo do mês.  Em cada dia podem  ser cadastrados, no máximo, três serviços.
Utilize uma matriz capaz de armazenar em cada posição todas as informações referentes a um serviço prestado. Cada linha representa um dia do mês. Dessa maneira, considera a dimensão da matriz 30x3.
Solicite o dia em que o serviço foi prestado e demais informações.
Lembre-se que a empresa só pode prestar serviço que já tenham sido cadastrados no vetor de tipo de serviços
Caso o usuário digite um código de serviço inválido, o programa deverá mostrar essa mensagem de erro.

Para opção 3: 
O programa deverá receber o dia que se deseja consultar e mostrar os respectivos serviços prestados

Para opção 4: 
O programa deverá receber o valor mínimo e o valor máximo e mostrar os serviços prestados que estiverem neste intervalo

Para opção 5: O programa deverá mostrar todos os serviços prestados, conforme o exemplo a seguir
Dia 01
No. do  serviço	Valor do serviço	Código do serviço	Descrição	Código cliente
100	200	1	pintura	1
150	100	3	faxina	5

Dia 02
No. do  serviço	Valor do serviço	Código do serviço	Descrição	Código cliente
301	600	4	Reforma geral	3
280	352	1	pintura 	2

