Feature: Test AIP beat Player with 4 of a kind

  Scenario: 1 AIP has 4-of-a-kind  beats Player full house
    Given Player have H5
    And Player have D5
    And Player have C5
    And Player have S9
    And Player have H9
    When AIP have HA
    And AIP have DA
    And AIP have CA
    And AIP have SA
    And AIP have H5
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds FullHouse

  Scenario: 2 AIP has 4-of-a-kind  beats Player flush
    Given Player have H5
    And Player have H8
    And Player have H3
    And Player have H7
    And Player have H9
    When AIP have D6
    And AIP have HK
    And AIP have SK
    And AIP have CK
    And AIP have DK
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds Flush

  Scenario: 3 AIP has 4-of-a-kind  beats Player straight
    Given Player have H4
    And Player have D5
    And Player have C6
    And Player have S7
    And Player have H8
    When AIP have CQ
    And AIP have SQ
    And AIP have HK
    And AIP have DQ
    And AIP have HQ
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds straight

  Scenario: 4 AIP has 4-of-a-kind  beats Player 3 of a kind
    Given Player have H4
    And Player have D4
    And Player have C4
    And Player have S7
    And Player have H8
    When AIP have CJ
    And AIP have D4
    And AIP have HJ
    And AIP have DJ
    And AIP have SJ
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds ThreeOfAKind

  Scenario: 5 AIP has 4-of-a-kind  beats Player two pairs
    Given Player have H4
    And Player have D4
    And Player have C7
    And Player have S7
    And Player have H8
    When AIP have S9
    And AIP have H9
    And AIP have D9
    And AIP have H10
    And AIP have C9
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds TwoPairs

  Scenario: 6 AIP has 4-of-a-kind  beats Player one pair
    Given Player have H4
    And Player have D4
    And Player have C7
    And Player have SQ
    And Player have H8
    When AIP have S9
    And AIP have H9
    And AIP have D9
    And AIP have H10
    And AIP have C9
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds Pair

  Scenario: 7 AIP has 4-of-a-kind  beats Player high card
    Given Player have H4
    And Player have DA
    And Player have C7
    And Player have SQ
    And Player have H8
    When AIP have S9
    And AIP have H9
    And AIP have D9
    And AIP have H10
    And AIP have C9
    And AIP analyze
    Then AIP should win
    And AIP holds FourOfAKind
    And Player holds Single
