Feature: Test AI decisions about changing card.

  Scenario: 1 AIP is 1 card away from a royal flush and exchanges that card  THEN WINS with royal flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have HJ
    And AIP have HQ
    And AIP have HK
    And AIP have S3
    And HA is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds Straight

  Scenario: 2 AIP is 1 card away from a royal flush and exchanges that card  THEN Lose because failed to get Royal flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have HJ
    And AIP have HQ
    And AIP have HK
    And AIP have S3
    And D4 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Single
    And Player holds Straight

  Scenario: 3 AIP is 1 card away from a straight flush and exchanges that card, THEN WINS with straight flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have HJ
    And AIP have HQ
    And AIP have H9
    And AIP have S3
    And H8 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds Straight

  Scenario: 4 AIP is 1 card away from a straight flush and exchanges that card, THEN LOSES without getting straight flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have HJ
    And AIP have HQ
    And AIP have H9
    And AIP have S3
    And S5 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Single
    And Player holds Straight

  Scenario: 5 AIP has 3-of-a-kind, exchanges lowest rank card and WINS with full house
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have C10
    And AIP have S10
    And AIP have D9
    And AIP have S3
    And S9 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds Straight

  Scenario: 6 AIP has 3-of-a-kind, exchanges  lowest rank card and LOSES with 3-of-a-kind
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have D10
    And AIP have C10
    And AIP have H9
    And AIP have S3
    And S5 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds ThreeOfAKind
    And Player holds Straight

  Scenario: 7 AIP has two pairs, exchanges other card and WINS with full house
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have D10
    And AIP have C9
    And AIP have H9
    And AIP have S3
    And S10 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds Straight

  Scenario: 8 AIP has two pairs, exchanges other card and LOSES with two pairs
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have D10
    And AIP have C9
    And AIP have H9
    And AIP have S3
    And S8 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds TwoPairs
    And Player holds Straight

  Scenario: 9 AIP is 1 card away from a flush and exchanges that card THEN WINS with flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have H3
    And AIP have H9
    And AIP have H5
    And AIP have D3
    And H8 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds Straight

  Scenario: 10 AIP is 1 card away from a flush and exchanges that card THEN LOSES without flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H10
    And AIP have H3
    And AIP have H9
    And AIP have H5
    And AIP have D3
    And D8 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Single
    And Player holds Straight

  Scenario: 11 AIP is 1 card away from a straight and exchanges that card THEN WINS with straight
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S10
    And AIP have C8
    And AIP have HJ
    And AIP have D3
    And D7 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds Straight
    And Player holds Straight

  Scenario: 12 AIP is 1 card away from a straight and exchanges that card THEN LOSES without straight
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S10
    And AIP have C8
    And AIP have HJ
    And AIP have D3
    And D8 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Pair
    And Player holds Straight

  Scenario: 13 AIP has 3 cards of the same suit & exchanges other two, THEN Win with flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have SK
    And AIP have C8
    And AIP have DJ
    And AIP have D3
    And D8 is in deck
    And D10 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds Straight

  Scenario: 14 AIP has 3 cards of the same suit & exchanges other two, THEN Lose with out flush
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have SK
    And AIP have C8
    And AIP have DJ
    And AIP have D3
    And S9 is in deck
    And H10 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Pair
    And Player holds Straight

  Scenario: 15 AIP has 3 cards in sequence & exchanges other two, THEN Win with straight
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S10
    And AIP have C8
    And AIP have S5
    And AIP have D3
    And SJ is in deck
    And D7 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds Straight
    And Player holds Straight

  Scenario: 16 AIP has 3 cards in sequence & exchanges other two, THEN Lose with two pairs
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S10
    And AIP have C8
    And AIP have S5
    And AIP have D3
    And S8 is in deck
    And D10 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds TwoPairs
    And Player holds Straight

  Scenario: 17 AIP has one pair and exchanges 3 others, THEN Win with 4 of a Kind
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S9
    And AIP have H8
    And AIP have D3
    And AIP have C2
    And C9 is in deck
    And H9 is in deck
    And S3 is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds Straight

  Scenario: 18 AIP has one pair and exchanges 3 others, THEN Lose with 3 of a Kind
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S9
    And AIP have H8
    And AIP have D3
    And AIP have C2
    And C9 is in deck
    And H10 is in deck
    And S3 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds ThreeOfAKind
    And Player holds Straight

  Scenario: 19 AIP has one pair and exchanges 3 others, THEN Lose with one pair
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have S9
    And AIP have H8
    And AIP have D3
    And AIP have C2
    And C8 is in deck
    And H10 is in deck
    And S3 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Pair
    And Player holds Straight

  Scenario: 20 AIP does not even have a pair, keeps highest 2, exchanges 3 others, THEN Win by 4 of a kind
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have SK
    And AIP have H8
    And AIP have D3
    And AIP have C2
    And CK is in deck
    And HK is in deck
    And DK is in deck
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds Straight

  Scenario: 21 AIP does not even have a pair, keeps highest 2, exchanges 3 others, THEN Lose by two pairs
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have SK
    And AIP have H8
    And AIP have D3
    And AIP have C2
    And CK is in deck
    And H9 is in deck
    And D6 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds TwoPairs
    And Player holds Straight

  Scenario: 22 AIP does not even have a pair, keeps highest 2, exchanges 3 others, THEN Lose by single card
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have D9
    And AIP have SK
    And AIP have H8
    And AIP have D3
    And AIP have C2
    And CQ is in deck
    And H4 is in deck
    And D6 is in deck
    And AIP analyze
    Then Player should win
    And AIP holds Single
    And Player holds Straight
