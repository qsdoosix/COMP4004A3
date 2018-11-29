package common;
import java.io.*;

public class Poker {
	//Because the player won't change more than 4 cards at a time, so 18 cards should be enough in the worse case. 
	Card[] card_buffer=new Card[52];
	//The hand for both player
	public Card[] player_hand= new Card[5];
	public Card[] enemy_hand = new Card[5];
	int numcardplayer=0;
	int numcardenemy=0;
	int card_index=0;
	int num_card=0;
	BufferedReader br;
	public int winner = -1;//0 is player and 1 is AIP
	
	int[] cardnumbercount = new int[13];
	int[] cardcolorcount = new int[4];
	
	public Poker(String in) throws FileNotFoundException{
		File file = new File(in);
		br= new BufferedReader(new FileReader(file));
	}
	public Poker(){
		//The empty constructor for testing purpose
	}
	
	//Interpret the input line to cards and store into the card_buffer
	public void readCard(String line) {
		//Split the input by comma
		String[] input = line.split(" ");
		for(int i =0; i < input.length;i++) {
			int n;
			if(input[i].charAt(1)=='A') {
				n=1;
			}else if(input[i].charAt(1)=='0') {//Use 0 to represent 10 to keep it simple
				n=10;
			}else if(input[i].charAt(1)=='J') {
				n=11;
			}else if(input[i].charAt(1)=='Q') {
				n=12;
			}else if(input[i].charAt(1)=='K') {
				n=13;
			}else {
				//In this code '1' and 'A' is both considered as Ace, as it won't cause any confusion.
				n=Character.getNumericValue(input[i].charAt(1));
			}
			card_buffer[i]=new Card(input[i].charAt(0),n);
			num_card++;
		}
	}
	
	public void initializegame() throws IOException {
		nextRound();
	}
	
	public void nextRound() {
		card_index=0;
		num_card=0;
		try {
			readCard(br.readLine());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("\n\nStarting new round");
		//Give player 5 cards for AI to beat.
		for(int i = 0; i < 5;i++) {
			player_hand[i]=drawCard();
			}
		player_hand=sortArray(player_hand);
		//Give AI 5 cards
		for(int i = 0; i < 5;i++) {
			enemy_hand[i]=drawCard();
			}
		enemy_hand=sortArray(enemy_hand);
		System.out.println("Displaying both player's hand after drawing the card");
		displayHand(false);
		displayHand(true);
	}
	
	public Card drawCard() {
		card_index++;
		return card_buffer[card_index-1];
	}
	
	public Card[] sortArray(Card[] in) {
		//A helper method to sort the hands using bubble sort
		for(int i = 0; i<in.length-1; i++) {
			int r= in[i].compareTo(in[i+1]);
			if(r>0) {
				Card t = in[i];
				in[i]=in[i+1];
				in[i+1]=t;
				i=-1;
			}
		}
		return in;
	}
	public int[] sortArray(int[] in) {
		//A helper method to sort the hands using bubble sort
		for(int i = 0; i<in.length-1; i++) {
			if(in[i]<in[i+1]) {
				int t = in[i];
				in[i]=in[i+1];
				in[i+1]=t;
				i=-1;
			}
		}
		return in;
	}
	
	public void countCard(Card[] in) {
		for(int i = 0;i<cardcolorcount.length;i++) {
			cardcolorcount[i]=0;
		}
		for(int i = 0;i<cardnumbercount.length;i++) {
			cardnumbercount[i]=0;
		}
		String list = "SHDC";
		for(int i = 0; i < in.length;i++) {
			cardcolorcount[list.indexOf(in[i].color)]++;
			cardnumbercount[in[i].number-1]++;
		}
	}
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Poker game = new Poker("src/main/resources/Cards1.txt");
	}

	public void ChangeCard(int[] in) {
		if(in[0]<1) {
			return;
		}
		for(int i = 0; i < in[0];i++) {
			enemy_hand[i]=drawCard();
		}
	}
	
	public int[] Analyse() {
		Card[] hand=enemy_hand;
		int[] nothing = {0,0,0,0};
		int[] re;
		if(isRoyalFlush(hand)) {
			//Do nothing
			return nothing;
		}else if(isStraightFlush(hand)) {
			//Do nothing
			return nothing;
		}else if(is4oK(hand)) {
			//Do nothing
			return nothing;
		}else if(isFHouse(hand)) {
			//Do nothing
			return nothing;
		}else if(isFlush(hand)) {
			//Do nothing
			return nothing;
		}else if(isStraight(hand)) {
			//Do nothing
			return nothing;
		}else{
			re=oneFromRFlush(hand);
			if(re[1]!=-1){
				//So the hand is one card from Royal Flush
				System.out.println("One from RF");
				return re;
			}
			re=onefromFS(hand);
			if(re[1]!=-1){
				System.out.println("One from FS");
				return re;
			}
			re=onefromFHouse(hand);
			if(re[1]!=-1){
				System.out.println("One from FH");
				return re;
			}
			re=onefromflush(hand);
			if(re[1]!=-1){
				System.out.println("One from F");
				return re;
			}
			re=onefromstraight(hand);
			if(re[1]!=-1){
				System.out.println("One from S");
				return re;
			}
			re=change3oS(hand);
			if(re[1]!=-1){
				System.out.println("3os");
				return re;
			}
			re=ThreeInSequence(hand);
			if(re[1]!=-1){
				System.out.println("S");
				return re;
			}
			re=changePair(hand);
			if(re[1]!=-1) {
				System.out.println("Pair");
				return re;
			}
			sortArray(hand);
			int[] small3={3,0,1,2};
			return small3;
		}
	}
	public boolean isRoyalFlush(Card[] in) {
		// TODO Auto-generated method stub
		sortArray(in);
		countCard(in);
		sortArray(cardcolorcount);
		sortArray(cardnumbercount);
		if(cardcolorcount[0]<5) {
			//The 5 cards are not in same color, so it can't be a royal flush;
			return false;
		}		
		//Because input is sorted at the beginning, so it must be 1(A) 10,J,Q,K
		return  in[0].number==1&&
				in[1].number==10&&
				in[2].number==11&&
				in[3].number==12&&
				in[4].number==13;
	}
	public boolean isStraightFlush(Card[] in) {
		return isFlush(in)&&isStraight(in);
	}
	public boolean isStraight(Card[] in) {
		// TODO Auto-generated method stub
		in=sortArray(in);
		//The special case about card 'Ace'
		if( in[0].number==1&&
			in[1].number==10&&
			in[2].number==11&&
			in[3].number==12&&
			in[4].number==13) {
			return true;
		}
		if(in[0].number!=in[1].number&&in[1].number!=in[2].number&&in[2].number!=in[3].number&&in[3].number!=in[4].number) {
			//If 5 sorted card are different and the maximum card minus minimum card is 4, then it must be 5 cards in sequence.
			//Then the smallest card must not be 'A' (because A 2 3 4 5 is not a straight as far as i know)
			return (in[4].number-in[0].number==4&&in[0].number!=1);
		}
		return false;
	}
	public boolean isFlush(Card[] in) {
		// TODO Auto-generated method stub
		countCard(in);
		cardcolorcount=sortArray(cardcolorcount);
		return(cardcolorcount[0]==5);
	}
	public boolean is4oK(Card[] in) {
		countCard(in);
		sortArray(cardnumbercount);
		//If there are 4 cards with same number, then it must be 4 of a kind.
		return cardnumbercount[0]==4;
	}
	public boolean isFHouse(Card[] in) {
		countCard(in);
		sortArray(cardnumbercount);
		return(cardnumbercount[0]==3&&cardnumbercount[1]==2);
	}
	public boolean is3oK(Card[] in) {
		// TODO Auto-generated method stub
		countCard(in);
		sortArray(cardnumbercount);
		//If there are 3 cards with same number and the other two are not same, then it is 3 of a kind
		return cardnumbercount[0]==3&&cardnumbercount[1]<2;
	}

	public boolean is2Pair(Card[] in) {
		// TODO Auto-generated method stub
		countCard(in);
		sortArray(cardnumbercount);
		//If there are exactly 2 of 2 cards then it is two pairs
		return cardnumbercount[0]==2&&cardnumbercount[1]==2;
	}

	public boolean isPair(Card[] in) {
		// TODO Auto-generated method stub
		countCard(in);
		sortArray(cardnumbercount);
		//If there are exactly 2 of 2 cards then it is two pairs
		return cardnumbercount[0]==2&&cardnumbercount[1]<2;
	}

	public int[] onefromflush(Card[] in) {
		// TODO Auto-generated method stub
		int colorindex = -1;
		int[] re = {1,-1};
		char[] colorlist= {'S','H','D','C'};
		countCard(in);
		for(int i=0;i<cardcolorcount.length;i++) {
			if(cardcolorcount[i]==4) {//This is the color have 4 cards in hand
				colorindex=i;
				break;
			}
		}
		if(colorindex<0) {
			return re;
		}
		for(int i = 0; i < in.length;i++) {
			if(in[i].color!=colorlist[colorindex]) {
				re[1]=i;
				return re;
			}
		}
		return re;
	}
	public int[] onefromstraight(Card[] in) {
		int[] err = {-1,-1};
		int[] re = {1,-1};
		int FC = -1;
		
		//A free card to represent the "missing" card can be any card in sequence.
		boolean freeCard = true;
		for(int i = 0; i < in.length-1;i++) {
			if(in[i+1].number==in[i].number) {
				//Two cards with same number, mark the first one as free card.
				FC=i;
			}else if(in[i+1].number-in[i].number==2) {
				//Two cards with a gap between them, try to find a free card to fix it.
				if(!freeCard) {
					return err;
				}
				if(i==3) {
					//If it is already the last card, then it will be changed
					FC=4;
				}
				freeCard=false;
			}else if(in[i+1].number-in[i].number>2) {
				//Two cards with a large gap between them (can't be fixed with one free card)
				//So it must be either the first card or the last card
				if(i==0) {
					//The First card will be changed
					FC=0;
				}else if(i==3) {
					//The last card will be changed
					FC=4;
				}else {
					return err;
				}
			}
		}
		re[1]=FC;
		return re;
	}

	public int[] onefromFS(Card[] in) {
		// TODO Auto-generated method stub
		//Re-use the code one from flush and one from straight
		int[] err={1,-1};
		if(isStraightFlush(in)) {
			return err;
		}
		int[] r1=onefromflush(in);
		int[] r2=onefromstraight(in);
		if(r1==r2) {
			//If changing a card can make it became flush and straight at same time, then it must be one card from straight flush.
			return r1;
		}else {
			//A special case that there may be two cards with same number but only one of them can be used for flush
			if(r1[1]>-1&&r2[1]>-1) {
				if(in[r1[1]].number==in[r2[1]].number) {
					return r1;
				}
			}
		}
		return r1;
	}
/*	public int[] oneFrom4oK(Card[] in) {
		// TODO Auto-generated method stub
		int[] wrong = {-1,-1};
		int ones=0;
		int three=0;
		int[] re= new int[2];
		countCard(in);
		for(int i = 0; i < cardnumbercount.length;i++) {
			if(cardnumbercount[i]==1) {
				if(ones==re.length) {
					//If there is more than 2 cards exist only once,then it is not one from 4 of a kind
					return wrong;
				}
				for(int a = 0; a < in.length;a++) {
					//Search for the card with same number as its index in counter (Because the index in counter is the number of card)
					if(i==in[a].number) {
						re[ones]=a+1;
					}
				}
				ones++;
			}else if(cardnumbercount[i]==3) {
				three++;
			}
		}
		if(ones==2&&three==1) {
			return re;
		}else {
			return wrong;
		}
	}
*/
	public int[] onefromFHouse(Card[] in) {
		// TODO Auto-generated method stub
		//To make it one cards away from full house, it must have 2 pairs of cards and one single cards.
		//Because the 3 cards with same number should be interpreted as one card away from 4 of a kind.
		int pair=0;
		countCard(in);
		int[] re={1,-1};
		int[] err= {-1,-1};
		for(int i = 0; i < cardnumbercount.length;i++) {
			if(cardnumbercount[i]==3) {
				pair=2;
				for(int a = 1; a < cardnumbercount.length;a++) {
					if(cardnumbercount[a]==1) {
						for(int b = 0; b < in.length;b++) {
							//Search for the card with same number as its index in counter (Because the index in counter is the number of card)
							if(a==in[b].number-1) {
								re[1]=b;
								return re;
							}
						}
					}
				}
			}else if(cardnumbercount[i]==2) {
				pair++;
			}else if(cardnumbercount[i]==1) {
				for(int a = 0; a < in.length;a++) {
					//Search for the card with same number as its index in counter (Because the index in counter is the number of card)
					if(i==in[a].number-1) {
						re[1]=a;
					}
				}
			}
		}
		if(pair==2) {
			return re;
		}else {
			return err;
		}
	}
	public int[] oneFromRFlush(Card[] in) {
		// TODO Auto-generated method stub
		countCard(in);
		int cardinRF=0;
		int[] re= {-1,-1};
		int[] err= {-1,-1};
		char maincolor='N';
		String list= "SHDC";
		for(int i = 0; i<cardcolorcount.length;i++) {
			if(cardcolorcount[i]>=4) {
				//If there is a color have 4 or more cards, then it is the color for the possible royal flush
				maincolor=list.charAt(i);
			}
		}
		if(maincolor=='N') {
			//There isn't a color have 4 or more cards. So it must be away from flush, so it must not be a royal flush
			return err;
		}
		
		for(int i=0;i<5;i++) {
			if(in[i].color!=maincolor||in[i].number>1&&in[i].number<10) {
				re[0]=1;
				re[1]=i;
				return re;
			}
		}
		//There are less than 4 cards in the royal flush sequence, so it can't be a royal flush
		return err;
	}
	public int[] change3oS(Card[] in) {
		// TODO Auto-generated method stub
		countCard(in);
		char maincolor='N';
		int[] wrong = {-1,-1,-1};
		int[] re= {2,-1,-1};
		int reindex=0;
		String list= "SHDC";
		for(int i = 0; i<cardcolorcount.length;i++) {
			if(cardcolorcount[i]==3) {
				//Look for the color with exactly 3 cards
				maincolor=list.charAt(i);
			}
		}
		if(maincolor=='N') {
			//There isn't a color have 3 cards. So it's not what we are looking for
			return wrong;
		}
		for(int i = 0;i<in.length;i++) {
			if(in[i].color!=maincolor) {
				//This card is not one of the 3 cards at same color
				if(reindex==re.length-1) {
					//Not supposed to work, but it prevents the error input
					return wrong;
				}
				//Save the index to the return value
				re[reindex+1]=i;
				reindex++;
			}
		}
		return re;
	}
	public int[] ThreeInSequence(Card[] in) {
		// TODO Auto-generated method stub
		//This one i don't want to take the case that the 3 cards are not adjacent.
		//(e.g) 3,5,6
		//Because this is very unlikely to get a better hand in this case.
		int[] wrong = {-1,-1,-1};
		int[] re= {2,-1,-1};
		countCard(in);
		int cardindex=0;
		for(int i = cardnumbercount.length-1;i>2;i--) {
			if(cardnumbercount[i]>0&&cardnumbercount[i-1]>0&&cardnumbercount[i-2]>0) {
				//The largest 3 cards in a sequence
				if(i>2&&cardnumbercount[i-3]>0) {
					//There are 4 or more cards in sequence
					return wrong;
				}
				for(int a=0;a<in.length;a++) {
					if(in[a].number<i-2) {
						//If the card in input is smaller than the minimum card in sequence, then it should be changed.
						if(cardindex>2) return wrong;//If there is more than 2 cards need to be changed, return false
						re[cardindex+1]=a;
						cardindex++;
					}else if(in[a].number>i+1) {
						//if the card at index a is bigger than the maximum card in sequence, then it should be changed
						if(cardindex>2) return wrong;
						re[cardindex+1]=a;
						cardindex++;
					}else if(cardnumbercount[in[a].number-1]>1) {
						//If there is more card at same number as card at index a, then it should be changed
						if(cardindex>2) return wrong;
						re[cardindex+1]=a;
						cardindex++;
						a++;//Skip the next card (which is expected to be same as this one)
					}
				}
			}
		}
		
		return re;
	}
	public void displayHand(boolean isEnemy) {
		if(isEnemy) {
			enemy_hand=sortArray(enemy_hand);
			System.out.println();
			System.out.println("Printing AIP's hand");
			for(Card c:enemy_hand) {
				System.out.print(c+", ");
			}
		}else{
			player_hand=sortArray(player_hand);
			System.out.println("Printing player's hand");
			for(Card c:player_hand) {
				System.out.print(c+", ");
			}
		}
		System.out.println();
	}
	public void changeCard(boolean isEnemy, int[] in) {
		// TODO Auto-generated method stub
		int cardstoChange=in[0];
		if(isEnemy) {
			System.out.println("\nAIP is exchanging hands.\n"+cardstoChange+" cards to be dropped:");
			for(int i = 1;i<in[0]+1;i++) {
				System.out.print("  "+enemy_hand[in[i]]);
				enemy_hand[in[i]]=drawCard();
				System.out.println(" replaced by "+enemy_hand[in[i]]);
			}
			enemy_hand=sortArray(enemy_hand);
		}else{
			System.out.println("\nPlayer is exchanging hands.\n"+cardstoChange+" cards to be dropped:");
			for(int i = 1;i<in[0];i++) {
				System.out.println("  "+player_hand[in[i]]);
				player_hand[in[i]]=drawCard();
				System.out.println(" replaced by "+player_hand[in[i]]);
			}
			player_hand=sortArray(player_hand);
		}
		System.out.println("\nThe hand after exchanging cards");
		displayHand(isEnemy);
	}
	public int[] findSingle(Card[] in) {
		//This method is to find the single (not in pair) cards in the input
		//The input must be sorted.
		int[] re = {-1,-1,-1,-1};
		if(is2Pair(in)) {
			countCard(in);
			re[0]=1;//One card need to be changed
			for(int i = 0;i<cardnumbercount.length;i++) {
				if(cardnumbercount[i]==1){//i is the number of single card in hand
					for(int a=0;a<in.length;a++) {
						if(in[a].number==i+1) {
							re[1]=a;
							return re;
						}
					}
				}
			}
		}else if(isPair(in)) {
			countCard(in);
			re[0]=3;//Three cards need to be changed
			int index = 1;
			for(int i = 0;i<in.length-1;i++) {
				if(in[i].number==in[i+1].number) {
					i++;//Skip the paired card
				}else {
					re[index]=i;
					index++;
				}
			}
			//The in[4] is not counted in for loop
			if(in[3].number!=in[4].number) {
				re[index]=4;
			}
			return re;
		}else {
			//Change 3 smallest card
			//Because the input should be sorted, so just return the first 3 cards.
			re[0]=3;
			re[1]=0;
			re[2]=1;
			re[3]=2;
			return re;
		}
		//This return is not supposed to be used
		return null;
	}
	public int[] changePair(Card[] in) {
		countCard(in);
		int pairNumber=-1;
		int[] wrong = {-1,-1,-1,-1};
		int[] re= {3,-1,-1,-1};
		int reindex=0;
		for(int i = 0; i<cardnumbercount.length;i++) {
			if(cardnumbercount[i]==2) {
				pairNumber=i+1;
			}
		}
		if(pairNumber==-1) {
			//There isn't a color have 3 cards. So it's not what we are looking for
			return wrong;
		}
		for(int i = 0;i<in.length;i++) {
			if(in[i].number!=pairNumber) {
				//This card is not one of the 3 cards at same color
				if(reindex==re.length-1) {
					//Not supposed to work, but it prevents the error input
					return wrong;
				}
				//Save the index to the return value
				re[reindex+1]=i;
				reindex++;
			}
		}
		return re;
	}
	public Card maxCard(Card[]in) {
		//Returns the max number among input cards
		int max=0;
		for(int i =0;i<in.length;i++) {
			if(in[i].number==1) {
				return in[i];//Ace is considered as 14 and it is the biggest single card
			}else if(in[i].number>in[max].number){
				max=i;
			}
		}
		return in[max];
	}
	public Card mostCard(Card[] in) {
		countCard(in);
		int most=12;
		//Go from large to small
		for(int i = cardnumbercount.length-1;i>-1;i--) {
			if(cardnumbercount[i]>cardnumbercount[most]) {
				most=i;
			}
		}
		for(int i = in.length-1; i>0;i--) {
			if(in[i].number==most+1) {
				return in[i];
			}
		}
		//Not supposed to get there
		return null;
	}
	public void compareHand() {
		int playerS = 0;
		int enemyS = 0;
		String list = "SHDC";

		//To analyze the hand of enemy
		//it can be changed to analyze the hand of player easily
		Card[] hand = player_hand;
		Card temp=maxCard(hand);
		Card max=new Card(temp.color,temp.number);
		temp=mostCard(hand);
		Card most = new Card(temp.color,temp.number);
		if(max.number==1) {
			max.number=14;//If the max card is Ace, count it as 14 not 1
		}
		if(most.number==1) {
			most.number=14;
		}
		if(isRoyalFlush(hand)) {
			//max.number is less or equal to 14
			//indexOf(max.color)is less or equal to 4
			playerS=10000+max.number*10-list.indexOf(max.color);
		}else if(isStraightFlush(hand)) {
			playerS=9000+max.number*10-list.indexOf(max.color);
		}else if(is4oK(hand)) {
			//Most card means the card with 4 of a kind
			playerS=8000+most.number*10-list.indexOf(most.color);
		}else if(isFHouse(hand)) {
			playerS=7000+most.number*10-list.indexOf(most.color);
		}else if(isFlush(hand)) {
			playerS=6000+max.number*10-list.indexOf(max.color);
		}else if(isStraight(hand)) {
			playerS=5000+max.number*10-list.indexOf(max.color);
		}else if(is3oK(hand)) {
			playerS=4000+most.number*10-list.indexOf(most.color);
		}else if(is2Pair(hand)) {
			playerS=3000+most.number*10-list.indexOf(most.color);
		}else if(isPair(hand)) {
			playerS=2000+most.number*10-list.indexOf(most.color);
		}else {
			playerS=max.number*10-list.indexOf(max.color);
		}

		hand=enemy_hand;
		temp=maxCard(hand);
		max=new Card(temp.color,temp.number);
		temp=mostCard(hand);
		most = new Card(temp.color,temp.number);
		if(max.number==1) {
			max.number=14;//If the max card is Ace, count it as 14 not 1
		}
		if(most.number==1) {
			most.number=14;
		}
		if(isRoyalFlush(hand)) {
			//max.number is less or equal to 14
			//indexOf(max.color)is less or equal to 4
			enemyS=10000+max.number*10-list.indexOf(max.color);
		}else if(isStraightFlush(hand)) {
			enemyS=9000+max.number*10-list.indexOf(max.color);
		}else if(is4oK(hand)) {
			//Most card means the card with 4 of a kind
			enemyS=8000+most.number*10-list.indexOf(most.color);
		}else if(isFHouse(hand)) {
			enemyS=7000+most.number*10-list.indexOf(most.color);
		}else if(isFlush(hand)) {
			enemyS=6000+max.number*10-list.indexOf(max.color);
		}else if(isStraight(hand)) {
			enemyS=5000+max.number*10-list.indexOf(max.color);
		}else if(is3oK(hand)) {
			enemyS=4000+most.number*10-list.indexOf(most.color);
		}else if(is2Pair(hand)) {
			enemyS=3000+most.number*10-list.indexOf(most.color);
		}else if(isPair(hand)) {
			enemyS=2000+most.number*10-list.indexOf(most.color);
		}else {
			enemyS=max.number*10-list.indexOf(max.color);
		}
		if(playerS>enemyS) {
			winner=0;
			System.out.println("Player wins!");
		}else {
			winner=1;
			System.out.println("AI Player wins!");
		}
	}
	public void clearhand() {
		int numcardplayer=0;
		int numcardenemy=0;
	}
	public void givecardP(Card c) {
		if(numcardplayer>=5)clearhand();
		player_hand[numcardplayer]=c;
		numcardplayer++;
	}
	public void givecardAIP(Card c) {
		if(numcardenemy>=5)clearhand();
		enemy_hand[numcardenemy]=c;
		numcardenemy++;
	}
	public Card cardcreator(String s) {
		char c = s.charAt(0);
		int n;
		if(s.charAt(1)=='A') {
			n=1;
		}else if(s.charAt(1)=='1'&&s.length()==3) {
			n=10+Character.getNumericValue(s.charAt(2));//Interpret 10,11,12,13 as 10,J,Q,K
		}else if(s.charAt(1)=='J') {
			n=11;
		}else if(s.charAt(1)=='Q') {
			n=12;
		}else if(s.charAt(1)=='K') {
			n=13;
		}else {
			//In this code '1' and 'A' is both considered as Ace, as it won't cause any confusion.
			n=Character.getNumericValue(s.charAt(1));
		}
		return new Card(c,n);
	}
	public void addCardtoDeck(Card c) {
		card_buffer[num_card]=c;
		num_card++;
	}
	public void printdeck() {
		System.out.println("Cards in deck:");
		for(Card c:card_buffer) {
			System.out.print(c+", ");
		}
	}
	public void resetcardindex() {
		card_index=0;
		num_card=0;
		for(int i = 0; i<card_buffer.length;i++) {
			card_buffer[i]=null;
		}
	}
}
