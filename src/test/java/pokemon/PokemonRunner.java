package pokemon;

import com.intuit.karate.junit5.Karate;

class PokemonRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("pokeapi").relativeTo(getClass());
    }    

}
