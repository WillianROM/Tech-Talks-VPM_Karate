Feature: call to token generation feature

Background:
    * def myFeature = call read('userDetailsAuthenticationTest2.feature'){email:'eve.holt@reqres.in', password:'pistol'}
    * def authToken = myFeature.accessToken

Scenario: GET call
    When url 'https://reqres.in/api/users?page=2'
    And header Authorization = authToken
    When method GET
    Then status 200