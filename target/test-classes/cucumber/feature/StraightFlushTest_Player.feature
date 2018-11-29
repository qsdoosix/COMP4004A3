Feature: To test about straight flush

  Scenario: 1 Player have Straight flush and AIP have 4 of a kind
    Given AIP have H9
    And AIP have S10
    And AIP have C10
    And AIP have D10
    And AIP have H10
    When Player have C8
    And Player have C9
    And Player have C10
    And Player have CJ
    And Player have CQ
    Then Player should win
    And Player holds StraightFlush
    And AIP holds FourOfAKind

  Scenario: 2 Player have Straight flush and AIP have Full house
    Given AIP have H10
    And AIP have S10
    And AIP have C10
    And AIP have D9
    And AIP have H9
    When Player have SK
    And Player have SQ
    And Player have SJ
    And Player have S10
    And Player have S9
    Then Player should win
    And Player holds StraightFlush
    And AIP holds FullHouse

  Scenario: 3 Player have Straight flush and AIP have Flush
    Given AIP have H8
    And AIP have H5
    And AIP have H2
    And AIP have H10
    And AIP have HK
    When Player have D3
    And Player have D5
    And Player have D7
    And Player have D4
    And Player have D6
    Then Player should win
    And Player holds StraightFlush
    And AIP holds Flush

  Scenario: 4 Player have Straight flush and AIP have Straight
    Given AIP have S8
    And AIP have D9
    And AIP have C10
    And AIP have DJ
    And AIP have HQ
    When Player have H4
    And Player have H3
    And Player have H6
    And Player have H7
    And Player have H5
    Then Player should win
    And Player holds StraightFlush
    And AIP holds Straight

  Scenario: 5 Player have Straight flush and AIP have 3 of a kind
    Given AIP have S8
    And AIP have D8
    And AIP have C8
    And AIP have DJ
    And AIP have HQ
    When Player have H4
    And Player have H3
    And Player have H6
    And Player have H7
    And Player have H5
    Then Player should win
    And Player holds StraightFlush
    And AIP holds threeofakind

  Scenario: 6 Player have Straight flush and AIP have 2 pairs
    Given AIP have S8
    And AIP have D8
    And AIP have CJ
    And AIP have DJ
    And AIP have HQ
    When Player have H4
    And Player have H3
    And Player have H6
    And Player have H7
    And Player have H5
    Then Player should win
    And Player holds StraightFlush
    And AIP holds twopairs

  Scenario: 7 Player have Straight flush and AIP have 1 pair
    Given AIP have S8
    And AIP have D8
    And AIP have C5
    And AIP have DJ
    And AIP have HQ
    When Player have H4
    And Player have H3
    And Player have H6
    And Player have H7
    And Player have H5
    Then Player should win
    And Player holds StraightFlush
    And AIP holds pair

  Scenario: 8 Player have Straight flush and AIP have single cards
    Given AIP have S2
    And AIP have D8
    And AIP have C5
    And AIP have DJ
    And AIP have HQ
    When Player have H4
    And Player have H3
    And Player have H6
    And Player have H7
    And Player have H5
    Then Player should win
    And Player holds StraightFlush
    And AIP holds single
