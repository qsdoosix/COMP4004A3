Feature: Test the winning condition when both player have equal hands.

  Scenario: 1 AI Player have Club royal flush in order while player have Diamond royal flush in reversed order
    Given AIP have CA
    And AIP have CK
    And AIP have CQ
    And AIP have CJ
    And AIP have C10
    When Player have D10
    And Player have DJ
    And Player have DQ
    And Player have DK
    And Player have DA
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds RoyalFlush

  Scenario: 2 AI Player have Spade Royal flush while player have heart royal flush
    Given AIP have SK
    And AIP have SQ
    And AIP have SJ
    And AIP have S10
    And AIP have SA
    When Player have HA
    And Player have H10
    And Player have HJ
    And Player have HQ
    And Player have HK
    Then AIP should win
    And Player holds RoyalFlush
    And AIP holds RoyalFlush

  Scenario: 3 Player have Straight flush in lower color(Heart is smaller than spade) but larger number than AIP's
    Given AIP have S6
    And AIP have S5
    And AIP have S4
    And AIP have S3
    And AIP have S2
    When Player have H7
    And Player have H9
    And Player have HJ
    And Player have H8
    And Player have H10
    Then Player should win
    And Player holds StraightFlush
    And AIP holds StraightFlush

  Scenario: 4 Player have Straight flush in same number but smaller color than AIP's
    Given AIP have H7
    And AIP have H10
    And AIP have H8
    And AIP have HJ
    And AIP have H9
    When Player have D10
    And Player have D7
    And Player have D9
    And Player have D8
    And Player have DJ
    Then AIP should win
    And Player holds StraightFlush
    And AIP holds StraightFlush

  Scenario: 5 Player have 4 of a kind in smaller number than AIP
    Given AIP have H5
    And AIP have D5
    And AIP have C5
    And AIP have S5
    And AIP have H9
    When Player have H6
    And Player have D4
    And Player have C4
    And Player have S4
    And Player have H4
    Then AIP should win
    And Player holds FourOfAKind
    And AIP holds FourOfAKind

  Scenario: 6 AIP have FullHouse in smaller number than Player
    Given AIP have H5
    And AIP have D5
    And AIP have C5
    And AIP have S9
    And AIP have H9
    When Player have H6
    And Player have D6
    And Player have C6
    And Player have S4
    And Player have H4
    Then Player should win
    And Player holds FullHouse
    And AIP holds FullHouse

  Scenario: 7 Two straights with the same rank for their highest card,  THEN highest suit of that highest card win
    Given AIP have C6
    And AIP have D5
    And AIP have S4
    And AIP have H3
    And AIP have D2
    When Player have H2
    And Player have D3
    And Player have H4
    And Player have C5
    And Player have S6
    Then Player should win
    And Player holds Straight
    And AIP holds Straight

  Scenario: 8 Two straights with distinct highest card, THEN highest card wins
    Given AIP have C7
    And AIP have D5
    And AIP have S4
    And AIP have H3
    And AIP have D6
    When Player have H2
    And Player have D3
    And Player have H4
    And Player have C5
    And Player have S6
    Then AIP should win
    And Player holds Straight
    And AIP holds Straight

  Scenario: 9 two pairs with the same highest pair for each participant, THEN highest suit of this highest pair wins
    Given AIP have C7
    And AIP have D7
    And AIP have S4
    And AIP have H4
    And AIP have D5
    When Player have C6
    And Player have S4
    And Player have D4
    And Player have H7
    And Player have S7
    Then Player should win
    And Player holds TwoPairs
    And AIP holds TwoPairs

  Scenario: 10 two pairs, with distinct highest pairs for the 2 participants, THEN highest suit highest pair wins
    Given AIP have C6
    And AIP have D6
    And AIP have S5
    And AIP have H4
    And AIP have D4
    When Player have C5
    And Player have S4
    And Player have D5
    And Player have H3
    And Player have S3
    Then AIP should win
    And Player holds TwoPairs
    And AIP holds TwoPairs

  Scenario: 11 Both player have 3 of a kind and the bigger triplet wins
    Given AIP have H5
    And AIP have D5
    And AIP have C5
    And AIP have S3
    And AIP have H9
    When Player have HA
    And Player have DA
    And Player have CA
    And Player have S2
    And Player have H6
    Then Player should win
    And Player holds ThreeOfAKind
    And AIP holds ThreeOfAKind

  Scenario: 12 one pair, with both of these pairs of equal rank, THEN highest suit of these pairs wins
    Given AIP have CA
    And AIP have DA
    And AIP have CK
    And AIP have S10
    And AIP have H9
    When Player have D3
    And Player have C4
    And Player have HA
    And Player have SA
    And Player have H6
    Then Player should win
    And Player holds Pair
    And AIP holds Pair

  Scenario: 13 one pair, with distinct-ranked pairs for the 2 participants, THEN highest pair wins
    Given AIP have C7
    And AIP have DA
    And AIP have CK
    And AIP have SA
    And AIP have H9
    When Player have S5
    And Player have H4
    And Player have C8
    And Player have SQ
    And Player have HQ
    Then AIP should win
    And Player holds Pair
    And AIP holds Pair

  Scenario: 14 both player have single card in same number, the player with higher suit wins
    Given AIP have C7
    And AIP have D5
    And AIP have C2
    And AIP have S3
    And AIP have H9
    When Player have S9
    And Player have H4
    And Player have C8
    And Player have S2
    And Player have H6
    Then Player should win
    And Player holds Single
    And AIP holds Single

  Scenario: 15 both player have single card, the player with larger card wins
    Given AIP have C7
    And AIP have D5
    And AIP have CA
    And AIP have S3
    And AIP have H9
    When Player have S9
    And Player have H4
    And Player have C8
    And Player have S2
    And Player have H6
    Then AIP should win
    And Player holds Single
    And AIP holds Single
    
  Scenario: 16 flush, and the same rank for each of their 5 cards, THEN highest suit highest suit of highest card wins
    Given AIP have C8
    And AIP have C5
    And AIP have C4
    And AIP have C9
    And AIP have CJ
    When Player have SJ
    And Player have S9
    And Player have S4
    And Player have S5
    And Player have S8
    Then Player should win
    And Player holds Flush
    And AIP holds Flush
  