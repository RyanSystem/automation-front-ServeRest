*** Settings ***

Resource    ../../resources/resource.resource
Library    Screenshot
Library    String


*** Keywords ***

Create Date user
    [Documentation]    criar massa de dados para os testes

    ${firstName}=     FakerLibrary.First Name   
    ${lastName}=     FakerLibrary.Last Name
    Set Suite Variable       ${NameCompleto}     ${firstName} ${lastName}   
    ${email}=    FakerLibrary.Email
    ${email-teste}    Set Variable    ${firstName}@automation.com.br
    Set Suite Variable    ${email_final}    ${email-teste}
    ${password}=    FakerLibrary.Password
    Set Suite Variable    ${password}

Create date product
    #produtos
    ${name_produ}=    Catch Phrase    
    Set Suite Variable    ${produto}    ${name_produ}
    
    ${preco_prod}=    Generate Random String    2  [NUMBERS]
    Set Suite Variable    ${preco}    ${preco_prod}

    ${description_prod}=    Sentence
    Set Suite Variable    ${descr}    ${description_prod}

    ${qntdd_prod}=    Generate Random String    2  [NUMBERS]
    Set Suite Variable    ${qtdd}    ${qntdd_prod}



Cadastrar novo usuario Severest como admin
    [Documentation]    Abre o site da Severest e faz um cadastro de usuario
    
    Create Date user

    Open Browser    ${url.login}     chrome
    Maximize Browser Window
    Wait Until Element is Visible    ${login}[img]
    Sleep    2
    Click Element    ${login.link_cadastrar}
    Wait Until Element Is Enabled    ${cadastro.name_cadastro}
    Input Text    ${Cadastro.name_cadastro}    ${NameCompleto}
    Input Text    ${Cadastro.email_cadastro}   ${email_final}
    Input Text    ${Cadastro.senha_cadastro}   ${password}
    Click Element    ${Cadastro.check_box_adm}
    Click Element    ${Cadastro.button_cadastro}  
    Sleep    10
Cadastrar novo usuario Severest e logar no sistema
    [Documentation]    Abre o site da Severest e faz um cadastro de usuario
    
    Create Date user

    Wait Until Element is Visible    ${login}[img]
    Sleep    2
    Click Element    ${login.link_cadastrar}
    Wait Until Element Is Enabled    ${cadastro.name_cadastro}
    Input Text    ${Cadastro.name_cadastro}    ${NameCompleto}
    Input Text    ${Cadastro.email_cadastro}   ${email_final}
    Input Text    ${Cadastro.senha_cadastro}   ${password}
    Click Element    ${Cadastro.button_cadastro}  
    Sleep    10

Cadastrar Produto
    [Documentation]    Cadastrar um novo produto

    Create date product

    Wait Until Element Is Visible    ${Principal.new_product}
    Click Element    ${Principal.new_product}
    Input Text    ${Novo_produto.nome_prod}    ${produto}
    Input Text    ${Novo_produto.preco}    ${preco}
    Input Text    ${Novo_produto.descricao}    ${descr}
    Input Text    ${Novo_produto.qtdd_prod}    ${qtdd}
    Click Element     ${Novo_produto.btn_cad} 
    Sleep    2
    Click Element    ${Principal.button_logout}


Pesquisar produto cadastrado 
    [Documentation]    Pesquisar produto e add no carrinho de compras
    Sleep    10
    Input Text    ${Principal.pesquisar_input}    ${produto}
    Click Element    ${Principal.button_pesquisar}
    Sleep    10

Adicionar produto ao carrinho  
    [Documentation]    Adicionar produto ao carrinho
    Click Element    ${Produtos_cadastrados.btn_add_lista}
    Click Element    ${Produtos_cadastrados.btn_add_carrinho}