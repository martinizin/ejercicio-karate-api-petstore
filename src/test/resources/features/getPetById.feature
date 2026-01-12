Feature: Consulta de mascotas por ID

  Background:
    * url baseUrl
    # Precondición: Crear una mascota para asegurarme que existe el ID
    * def petPayload = read('classpath:data/pets.json')
    * def result = call read('addPet.feature')
    * def createdId = result.response.id

  Scenario: Consultar la mascota ingresada previamente por ID
    Given path 'pet', createdId
    When method get
    Then status 200
    And match response.id == createdId
    And match response.name == '#string'
    And match response.status == '#present'