package DDG::Spice::MacAddress;
# ABSTRACT: Prints vendor information for MAC addresses

use DDG::Spice;

spice is_cached => 1;

name "Mac Address";
source "MAC Vendor Lookup";
description "Retrieves vendor information for MAC addresses";
primary_example_queries "bc:76:4e:be:ef:74", "mac bc:76:4e:be:ef:74";
secondary_example_queries "bc.76.4e.be.ef.74", "bc-76-4e-be-ef-74";
category "computing_tools";
topics "sysadmin";
code_url "https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Mac_address.pm";
attribution github => ["DavidWittman", "David Wittman"];

triggers query_lc => qr/\b((?:[0-9a-f]{2}[\.:\-]){5}(?:[0-9a-f]{2}))\b/;

spice to => 'http://www.macvendorlookup.com/api/v2/$1';
spice wrap_jsonp_callback => 1;

handle query_lc => sub {
    my $macAddress = $1;
    $macAddress =~ s/[\-:\.]//g;
    return unless $macAddress;
    return $macAddress;
};

1;
