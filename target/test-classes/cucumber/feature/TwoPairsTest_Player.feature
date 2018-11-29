Feature: Test Player beats AIP with Two pair

  Scenario:1 HTB has two pairs beats AIP one pair
    Given AIP have C6
    And AIP have D2
    And AIP have S5
    And AIP have H4
    And AIP have D4
    When Player have C5
    And Player have S5
    And Player have D3
    And Player have H9
    And Player have S3
    Then Player should win
    And Player holds TwoPairs
    And AIP holds Pair

  Scenario:2 HTB has two pairs beats AIP high card
    Given AIP have C6
    And AIP have D9
    And AIP have S5
    And AIP have H10
    And AIP have D4
    When Player have C5
    And Player have S5
    And Player have D4
    And Player have H3
    And Player have S3
    Then Player should win
    And Player holds TwoPairs
    And AIP holds Single
