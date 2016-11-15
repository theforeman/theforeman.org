$(document).ready(function(){
    $('#operatingSystems').change(function() {
        var operatingSystems = {
            'rhel5': [],
            'rhel6': ['el6'],
            'rhel7': ['el7'],
            'el5': [],
            'el6': [],
            'el7': [],
            'f22': [],
            'f23': []
        };

        function show(os) {
            $('#' + os).show();
        }

        function hide(os) {
            $('#' + os).hide();
        }

        function showOS(operatingSystem) {
            var os, oses, i = 0;

            for(os in operatingSystems) {
                if (operatingSystems.hasOwnProperty(os)) {
                    if (os === operatingSystem) {
                        show(os);
                    } else {
                        hide(os);
                    }
                }
            }

            oses = operatingSystems[operatingSystem];

            for(i; i < oses.length; i += 1) {
                show(oses[i]);
            }

            return true;
        }

        showOS($(this).val());
    });
});
