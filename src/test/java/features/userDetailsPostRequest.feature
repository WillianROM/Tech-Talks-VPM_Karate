# https://www.youtube.com/watch?v=3v7TqvM1RE4&list=PLMd2VtYMV0OQkXQ5BrHlZwoTqp17ACsnG&index=5
Feature: post call test

Background:
    * def jsonPayload = read('../data/request1.json')
    * url 'https://reqres.in/api/users'
    # Deixando o header em background
    * header Content-Type = 'application/json'

Scenario: create user details
    And request jsonPayload
    And param delay = 3
    # Para apenas um header
    And header Content-Type = 'application/json'
    # Para quando houver mais de um header
    And headers {Content-Type: 'application/json', Accept: 'application/json'}
    When method post
    Then status 201
    And print 'response---',response