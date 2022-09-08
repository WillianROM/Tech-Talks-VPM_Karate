Feature: API Authenticantion

Background:
    * url 'https://reqres.in/api/'
    #   {
    #       'email':'#(email)', | email':'eve.holt@reqres.in',
    #        'password':'#(password)'
    #    }
    
Scenario: Authenticantion test
    * def params = 
    """
        {
            'email':'#(email)',
            'password':'#(password)'
        }
    """
    When path 'oauth2/token'
    And form field grant_type = 'client_credentials'
    # And form field email = 'eve.holt@reqres.in'
    # And form field password = 'pistol'
    And form fields params
    When method POST
    Then status 201
    Then print 'response---', response

    * def accessToken = response.token
    Then print 'accessToken---',accessToken

    When path 'register'
    And header Authorization = 'Bearer' + accessToken
    When method GET