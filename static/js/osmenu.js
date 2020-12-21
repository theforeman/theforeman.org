$(document).ready(function(){
    var operatingSystems = {
        'rhel5': [],
        'rhel6': ['el6'],
        'rhel7': ['el7'],
        'rhel8': ['el8'],
        'el5': [],
        'el6': [],
        'el7': [],
        'el8': [],
        'f22': [],
        'f23': [],
        'f25': [],
        'f26': [],
        'f27': [],
        'f28': [],
        'f29': [],
        'sles11': [],
        'sles12': []
    };

    function show(os) {
        $('#' + os).show();
        $('.' + os).show();
    }

    function hide(os) {
        $('#' + os).hide();
        $('.' + os).hide();
    }

    function showOS(operatingSystem) {
        var os, oses, i = 0;

        for(os in operatingSystems) {
            if (operatingSystems.hasOwnProperty(os)) {
                hide(os);
            }
        }
        for(os in operatingSystems) {
            if (operatingSystems.hasOwnProperty(os)) {
                if (os === operatingSystem) {
                    show(os);
                }
            }
        }

        oses = operatingSystems[operatingSystem];

        for(i; i < oses.length; i += 1) {
            show(oses[i]);
        }

        return true;
    }

    $('#operatingSystems').change(function() {
        showOS($(this).val());
    });

    showOS($('#operatingSystems').val());
});
