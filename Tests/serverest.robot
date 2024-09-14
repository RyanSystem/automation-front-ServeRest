*** Settings ***

Resource    ../resources/resource.resource

*** Test Cases ***

Severest
    [Documentation]    Automação front severest

    Cadastrar novo usuario Severest como admin
    Cadastrar Produto
    Cadastrar novo usuario Severest e logar no sistema
    Pesquisar produto cadastrado

    # Logar novamente com Usuario cadastrado
    # Listar e verificar produto cadastrado


