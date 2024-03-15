
# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class Partner(models.Model):

    _inherit = 'calendar.event'

 