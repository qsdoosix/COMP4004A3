Feature: To test about straight flush

  Scenario: 1 AIP have Straight flush and Player have 4 of a kind
    Given Player have H9
    And Player have S10
    And Player have C10
    And Player have D10
    And Player have H10
    When AIP have C8
    And AIP have C9
    And AIP have C10
    And AIP have CJ
    And AIP have CQ
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds FourOfAKind

  Scenario: 2 AIP have Straight flush and Player have Full house
    Given Player have H10
    And Player have S10
    And Player have C10
    And Player have D9
    And Player have H9
    When AIP have SK
    And AIP have SQ
    And AIP have SJ
    And AIP have S10
    And AIP have S9
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds FullHouse

  Scenario: 3 AIP have Straight flush and Player have Flush
    Given Player have H8
    And Player have H5
    And Player have H2
    And Player have H10
    And Player have HK
    When AIP have D3
    And AIP have D5
    And AIP have D7
    And AIP have D4
    And AIP have D6
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds Flush

  Scenario: 4 AIP have Straight flush and Player have Straight
    Given Player have S8
    And Player have D9
    And Player have C10
    And Player have DJ
    And Player have HQ
    When AIP have H4
    And AIP have H3
    And AIP have H6
    And AIP have H7
    And AIP have H5
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds Straight

  Scenario: 5 AIP have Straight flush and Player have 3 of a kind
    Given Player have S8
    And Player have D8
    And Player have C8
    And Player have DJ
    And Player have HQ
    When AIP have H4
    And AIP have H3
    And AIP have H6
    And AIP have H7
    And AIP have H5
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds threeofakind

  Scenario: 6 AIP have Straight flush and Player have 2 pairs
    Given Player have S8
    And Player have D8
    And Player have CJ
    And Player have DJ
    And Player have HQ
    When AIP have H4
    And AIP have H3
    And AIP have H6
    And AIP have H7
    And AIP have H5
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds twopairs

  Scenario: 7 AIP have Straight flush and Player have 1 pair
    Given Player have S8
    And Player have D8
    And Player have C5
    And Player have DJ
    And Player have HQ
    When AIP have H4
    And AIP have H3
    And AIP have H6
    And AIP have H7
    And AIP have H5
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds pair

  Scenario: 8 AIP have Straight flush and Player have single cards
    Given Player have S2
    And Player have D8
    And Player have C5
    And Player have DJ
    And Player have HQ
    When AIP have H4
    And AIP have H3
    And AIP have H6
    And AIP have H7
    And AIP have H5
    And AIP analyze
    Then AIP should win
    And AIP holds StraightFlush
    And Player holds single
