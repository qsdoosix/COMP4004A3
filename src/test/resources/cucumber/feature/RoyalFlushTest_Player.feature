Feature: Test the Royal flush beats any other hands on AIP

  Scenario: 1.Player have Royal flush and AIP have straight flush

    Given Player have H10
    And Player have HJ
    And Player have HQ
    And Player have HK
    And Player have HA
    When AIP have S4
    And AIP have S5
    And AIP have S6
    And AIP have S7
    And AIP have S8
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds StraightFlush

  Scenario: 2.Player have Royal flush and AI player have FullHouse

    Given AIP have H3
    And AIP have D3
    And AIP have C3
    And AIP have H5
    And AIP have D5
    When Player have SA
    And Player have SK
    And Player have SQ
    And Player have SJ
    And Player have S10
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds FullHouse

  Scenario: 3.Player have Royal flush and AI player have 4 of a kind

    Given AIP have H4
    And AIP have D4
    And AIP have C4
    And AIP have S4
    And AIP have D5
    When Player have C10
    And Player have CQ
    And Player have CA
    And Player have CJ
    And Player have CK
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds FourOFAKind

  Scenario: 4.Player have Royal flush and AI player have Straight

    Given AIP have H4
    And AIP have D5
    And AIP have C6
    And AIP have S7
    And AIP have D8
    When Player have D10
    And Player have DJ
    And Player have DK
    And Player have DQ
    And Player have DA
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds Straight

  Scenario: 5.Player have Royal flush and AI player have Flush

    Given AIP have H3
    And AIP have H5
    And AIP have H7
    And AIP have H8
    And AIP have H10
    When Player have DJ
    And Player have DQ
    And Player have DA
    And Player have D10
    And Player have DK
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds Flush

  Scenario: 6.Player have Royal flush and AI player have 3 of a kind

    Given AIP have H4
    And AIP have D4
    And AIP have C4
    And AIP have S7
    And AIP have D5
    When Player have C10
    And Player have CK
    And Player have CJ
    And Player have CA
    And Player have CQ
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds ThreeOFAKind

  Scenario: 7.Player have Royal flush and AI player have two pairs

    Given AIP have H4
    And AIP have D4
    And AIP have C7
    And AIP have S7
    And AIP have D9
    When Player have DQ
    And Player have DK
    And Player have DJ
    And Player have D10
    And Player have DA
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds TwoPairs

  Scenario: 8.Player have Royal flush and AI player have one pair

    Given AIP have H4
    And AIP have D4
    And AIP have C7
    And AIP have S9
    And AIP have DJ
    When Player have DQ
    And Player have DK
    And Player have DJ
    And Player have D10
    And Player have DA
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds Pair

  Scenario: 9.Player have Royal flush and AI player have only single card

    Given AIP have HA
    And AIP have D4
    And AIP have C7
    And AIP have S9
    And AIP have DJ
    When Player have DQ
    And Player have DK
    And Player have DJ
    And Player have D10
    And Player have DA
    Then Player should win
    And Player holds RoyalFlush
    And AIP holds Single
