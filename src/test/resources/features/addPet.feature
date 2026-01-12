Feature: Gestión de creación de mascotas en PetStore

  Background:
    * url baseUrl
    * def petPayload = read('classpath:data/pets.json')

  Scenario: Añadir una nueva mascota a la tienda exitosamente
    Given path 'pet'
    And request petPayload
    When method post
    Then status 200
    And match response.name == petPayload.name
    And match response.id == '#number'
    And match response.status == 'available'
    * print 'Mascota creada con ID:', response.id