Feature: Test player beat AIP with Flush hand

  Scenario:1 HTB has flush beats AIP straight
    Given AIP have H3
    And AIP have C4
    And AIP have C5
    And AIP have S6
    And AIP have H7
    When Player have H3
    And Player have H5
    And Player have H7
    And Player have H10
    And Player have HJ
    Then Player should win
    And Player holds Flush
    And AIP holds Straight

  Scenario:2 HTB has flush beats AIP 3 of a kind
    Given AIP have H3
    And AIP have C3
    And AIP have C5
    And AIP have S3
    And AIP have H7
    When Player have CQ
    And Player have CJ
    And Player have C6
    And Player have C4
    And Player have C2
    Then Player should win
    And Player holds Flush
    And AIP holds ThreeOfAKind

  Scenario:3 HTB has flush beats AIP two pairs
    Given AIP have H3
    And AIP have C3
    And AIP have C5
    And AIP have S5
    And AIP have H7
    When Player have S3
    And Player have S6
    And Player have S2
    And Player have S9
    And Player have S7
    Then Player should win
    And Player holds Flush
    And AIP holds TwoPairs

  Scenario:4 HTB has flush beats AIP one pair
    Given AIP have H3
    And AIP have C3
    And AIP have C8
    And AIP have S5
    And AIP have H7
    When Player have D3
    And Player have D8
    And Player have DJ
    And Player have D9
    And Player have D7
    Then Player should win
    And Player holds Flush
    And AIP holds Pair

  Scenario:5 HTB has flush beats AIP high card
    Given AIP have H3
    And AIP have CA
    And AIP have C8
    And AIP have S5
    And AIP have H7
    When Player have D8
    And Player have D5
    And Player have D3
    And Player have D7
    And Player have D10
    Then Player should win
    And Player holds Flush
    And AIP holds Single
