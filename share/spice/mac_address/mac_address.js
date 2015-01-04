(function (env) {
    "use strict";
    env.ddg_spice_mac_address = function(api_result) {
        // Get MAC address from query
        var script = $('[src*="/js/spice/mac_address/"]')[0],
            macAddress = $(script).attr('src').match(/mac_address\/([^\/]+)/)[1];

        if (!api_result || !api_result.length || api_result.error) {
            return Spice.failed('mac_address');
        }

        Spice.add({
            id: "mac_address",
            name: "MAC Vendor",
            data: api_result,
            meta: {
                sourceName: "macvendorlookup.com",
                sourceUrl: 'http://www.macvendorlookup.com/search/' + macAddress
            },
            templates: {
                group: 'base',
                options: {
                    content: Spice.mac_address.content,
                    moreAt: true
                }
            }
        });
    };

    // Formats a MAC Address as colon-separated uppercase hex bytes
    Handlebars.registerHelper("MacAddress_formatMAC", function (mac) {
        return mac.replace(/(.{2})[:\.\-]?(?=[0-9A-Fa-f])/g, '$1:').toUpperCase();
    });
}(this));
