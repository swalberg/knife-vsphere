Feature: list vlans
  Background:
    Given a vsphere server at 1.1.1.1
    And a DC named test
  Scenario: vlans exist
    Given the server at 1.1.1.1 has a vlan tag 2 name foo bar
    And the server at 1.1.1.1 has a vlan tag 3 name blah

    When I run 'knife vsphere vlan list --vspass=hello --vsdc=test'
    Then the output should have 2 lines
