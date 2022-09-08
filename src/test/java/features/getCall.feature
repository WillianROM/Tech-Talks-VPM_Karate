# https://www.youtube.com/watch?v=63IhIHZvzGM&list=PLMd2VtYMV0OQkXQ5BrHlZwoTqp17ACsnG&index=7
# JavaScript Functions in Karate Framework | Loops and Conditions | Part 7

Feature: user Details

Background:
    * def expectedOutput = read('../data/result1.json')

Scenario: request user 3 details
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    * def myFun1 = function(){ return 'Hello, world!'}
    * def returnedData1 = call myFun1
    Then print 'returnedData1---',returnedData1
    * def myFun2 = 
    """
        function(){
            return 'myData'
        }
    """
    * def returnedData2 = call myFun2
    Then print returnedData2

Scenario: request of many user details
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    * def data = response.data
    Then print 'data---', data
    * def myFun =
    """
        function(arg){
            //return arg.length
            //return arg[0].id
            for(i=0; i<arg.length;i++){
                if(arg[i].id == 9 ){
                    return arg[i]
                }
            }
        }
    """
    * def numberOfUsers = call myFun data
    Then print 'numberOfUsers---',numberOfUsers