#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Spice;

spice is_cached => 1;

ddg_spice_test(
    [qw( DDG::Spice::MacAddress)],
    'de:ad:be:ef:ca:fe' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    'mac de:ad:be:ef:ca:fe' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    'de:ad:be:ef:ca:fe oui' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    'DE:AD:BE:EF:CA:FE' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    'de.ad.be.ef.ca.fe' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    'de-ad-be-ef-ca-fe' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    'de:AD-be.ef-CA.fe' => test_spice(
        '/js/spice/mac_address/deadbeefcafe',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ), 
    'd3:4d:b3:3f:c4:f3' => test_spice(
        '/js/spice/mac_address/d34db33fc4f3',
        call_type => 'include',
        caller => 'DDG::Spice::MacAddress'
    ),
    # Failing tests
    'ade:ad:be:ef:ca:fe' => undef,
    'deadbeefcafe' => undef,
    'xx:ad:be:ef:ca:fe' => undef,
    'de/ad/be/ef/ca/fe' => undef,
    'de:ad:be:ef:ca:feed' => undef,
    'de:ad:be' => undef,
    '127.0.0.1' => undef,
    'fe80::be76:4eff:fe04:3e7f' => undef,
    '07.21.1986' => undef,
);

done_testing;

