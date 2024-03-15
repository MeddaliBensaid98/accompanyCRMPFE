# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class accompanyType(models.Model):
    
    _name='accompany.type'
    _description = "Accompany type Model"
    _rec_name="TypeAccmpany"
     
    ref = fields.Char(string="Identifiant", default=lambda self: _('New'),readonly=True)

    TypeAccmpany= fields.Char(string="Type")


    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.type')
        return super(accompanyType, self).create(vals_list)   
  
    def name_get(self):
        result = []
        for record in self:
            record_name = record.ref + ' - ' + record.TypeAccmpany
            result.append((record.id, record_name))
        return result