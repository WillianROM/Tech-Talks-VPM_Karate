
# https://www.youtube.com/watch?v=mslGv9AILOU&list=PLMd2VtYMV0OQkXQ5BrHlZwoTqp17ACsnG&index=9
# Data driven Tests in Karate Framework | Cucumber & Karate ways | Read External CSV file
# https://dummy.restapiexample.com/
Feature: data driven test

Background:
    * url 'https://dummy.restapiexample.com'

Scenario Outline: create user details
    Given path 'api/v1/create'
    And request {"name":<name>,"salary":<salary>,"age":<age>}
    When method POST
    Then status 200
    And print 'response--1',response
    * def result = response


    Given path 'api/v1/employee/'+ result.data.id
    And method GET
    Then status 200
    Then print 'response--2',response
    #And match response.data contains {id:'#(result.data.id)'}


    Examples:
        |name|salary|age|
        |test|123|23|


    Scenario Outline: create user details with CSV file
        Given path 'api/v1/create'
        And request {"name":<name>,"salary":<salary>,"age":<age>}
        When method POST
        Then status 200
        And print 'response--1',response
        * def result = response
    
    
        Given path 'api/v1/employee/'+ result.data.id
        And method GET
        Then status 200
        Then print 'response--2',response
        #And match response.data contains {id:'#(result.data.id)'}
    
    
        Examples:
            |read('../data/inputData.csv')|