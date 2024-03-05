 # -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class AccompanyContrat(models.Model):
    _name = "accompany.contrat"
    _inherit = 'mail.thread'
    _description = "Accompany Contrat Model"

    ref = fields.Char(string="Reference", default=lambda self: _('New'))
    Relation=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ], string='Langue',store=True,readonly=False)

    Contributeur=fields.Text("Contributeur")
    Associé=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ], string='Associé',store=True,readonly=False)
    Contributeur2=fields.Text("Contributeur")
     
    ClosingAssocié=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ], string='ClosingAssocié',store=True,readonly=False)
    Contributeur3=fields.Text("Contributeur")
    BudgetDinar=fields.float("Budget en dinar")
    Budgeteuro=fields.float("Budget en euros") 
    Budgetpondere=fields.float("Budget pondéré") 
    Revenuespere=fields.float("Revenu espéré ") 
    Probabilite=fields.float("Probabilité ") 
    


    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.contrat')
      
      
        return super(AccompanyContrat, self).create(vals_list)
    
    
