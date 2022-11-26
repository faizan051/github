(function () {
    'use strict';

    angular
        .module('app')
        .factory('Constant', Constant);

    /** @ngInject */
    function Constant() {

        return {

            covertWords: function (s) {
                var myappthos = ['', 'Thousand', 'Million', 'Billion', 'Trillion'];

                var myappdang = ['zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];

                var myapptenth = ['Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'];

                var myapptvew = ['Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
                s = s.toString();

                s = s.replace(/[\, ]/g, '');

                if (s != parseFloat(s)) return 'not a number';

                var query = s.indexOf('.');

                if (query == -1) query = s.length;

                if (query > 15) return 'too big';

                var n = s.split('');

                var str = '';

                var mjk = 0;

                for (var ld = 0; ld < query; ld++) {

                    if ((query - ld) % 3 == 2) {

                        if (n[ld] == '1') {

                            str += myapptenth[Number(n[ld + 1])] + ' ';

                            ld++;

                            mjk = 1;

                        }

                        else if (n[ld] != 0) {

                            str += myapptvew[n[ld] - 2] + ' ';

                            mjk = 1;

                        }

                    }

                    else if (n[ld] != 0) {

                        str += myappdang[n[ld]] + ' ';

                        if ((query - ld) % 3 == 0) str += 'Hundred ';

                        mjk = 1;

                    }



                    if ((query - ld) % 3 == 1) {

                        if (mjk) str += myappthos[(query - ld - 1) / 3] + ' ';

                        mjk = 0;

                    }

                }

                if (query != s.length) {

                    var dv = s.length;

                    str += 'point ';

                    for (var ld = query + 1; ld < dv; ld++) str += myappdang[n[ld]] + ' ';

                }
                return str.replace(/\s+/g, ' ');


            },

            UserTypes: function () {
                return {
                    "Doctor": 2,
                    "Patient": 5,
                    "Nutritionist": 3,
                    "Pharmacist": 4,
                }
            },

            timeformate: function (time) {
                return moment(time).format('HH:mm:ss');
            },

            dateformate: function (date) {
                return moment(date).format("YYYY-MM-DD");
            },

        }


    }
}());