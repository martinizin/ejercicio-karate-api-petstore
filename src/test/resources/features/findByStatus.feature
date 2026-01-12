Feature: Búsqueda de mascotas por estatus

  Background:
    * url baseUrl

  Scenario: Consultar mascotas con estatus 'sold'
    Given path 'pet', 'findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    And match response == '#array'
    # Valido que al menos un elemento cumpla el esquema y tenga status sold
    And match each response contains { status: 'sold' }
    And match response[0] == { id: '#number', name: '#ignore', photoUrls: '#array', tags: '#ignore', status: 'sold', category: '#ignore' }