Feature: Test AIP beat Player with Flush hand

  Scenario:1 AIP has flush beats Player straight
    Given Player have H3
    And Player have C4
    And Player have C5
    And Player have S6
    And Player have H7
    When AIP have H3
    And AIP have H5
    And AIP have H7
    And AIP have H10
    And AIP have HJ
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds Straight

  Scenario:2 AIP has flush beats Player 3 of a kind
    Given Player have H3
    And Player have C3
    And Player have C5
    And Player have S3
    And Player have H7
    When AIP have CQ
    And AIP have CJ
    And AIP have C6
    And AIP have C4
    And AIP have C2
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds ThreeOfAKind

  Scenario:3 AIP has flush beats Player two pairs
    Given Player have H3
    And Player have C3
    And Player have C5
    And Player have S5
    And Player have H7
    When AIP have S3
    And AIP have S6
    And AIP have S2
    And AIP have S9
    And AIP have S7
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds TwoPairs

  Scenario:4 AIP has flush beats Player one pair
    Given Player have H3
    And Player have C3
    And Player have C8
    And Player have S5
    And Player have H7
    When AIP have D3
    And AIP have D8
    And AIP have DJ
    And AIP have D9
    And AIP have D7
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds Pair

  Scenario:5 AIP has flush beats Player high card
    Given Player have H3
    And Player have CA
    And Player have C8
    And Player have S5
    And Player have H7
    When AIP have D8
    And AIP have D5
    And AIP have D3
    And AIP have D7
    And AIP have D10
    And AIP analyze
    Then AIP should win
    And AIP holds Flush
    And Player holds Single
