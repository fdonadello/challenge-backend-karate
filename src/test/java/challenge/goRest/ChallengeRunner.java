package challenge.goRest;

import com.intuit.karate.junit5.Karate;

class ChallengeRunner {
    
    @Karate.Test
    Karate challengeTests() {
        return Karate.run("goRest").relativeTo(getClass());
    }    

}
