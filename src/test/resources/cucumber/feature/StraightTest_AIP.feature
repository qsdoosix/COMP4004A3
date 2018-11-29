Feature: Test AIP beat Player with Straight

  Scenario:1 AIP has straight beats Player 3 of a kind
    Given Player have H9
    And Player have S6
    And Player have C10
    And Player have D10
    And Player have H10
    When AIP have C7
    And AIP have S9
    And AIP have DJ
    And AIP have H8
    And AIP have C10
    Then AIP should win
    And AIP holds Straight
    And Player holds ThreeOfAKind

  Scenario:2 AIP has straight beats Player two pairs
    Given Player have H9
    And Player have S6
    And Player have C9
    And Player have D10
    And Player have H10
    When AIP have D7
    And AIP have S9
    And AIP have H5
    And AIP have S6
    And AIP have H8
    Then AIP should win
    And AIP holds Straight
    And Player holds TwoPairs

  Scenario:3 AIP has straight beats Player one pair
    Given Player have H9
    And Player have S6
    And Player have C9
    And Player have D10
    And Player have H10
    When AIP have S5
    And AIP have H7
    And AIP have C9
    And AIP have S8
    And AIP have H6
    Then AIP should win
    And AIP holds Straight
    And Player holds Pair

  Scenario:4 AIP has straight beats Player high card
    Given Player have H9
    And Player have S6
    And Player have C9
    And Player have D10
    And Player have H10
    When AIP have HJ
    And AIP have C10
    And AIP have S8
    And AIP have C9
    And AIP have DQ
    Then AIP should win
    And AIP holds Straight
    And Player holds Pair
