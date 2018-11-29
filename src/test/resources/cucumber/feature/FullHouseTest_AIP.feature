Feature: Test about AIP beat Player with full house

  Scenario: 1 AIP has full house  beats Player flush
    Given Player have H2
    And Player have H6
    And Player have H3
    And Player have HJ
    And Player have H9
    When AIP have H6
    And AIP have D6
    And AIP have C6
    And AIP have S4
    And AIP have H4
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds Flush

  Scenario: 2 AIP has full house  beats Player straight
    Given Player have H3
    And Player have C4
    And Player have D5
    And Player have S6
    And Player have H7
    When AIP have H9
    And AIP have D9
    And AIP have C8
    And AIP have S8
    And AIP have H8
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds Straight

  Scenario: 3 AIP has full house  beats Player 3 of a kind
    Given Player have H3
    And Player have C3
    And Player have D3
    And Player have S6
    And Player have H7
    When AIP have H9
    And AIP have D8
    And AIP have C8
    And AIP have S8
    And AIP have H9
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds ThreeOfAKind

  Scenario: 4 AIP has full house  beats Player two pairs
    Given Player have H3
    And Player have C3
    And Player have D6
    And Player have S6
    And Player have H7
    When AIP have H9
    And AIP have D8
    And AIP have C9
    And AIP have S8
    And AIP have H8
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds TwoPairs

  Scenario: 5 AIP has full house  beats Player one pair
    Given Player have H3
    And Player have C3
    And Player have C9
    And Player have S6
    And Player have H7
    When AIP have H9
    And AIP have D8
    And AIP have C9
    And AIP have S8
    And AIP have H8
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds Pair

  Scenario: 6 AIP has full house  beats Player high card
    Given Player have H3
    And Player have C2
    And Player have D6
    And Player have S9
    And Player have H7
    When AIP have H9
    And AIP have D8
    And AIP have C9
    And AIP have S8
    And AIP have H8
    And AIP analyze
    Then AIP should win
    And AIP holds FullHouse
    And Player holds Single
