# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class Stage(models.Model):

    _inherit = 'crm.stage'

 