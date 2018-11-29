Feature: Player beats AIP with 3 of a kind

  Scenario: 1 HTB has 3 of a kind beats AIP two pairs
    Given AIP have H3
    And AIP have D5
    And AIP have C5
    And AIP have S9
    And AIP have H9
    When Player have HA
    And Player have DA
    And Player have CA
    And Player have S2
    And Player have H5
    Then Player should win
    And Player holds ThreeOfAKind
    And AIP holds TwoPairs

  Scenario: 2 HTB has 3 of a kind beats AIP one pair
    Given AIP have H3
    And AIP have D5
    And AIP have C2
    And AIP have S9
    And AIP have H9
    When Player have H2
    And Player have DK
    And Player have CK
    And Player have SK
    And Player have H5
    Then Player should win
    And Player holds ThreeOfAKind
    And AIP holds Pair

  Scenario: 3 HTB has 3 of a kind beats AIP high card
    Given AIP have H5
    And AIP have D6
    And AIP have C8
    And AIP have S2
    And AIP have H9
    When Player have H3
    And Player have DQ
    And Player have C4
    And Player have SQ
    And Player have HQ
    Then Player should win
    And Player holds ThreeOfAKind
    And AIP holds Single

  Scenario: 4 Different permutations
    Given AIP have H5
    And AIP have D6
    And AIP have C8
    And AIP have S2
    And AIP have H9
    When Player have HJ
    And Player have DJ
    And Player have C3
    And Player have SJ
    And Player have H7
    Then Player should win
    And Player holds ThreeOfAKind
    And AIP holds Single
    
    Scenario: 5 Different permutations
    Given AIP have H5
    And AIP have D6
    And AIP have C8
    And AIP have S2
    And AIP have H9
    When Player have H9
    And Player have D2
    And Player have C3
    And Player have S9
    And Player have D9
    Then Player should win
    And Player holds ThreeOfAKind
    And AIP holds Single