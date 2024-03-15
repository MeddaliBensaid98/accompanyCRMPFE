# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class afectationbU(models.Model):
    
    _name='accompany.afectationbu'
    _description = "Accompany afectationbu Model"
     
    ref = fields.Char(string="Identifiant", default=lambda self: _('New'))
    _rec_name="afectationBUtype"
    
    afectationBUtype= fields.Char()



    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.afectationbu')
        return super(afectationbU, self).create(vals_list)
  
   
    def name_get(self):
        result = []
        for record in self:
            record_name = record.ref + ' - ' + record.afectationBUtype
            result.append((record.id, record_name))
        return result
