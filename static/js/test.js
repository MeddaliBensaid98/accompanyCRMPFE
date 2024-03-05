odoo.define('AccompanyCRM.model_accompany_employe', function(require) {
    "use strict";

    var core = require('web.core');
    var ActionManager = require('web.ActionManager');

    var _t = core._t;

    ActionManager.include({
        ir_actions_act_window: function(action, options) {
            var self = this;
            if (action.auto_refresh) {
                setTimeout(function() {
                    self.do_action(action, options);
                }, 3000); // Refresh every 3 seconds (adjust as needed)
            } else {
                this._super.apply(this, arguments);
            }
        },
    });
});