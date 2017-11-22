# SCS - Sistema de Controle de Serviços
Aplicação desenvolvida em Portugol - <a href="http://visualg3.com.br/" target="_blank" title="Link para página oficial do VisualG 3.0">VisualG 3.0 </a> para resolução do exercício abaixo: 
<p>
Todas as soluções devem ser feitas através das estruturas de dados heterogêneas (Registros); 
</p>
<p>
Uma empresa prestadora de serviços armazena informações sobre os serviços prestados. Sabe-se que a empresa pode realizar no máximo três serviços diariamente. É de interessa da direção manter um histórico mensal (30 dias) sobre os serviços prestados. A empresa realiza quatro tipos de serviços: pintura, jardinagem, faxina e reforma em geral. Cada serviço deve ser cadastrado por código e descrição. Para isso utilize um vetor de quatro posições. O programa deverá mostrar o seguinte menu de opções:
</p>
<ol>
  <li>cadastro dos tipos de serviços
  </li>
  <li>cadastro dos serviços executados</li>
  <li>Mostrar os serviços prestados em determinado dia
  </li>
  <li>Mostrar os serviços prestado dentro de um intervalo de valor
  </li>
  <li>Mostrar um relatório geral
  </li>
  <li>Sair</li>
</ol>
Para Opção 1:
<ul>
  <li>Deve-se cadastrar os tipos de serviços oferecidos pela empresa com código e descrição</li>
</ul>
Para Opção 2:
<ul>
  <li>Deve-se considerar que deverão ser cadastrados os serviços prestados ao longo do mês. Em cada dia podem ser cadastrados, no máximo, três serviços.</li>
  <li> Utilize uma matriz capaz de armazenar em cada posição todas as informações referentes a um serviço prestado. Cada linha representa um dia do mês. Dessa maneira, considera a dimensão da matriz 30x3. </li>
  <li>Solicite o dia em que o serviço foi prestado e demais informações. </li>
  <li>Lembre-se que a empresa só pode prestar serviço que já tenham sido cadastrados no vetor de tipo de serviços</li>
  <li> Caso o usuário digite um código de serviço inválido, o programa deverá mostrar essa mensagem de erro.</li>
</ul>
Para opção 3:
<ul>
  <li>O programa deverá receber o dia que se deseja consultar e mostrar os respectivos serviços prestados</li>
</ul>
Para opção 4:
<ul>
  <li>O programa deverá receber o valor mínimo e o valor máximo e mostrar os serviços prestados que estiverem neste intervalo
  </li>
</ul>
Para opção 5:
<ul>
  <li>O programa deverá mostrar todos os serviços prestados, conforme o exemplo a seguir:</li>
</ul>
<h4>Dia 01</h4>
<table summary="Dia 01">
  <thead>
    <tr>
      <th>No. do serviço</th>
      <th>Valor do serviço</th>
      <th>Código do serviço</th>
      <th>Descrição </th>
      <th>Código cliente</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>100</td>
      <td>200</td>
      <td>1</td>
      <td>pintura</td>
      <td>1</td>
    </tr>
    <tr>
      <td>150</td>
      <td>100</td>
      <td>3</td>
      <td>faxina</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
<h4>Dia 02</h4>
<table summary="Dia 02">
  <thead>
    <tr>
      <th>No. do serviço</th>
      <th>Valor do serviço</th>
      <th>Código do serviço</th>
      <th>Descrição </th>
      <th>Código cliente</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>301</td>
      <td>600 </td>
      <td>4</td>
      <td>Reforma geral</td>
      <td>3</td>
    </tr>
    <tr>
      <td>280</td>
      <td>352 </td>
      <td>1</td>
      <td>pintura </td>
      <td>2</td>
    </tr>
  </tbody>
</table>