Feature: Test Player beat AIP with Straight

  Scenario:1 HTB has straight beats AIP 3 of a kind
    Given AIP have H9
    And AIP have S6
    And AIP have C10
    And AIP have D10
    And AIP have H10
    When Player have C8
    And Player have S9
    And Player have D10
    And Player have HJ
    And Player have CQ
    Then Player should win
    And Player holds Straight
    And AIP holds ThreeOfAKind

  Scenario:2 HTB has straight beats AIP two pairs
    Given AIP have H9
    And AIP have S6
    And AIP have C9
    And AIP have D10
    And AIP have H10
    When Player have D7
    And Player have S6
    And Player have H5
    And Player have S4
    And Player have H3
    Then Player should win
    And Player holds Straight
    And AIP holds TwoPairs

  Scenario:3 HTB has straight beats AIP one pair
    Given AIP have H9
    And AIP have S6
    And AIP have C9
    And AIP have D10
    And AIP have H10
    When Player have S5
    And Player have H7
    And Player have C9
    And Player have S8
    And Player have H6
    Then Player should win
    And Player holds Straight
    And AIP holds Pair

  Scenario:4 HTB has straight beats AIP high card
    Given AIP have H9
    And AIP have S6
    And AIP have C9
    And AIP have D10
    And AIP have H10
    When Player have HJ
    And Player have C10
    And Player have S8
    And Player have C9
    And Player have DQ
    Then Player should win
    And Player holds Straight
    And AIP holds Pair
