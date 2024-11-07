Feature: API contract test for Pokemon endpoint and Obtener evoluciones de Pokémon desde la API

  Scenario: Verify that Pokemon API returns a 200 status for squirtle
    Given url 'https://pokeapi.co/api/v2/pokemon/squirtle'
    When method GET
    Then status 200

  Scenario Outline: Encontrar las evoluciones del Pokémon y hacer match con las evoluciones conocidas
    Given url 'https://pokeapi.co/api/v2/pokemon/<namePokemon>'
    When method GET
    Then status 200
    And def speciesUrl = response.species.url
    And url speciesUrl
    When method GET
    Then status 200
    And def evolutionChain = response.evolution_chain.url
    And url evolutionChain
    When method GET
    Then status 200
    And def evolutions = response.chain.evolves_to
    And def evolutionNames = []
    And karate.forEach(evolutions, function(evolution) {evolutionNames.push(evolution.species.name); karate.forEach(evolution.evolves_to, function(subEvolution) {evolutionNames.push(subEvolution.species.name);});})
    Then match evolutionNames[0] == '<PokemonEvolution_2>'
    And match evolutionNames[1] == '<PokemonEvolution_3>'

    Examples:
      | namePokemon | PokemonEvolution_2 | PokemonEvolution_3 |
      | charmander  | charmeleon         | charizard          |
      | bulbasaur   | ivysaur            | venusaur           |
      | squirtle    | wartortle          | blastoise          |