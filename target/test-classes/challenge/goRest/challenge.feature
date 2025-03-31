Feature: go rest challenge

  Background:
    * url 'https://gorest.co.in'

  Scenario: create new user
    * def body =
    """
    {
    "name": "Challenge Testing",
    "gender": "male",
    "email": "challenge.testing@test.com",
    "status": "active"
    }
    """
    Given path '/public/v2/users'
    When header accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + '881e444956ad119008f2437f1718b0592cd4a36777bde802348ff96a9818d745'
    And request body
    And method POST
    Then status 201
    * def expectedName = body.name
    And match response.name == expectedName
    * def userId = response.id

  Scenario: get a user and check data
    Given path '/public/v2/users/' + '7805567'
    When header accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + '881e444956ad119008f2437f1718b0592cd4a36777bde802348ff96a9818d745'
    And method GET
    Then status 200
    * print response
    * def expectedName = 'Testing'
    And assert response.name == expectedName

  Scenario: get all users and check list is not empty
    Given path '/public/v2/users'
    When header accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + '881e444956ad119008f2437f1718b0592cd4a36777bde802348ff96a9818d745'
    And method GET
    Then status 200
    And assert response.length>0