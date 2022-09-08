# https://www.youtube.com/watch?v=MUgG_n0WuvM&list=PLMd2VtYMV0OQkXQ5BrHlZwoTqp17ACsnG
# https://www.youtube.com/watch?v=HPkEC_PuUaU&list=PLMd2VtYMV0OQkXQ5BrHlZwoTqp17ACsnG&index=2
Feature: user Details

Background:
    * def expectedOutput1 = read('../data/result1.json')
    # * def expectedOutput2 = read('result2.json')

Scenario: request user 2 details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response

    # Fazendo match da resposta com os dados json informado
    And match response ==  {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}

    # Fazendo match da resposta com os dados json dentro do arquivo result1.json
    And match response == expectedOutput1[0]

    # Validando o dado do id
    And match response.data.id == 2

    # Validar se o sobrenome não está vazio
    And match response.data.last_name != null

    # Campo job_code é vazio?
    * def job_code = response.data.job_code
    And match job_code == null
 
    # No caso abaixo dá para usar 'Given' ou '*'
    * def myVar = 'test'
    Then print myVar

