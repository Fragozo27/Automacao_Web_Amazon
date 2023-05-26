*** Settings ***
Library   SeleniumLibrary


*** Variables ***

${PESQUISA_TEXT}                twotabsearchtextbox
${PESQUISA_BUTTON}              nav-search-submit-button
${RESULTADO}                    //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]
${TITULO}                       //span[@class='a-size-large product-title-word-break'][contains(.,'Console Xbox Series S')]
${ADICIONAR_CARRIONHO}          //input[contains(@name,'submit.add-to-cart')]
${PRODUTO_ADD}                  //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${CARRINHO}                     //span[@aria-hidden='true'][contains(.,'Carrinho')]
${CARRINHO_DE_COMPRAS}          //h1[contains(.,'Carrinho de compras')]
${EXCLUIR_ITEM}                //input[contains(@value,'Excluir')]
${CARRINHO_VAZIO}               //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***

Abrir navegador 
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
Fechar navegador 
    Close All Browsers
    Capture Page Screenshot

Acessar a home page do site Amazon.com.br
    Go To    https://www.amazon.com.br/
    
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible        ${PESQUISA_TEXT} 
    Input Text                           ${PESQUISA_TEXT}    ${PRODUTO}

Clicar no botão de pesquisa
    Click Button                         ${PESQUISA_BUTTON}

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
#"Console Xbox Series S" 
    Wait Until Element Is Visible        ${RESULTADO}
    Element Should Be Visible            (//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element                        (//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')])[1]
    Wait Until Element Is Visible        ${TITULO}
    Click Element                        ${ADICIONAR_CARRIONHO}            
Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible        ${PRODUTO_ADD}
    Click Element                        ${CARRINHO}
    Wait Until Element Is Visible        ${CARRINHO_DE_COMPRAS}
    Element Should Be Visible            //span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Verificar se o "${produto}" esta no carrinho
    Click Element                        ${CARRINHO}
    Wait Until Element Is Visible        ${CARRINHO_DE_COMPRAS}
    Element Should Be Visible            //span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible        ${EXCLUIR_ITEM}
    Click Element                        ${EXCLUIR_ITEM}
    Wait Until Element Is Visible        ${CARRINHO_VAZIO}

Verificar se o carrinho fica vazio
    Element Should Be Visible            ${CARRINHO_VAZIO}


#GERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho

Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

E existe o produto "${PRODUTO}" no carrinho
   Quando adicionar o produto "${PRODUTO}" no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Verificar se o "Console Xbox Series S" esta no carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
    