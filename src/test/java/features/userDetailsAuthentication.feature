@ignore
Feature: API Authenticantion

Background:
    * url 'https://reqres.in/api/register'

Scenario: Authenticantion test
    Given path 'toke'
    And form field grant_type = 'client_credentials'
    And form field client_id = ''
    And form field client_secret = ''
    When method POST
    Then status 200

    * def accessToken = response.access_token

    Given path ''
    And header Authorization = 'Bearer' + accessToken
    When method GET
    Then status 200