# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class afectationoffre(models.Model):
    
    _name='accompany.afectationoffre'
    _description = "Accompany afectationoffre Model"
    _rec_name="afectationoffre"
    ref = fields.Char(string="Identifiant", default=lambda self: _('New'))

    afectationoffre= fields.Char(string="afectationoffre")



    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.afectationoffre')
        return super(afectationoffre, self).create(vals_list)
    

    def name_get(self):
        result = []
        for record in self:
            record_name = record.ref + ' - ' + record.afectationoffre
            result.append((record.id, record_name))
        return result