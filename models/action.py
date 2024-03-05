# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class AccompanyAction(models.Model):
    _name = "accompany.action"
    _inherit = 'mail.thread'
    _description = "Accompany Action Model"
    


    id = fields.Char(string="Identifiant", default=lambda self: _('New'))
    DerniereAction = fields.Char(string='Dernière Action', required=True ,   tracking=True)

    DateAction = fields.Date('Date Action',store=True,readonly=False)
    Actionrequise = fields.Text(string='Action requise', required=True ,   tracking=True)
    Risque = fields.Text(string='Risque', required=True ,   tracking=True)
    inscriptionsimultanee = fields.Text(string='inscription simultanée', required=True ,   tracking=True)


    taskid =fields.Many2one("todo.task","offer",index=True , readonly=False,tracking=True)
    
    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['id'] = self.env['ir.sequence'].next_by_code('accompany.Action')
        return super(AccompanyAction, self).create(vals_list)