# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError


class AccompanyOffers(models.Model):
    _name = 'accompany.offer'
    _inherit = 'mail.thread'
    _description = "Accompany Offers Model"
    _rec_name = 'Offername'
    Offername = fields.Char(string='Offer Name', required=True ,   tracking=True)
    Details = fields.Text(string='Details' , tracking=True) 
    Revenus = fields.Float(string='Revenus')
    reference = fields.Char(string="Offer Reference", default=lambda self: _('New'))
    active = fields.Boolean(default=True)
    state = fields.Selection([
        ('new','New'),
        ('in_progress','In progress'),
        ('completed','Completed'),
    ])



    
    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['reference'] = self.env['ir.sequence'].next_by_code('accompany.Offer')
        return super(AccompanyOffers, self).create(vals_list)
    
    @api.constrains('Revenus')
    def _check_positive_revenus(self):
        for record in self:
            if record.Revenus < 0:
                raise ValidationError("Revenus must be a positive value.")
    

 
