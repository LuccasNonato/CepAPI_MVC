# CepAPI_MVC

Projeto API CEP foi desenvolvido com MVC e algumas tecnicas de padrões de projetos sendo strategy para identificar em tempo de execução qual API o codigo deve utilizar, no caso ele retornara os dados da primeira que responder.




APP 

Esse é um exemplo básico selecionando qual API utilizada.
<img width="627" height="472" alt="App_Selecionando_Api_Desejada" src="https://github.com/user-attachments/assets/2425b82a-396a-439a-8bd9-abc958862dc1" />

Esse é um exemplo que ele buscará automaticamente dentro das 3 apis da minha strategy sendo Awesome, ViaCep e ApiCep porém não obtive resposta da ApiCep em todo esse tempo de desenvolvimento do codigo.
<img width="628" height="474" alt="App_Todos" src="https://github.com/user-attachments/assets/e6924f2b-a342-4109-b1e2-8b3898c39ee6" />



API
Esse é os resultados das consultas pela api utilizando DMVC.

API Cep
<img width="1196" height="512" alt="Busca_Cep_Apicep" src="https://github.com/user-attachments/assets/2f51ef2f-569d-4bd3-97dc-f45dd1508350" />

API Awesome
<img width="825" height="500" alt="Busca_Cep_Awesome" src="https://github.com/user-attachments/assets/7a28167e-1993-40bd-b079-8001992ab45f" />

API ViaCep
<img width="768" height="462" alt="Busca_Cep_viacep" src="https://github.com/user-attachments/assets/78f35f93-d2ac-45dd-9039-1ed7d607639c" />

Deixando ele como /api/cep/ + cepdigitado ele buscara automaticamente dentro da minha strategy
<img width="758" height="432" alt="buscacep_automatico" src="https://github.com/user-attachments/assets/0aa7ba56-5425-4023-8fa1-63927055f9e8" />


TDD
Teste básico apenas para buscar se as APIS retornam dados.
<img width="1631" height="943" alt="Teste_APIS" src="https://github.com/user-attachments/assets/927df274-9199-4a2a-a695-021ecc840876" />


Projeto todo nativo apenas utilizando o framework DMVC para a construção da API.
Versão do Delphi 12 Comunity Edition para estudos mas o projeto pode facilmente ser modificado para versões mais antigas.

Em minha primeira pasta encontro o BuscaCep.Projeto aonde está o meu grupo de projetos.
Pasta src/MVC encontra todo o codigo sendo o model/controller e o view aonde primeiramente foi desenvolvido o APP.
A Separação foi feita como foi ensinado nos cursos do clube do programador tentando sempre deixar o mais legivel e fácil de identificar cada item.

Pasta src_APIMVCFramework encontra o projeto do DMVC aonde ele cria o servidor e deixa online para efetuar a busca.
O Caminho de busca é localhost:8080/api/cep/ + cepdesejado

Caso queira fazer a busca em uma api especifica entre elas Awesome, ViaCep ou ApiCep
O Caminho de busca é localhost:8080/api/awesome/cep/ + cepdesejado
O Caminho de busca é localhost:8080/api/viacep/cep/ + cepdesejado
O Caminho de busca é localhost:8080/api/apicep/cep/ + cepdesejado

Pasta src_TDD_DUnit é onde encontra o meu teste fazendo a validação se retorna os dados das apis requisitadas.

Resumo: Todo projeto foi feito utilizando MVC e tecnicas para deixar o codigo totalmente desacoplado aonde para criar novas apis para busca apenas adicionaria em minha strategy, todos os modulos compartilham do meu Model e controller dessa forma fica facil 
a busca de dados para demais projetos utilizarem, se futuramente ocorrer de criar um novo projeto de vendas aonde eu registro o cliente e faço a busca do cep ja estaria pronto toda a busca sem ser necessário criar algo novo.

Em meu estudos cada dia mais tento desviar do if até porque if bom é if morto então nesse projeto utilizei algumas coisas que geralmente não utilizo como um TDictionary<T> sendo ele genérico e passando uma lista que eu queira criar e fazer busca, em meus estudos 
do C# vejo que a linguagem executa o tempo todo listas então isso tras uma robustes para a linguagem, pensando assim futuramente devo utilizar mais listas no delphi e correr do velho if ou case que caso for mal executado sem um exit ele ainda acaba passando por 
cada etapa.


O projeto em si foi um desafio muito grande mas muito gostoso de criar.

Continuarei buscando cada vez mais e aperfeiçoando meu conhecimento tanto no delphi que é uma linguagem que gosto muito quanto demais tenologias.
