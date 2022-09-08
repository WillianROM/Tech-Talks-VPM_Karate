Feature: user Details 1
Background:
    * def expectedOutput = read('../data/result1.json')
    * def sleep =
    """
        function(seconds){
            for(i=0;i<=seconds;i++){
                java.lang.Thread.sleep(1*1000);
            }
        }
    """
    * url 'https://reqres.in/api/users'

Scenario: request user 2 details
    Given path 2
    When method GET
    Then status 200
    Then print response
    And match response == expectedOutput[0]

Scenario: request user 4 details
    Given path 4
    When method GET
    Then status 200
    * call sleep 1

