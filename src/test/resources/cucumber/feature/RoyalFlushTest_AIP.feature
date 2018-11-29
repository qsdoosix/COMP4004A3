Feature: Test the Royal flush beats any other hands on Player

  Scenario: 1.AIP have Royal flush and Player have straight flush
    Given AIP have H10
    And AIP have HJ
    And AIP have HQ
    And AIP have HK
    And AIP have HA
    When Player have S4
    And Player have S5
    And Player have S6
    And Player have S7
    And Player have S8
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds StraightFlush

  Scenario: 2.AIP have Royal flush and Player have FullHouse
    Given Player have H3
    And Player have D3
    And Player have C3
    And Player have H5
    And Player have D5
    When AIP have SA
    And AIP have SK
    And AIP have SQ
    And AIP have SJ
    And AIP have S10
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds FullHouse

  Scenario: 3.AIP have Royal flush and Player have 4 of a kind
    Given Player have H4
    And Player have D4
    And Player have C4
    And Player have S4
    And Player have D5
    When AIP have S10
    And AIP have SQ
    And AIP have SA
    And AIP have SJ
    And AIP have SK
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds FourOFAKind

  Scenario: 4.AIP have Royal flush and Player have Straight
    Given Player have H4
    And Player have D5
    And Player have C6
    And Player have S7
    And Player have D8
    When AIP have C10
    And AIP have CJ
    And AIP have CK
    And AIP have CQ
    And AIP have CA
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds Straight

  Scenario: 5.AIP have Royal flush and Player have Flush
    Given Player have H3
    And Player have H5
    And Player have H7
    And Player have H8
    And Player have H10
    When AIP have DJ
    And AIP have DQ
    And AIP have DA
    And AIP have D10
    And AIP have DK
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds Flush

  Scenario: 6.AIP have Royal flush and Player have 3 of a kind
    Given Player have H4
    And Player have D4
    And Player have C4
    And Player have S7
    And Player have D5
    When AIP have C10
    And AIP have CK
    And AIP have CJ
    And AIP have CA
    And AIP have CQ
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds ThreeOFAKind

  Scenario: 7.AIP have Royal flush and Player have two pairs
    Given Player have H4
    And Player have D4
    And Player have C7
    And Player have S7
    And Player have D9
    When AIP have DQ
    And AIP have DK
    And AIP have DJ
    And AIP have D10
    And AIP have DA
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds TwoPairs

  Scenario: 8.AIP have Royal flush and Player have one pair
    Given Player have H4
    And Player have D4
    And Player have C7
    And Player have S9
    And Player have DJ
    When AIP have DQ
    And AIP have DK
    And AIP have DJ
    And AIP have D10
    And AIP have DA
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds Pair

  Scenario: 9.AIP have Royal flush and Player have only single card
    Given Player have HA
    And Player have D4
    And Player have C7
    And Player have S9
    And Player have DJ
    When AIP have DQ
    And AIP have DK
    And AIP have DJ
    And AIP have D10
    And AIP have DA
    And AIP analyze
    Then AIP should win
    And AIP holds RoyalFlush
    And Player holds Single
