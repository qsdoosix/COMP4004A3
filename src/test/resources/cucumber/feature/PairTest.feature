Feature: Player beat AIP with Pair

  Scenario: 1 HTB has one pair beats AIP high card
    Given AIP have HA
    And AIP have DJ
    And AIP have CK
    And AIP have S10
    And AIP have H9
    When Player have H3
    And Player have D3
    And Player have C4
    And Player have S8
    And Player have H6
    Then Player should win
    And Player holds Pair
    And AIP holds Single