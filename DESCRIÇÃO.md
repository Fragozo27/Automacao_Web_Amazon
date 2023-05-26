# Automacao_Web_Amazon
Este projeto tem como objetivo desenvolver uma automação web para realizar uma série de ações em um site, utilizando a framework Robot e a biblioteca Selenium. A finalidade principal dessa automação é realizar a pesquisa de um produto, adicionar esse produto ao carrinho e, em seguida, remover o produto do carrinho.

Para alcançar esse objetivo, utilizamos duas abordagens diferentes: o método normal e o método Gherkin BDD (Behavior-Driven Development). Essas metodologias permitem uma organização estruturada dos testes e a escrita de cenários de teste compreensíveis.

A automação é implementada utilizando o Robot Framework, um framework de automação de teste de código aberto que fornece uma sintaxe legível por humanos e é altamente extensível. A biblioteca Selenium é utilizada para interagir com os elementos da página da web, como preencher formulários, clicar em botões e verificar resultados.

O fluxo da automação consiste nas seguintes etapas:

1) Pesquisa do produto: O programa irá inserir um termo de pesquisa no campo apropriado e acionar a pesquisa. Em seguida, ele verificará se os resultados da pesquisa correspondem ao produto desejado.

2) Adição do produto ao carrinho: Após encontrar o produto desejado nos resultados da pesquisa, o programa irá selecioná-lo e adicionar ao carrinho. Será verificado se o produto foi adicionado corretamente.

3) Remoção do produto do carrinho: O programa irá acessar o carrinho, localizar o produto adicionado anteriormente e removê-lo. Será verificado se o produto foi removido com sucesso do carrinho.

Ao utilizar o método normal e o método Gherkin BDD para essa aplicação, tornamos os testes mais estruturados, permitindo uma fácil compreensão dos cenários de teste. O método normal segue uma abordagem mais tradicional, com a escrita de palavras-chave específicas para cada ação, enquanto o método Gherkin BDD utiliza uma linguagem mais descritiva, por meio de cenários escritos em formato natural.

Este projeto disponibiliza os testes de automação web, permitindo a execução rápida e eficiente dessas ações repetitivas, economizando tempo e recursos. Com o uso do Robot Framework e Selenium, garantimos a confiabilidade e precisão dos testes, bem como a escalabilidade para futuras melhorias e expansões do projeto.
