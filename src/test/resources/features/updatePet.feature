Feature: Actualización de datos de mascota

  Background:
    * url baseUrl
    # Precondición: Crear mascota
    * def createResult = call read('addPet.feature')
    * def petId = createResult.response.id
    * def updatePayload = read('classpath:data/updatePet.json')

  Scenario: Actualizar el nombre y estatus de la mascota a "sold"
    Given path 'pet'
    And request updatePayload
    When method put
    Then status 200
    And match response.id == petId
    And match response.status == 'sold'
    And match response.name == 'Kiraa Adoptada'