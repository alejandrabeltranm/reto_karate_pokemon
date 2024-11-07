Feature: Obtener movimientos de un Pokémon y validar el poder de un ataque específico

  Background:
    * url 'https://pokeapi.co/api/v2/pokemon'
    * def ordenarMovimientos = read('classpath:pokemon/utils/moveSorting/ordenarMovimientos.js')

  Scenario Outline: Obtener movimientos en orden alfabético y validar el poder de un ataque
    Given path namePokemon
    When method GET
    Then status 200
    * def moves = response.moves
    * def moveNames = []
    * eval karate.forEach(moves, function(move) { moveNames.push(move.move.name) })
    * def orderedMoveNames = ordenarMovimientos(moveNames)
    * print 'Movimientos ordenados:', orderedMoveNames


    Given url 'https://pokeapi.co/api/v2/pokemon/<namePokemon>'
    When method get
    Then status 200
    And def secretPower = response.moves.find(m => m.move.name == 'secret-power')
    And assert secretPower != null
    And def moveUrl = secretPower.move.url
    Given url moveUrl
    When method get
    Then status 200
    And def moveDetails = response
    And def power = moveDetails.power
    And print 'Power value: ' + power
    And assert power == <power-SecretPower>

    Examples:
      | namePokemon | power-SecretPower |
      | pikachu     | 70                |