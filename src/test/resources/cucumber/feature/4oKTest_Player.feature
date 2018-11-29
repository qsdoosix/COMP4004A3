Feature: Test player beat AIP with 4 of a kind

  Scenario: 1 HTB(player) has 4-of-a-kind  beats AIP full house
    Given AIP have H5
    And AIP have D5
    And AIP have C5
    And AIP have S9
    And AIP have H9
    When Player have HA
    And Player have DA
    And Player have CA
    And Player have SA
    And Player have H5
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds FullHouse

  Scenario: 2 HTB has 4-of-a-kind  beats AIP flush
    Given AIP have H5
    And AIP have H8
    And AIP have H3
    And AIP have H7
    And AIP have H9
    When Player have D6
    And Player have HK
    And Player have SK
    And Player have CK
    And Player have DK
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds Flush

  Scenario: 3 HTB has 4-of-a-kind  beats AIP straight
    Given AIP have H4
    And AIP have D5
    And AIP have C6
    And AIP have S7
    And AIP have H8
    When Player have CQ
    And Player have SQ
    And Player have HK
    And Player have DQ
    And Player have HQ
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds straight

  Scenario: 4 HTB has 4-of-a-kind  beats AIP 3 of a kind
    Given AIP have H4
    And AIP have D4
    And AIP have C4
    And AIP have S7
    And AIP have H8
    When Player have CJ
    And Player have D4
    And Player have HJ
    And Player have DJ
    And Player have SJ
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds ThreeOfAKind

  Scenario: 5 HTB has 4-of-a-kind  beats AIP two pairs
    Given AIP have H4
    And AIP have D4
    And AIP have C7
    And AIP have S7
    And AIP have H8
    When Player have S9
    And Player have H9
    And Player have D9
    And Player have H10
    And Player have C9
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds TwoPairs

  Scenario: 6 HTB has 4-of-a-kind  beats AIP one pair
    Given AIP have H4
    And AIP have D4
    And AIP have C7
    And AIP have SQ
    And AIP have H8
    When Player have S9
    And Player have H9
    And Player have D9
    And Player have H10
    And Player have C9
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds Pair

  Scenario: 7 HTB has 4-of-a-kind  beats AIP high card
    Given AIP have H4
    And AIP have DA
    And AIP have C7
    And AIP have SQ
    And AIP have H8
    When Player have S9
    And Player have H9
    And Player have D9
    And Player have H10
    And Player have C9
    Then Player should win
    And Player holds FourOfAKind
    And AIP holds Single
