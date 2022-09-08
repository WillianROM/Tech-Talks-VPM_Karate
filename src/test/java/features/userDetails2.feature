Feature: user Details

Background:
    * def expectedOutput1 = read('../data/result1.json')
    #* def feature1 = read('userDetails1.feature')
    #* def result = call feature1
    * def result = call read('userDetails1.feature')

Scenario: request user 3 details
    # https://www.youtube.com/watch?v=J2A3qiFfWzI&list=PLMd2VtYMV0OQkXQ5BrHlZwoTqp17ACsnG&index=4
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    And match response == expectedOutput1[1]
    #Then print response
    Then print 'result-----',result
    * def first_name = result.response.data.first_name
    Then print 'first_name---',first_name
