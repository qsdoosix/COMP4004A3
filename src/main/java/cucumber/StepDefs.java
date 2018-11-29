package cucumber;

import static org.junit.Assert.assertEquals;

import common.Poker;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class StepDefs {
	protected common.Poker game = new Poker();
	@Given("^([^\"]*) have ([^\"]*)")
	public void Give_Card(String user, String card) throws Exception {
		if(user.equalsIgnoreCase("AIP")) {
			game.givecardAIP(game.cardcreator(card));
		}else if(user.equalsIgnoreCase("Player")) {
			game.givecardP(game.cardcreator(card));
		}
	}

	@Then("^([^\"]*) should win$")
	public void decidewinner(String user) throws Exception {
		game.displayHand(false);
		game.displayHand(true);
		game.compareHand();
		if(user.equalsIgnoreCase("AIP")) {
			assertEquals(game.winner,1);
		}else if(user.equalsIgnoreCase("Player")) {
			assertEquals(game.winner,0);
		}
	}
	@Then("^Player holds ([^\"]*)")
	public void Player_Has(String hand) throws Exception {
		if(hand.equalsIgnoreCase("Royalflush")) {
			assertEquals(game.isRoyalFlush(game.player_hand),true);
			
		}else if(hand.equalsIgnoreCase("StraightFlush")) {
			assertEquals(game.isStraightFlush((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("Straight")) {
			assertEquals(game.isStraight((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("Flush")) {
			assertEquals(game.isFlush((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("FourOfAKind")) {
			assertEquals(game.is4oK((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("FullHouse")) {
			assertEquals(game.isFHouse((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("ThreeOfAKind")) {
			assertEquals(game.is3oK((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("TwoPairs")) {
			assertEquals(game.is2Pair((game.player_hand)),true);
		}else if(hand.equalsIgnoreCase("Pair")) {
			assertEquals(game.isPair((game.player_hand)),true);
		}else {
			assertEquals(hand.equalsIgnoreCase("Single"),true);
		}
	}
	@Then("^AIP holds ([^\"]*)")
	public void AIP_Has(String hand) throws Exception {
		if(hand.equalsIgnoreCase("Royalflush")) {
			assertEquals(game.isRoyalFlush(game.enemy_hand),true);
			
		}else if(hand.equalsIgnoreCase("StraightFlush")) {
			assertEquals(game.isStraightFlush((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("Straight")) {
			assertEquals(game.isStraight((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("Flush")) {
			assertEquals(game.isFlush((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("FourOfAKind")) {
			assertEquals(game.is4oK((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("FullHouse")) {
			assertEquals(game.isFHouse((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("ThreeOfAKind")) {
			assertEquals(game.is3oK((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("TwoPairs")) {
			assertEquals(game.is2Pair((game.enemy_hand)),true);
		}else if(hand.equalsIgnoreCase("Pair")) {
			assertEquals(game.isPair((game.enemy_hand)),true);
		}else {
			assertEquals(hand.equalsIgnoreCase("Single"),true);
		}
	}
	@When("^AIP analyze$")
	//AI player analyze his hand and change according to the result.
	//Because the cards in the deck is created on test and reset after test, Any tests that haven't create card and calls analyze means it haven't change any card(Or it will cause null pointer exception).
	public void Analyze() throws Exception {
		//Change cards based on the AI analyze, then reset the card index in game for next run.
		int[] re=game.Analyse();
		System.out.print("Analyse result");
		for(int i:re) {
			System.out.print(i+", ");
		}
		System.out.print("\n");
	    game.changeCard(true, re);
	    game.resetcardindex();
	}
	@When("([^\"]*) is in deck$")
	public void c_is_in_deck(String card) throws Exception {
		game.addCardtoDeck(game.cardcreator(card));
//		game.printdeck();
	}
}
