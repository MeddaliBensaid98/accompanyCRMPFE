# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class AffectationSecteurtype(models.Model):
    
    _name = 'accompany.affectation_secteur_type'
    _description = "Accompany AffectationSecteur Model"
    _rec_name="AffectationSecteur"
    ref = fields.Char(string="Identifiant", default=lambda self: _('New'))
   
    
    AffectationSecteur= fields.Char()



    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.affectation_secteur_type')
        return super(AffectationSecteurtype, self).create(vals_list)
  
    def name_get(self):
        result = []
        for record in self:
            record_name = record.ref + ' - ' + record.AffectationSecteur
            result.append((record.id, record_name))
        return result