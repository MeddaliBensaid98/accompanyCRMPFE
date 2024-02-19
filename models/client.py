# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class AccompanyClient(models.Model):
    _name = "accompany.client"
    _inherit = 'mail.thread'
    _description = "Accompany Client Model"
    

    name = fields.Char(string='Name', required=True ,   tracking=True)
    email = fields.Char(string='Email', size=100)
    country = fields.Selection([
        ('+1', '+1 - United States'),
        ('+44', '+44 - United Kingdom'),
        ('+33', '+33 - France'),
        ('+216', '+216 - Tunisia'),
        # Add more countries as needed
    ], string='Country Code')
    is_foreign = fields.Boolean(string='Is Foreign?' , tracking=True) 
    notes = fields.Text(string='Notes')
    capitalized_name = fields.Char(string='Capitalized Name', compute='_compute_capitalized_name')
    phone_number = fields.Char(string='Phone Number', size=20)
    ref = fields.Char(string="Reference", default=lambda self: _('New'))
    offer_id = fields.Many2one('accompany.offer',string="offer",tracking=True)
  
    tasks = fields.Many2one('todo.task',string="tasks",tracking=True)
 


    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.client')
            if 'email' in vals:
                existing_employee = self.env['accompany.client'].search([('email', '=', vals['email'])])
                if existing_employee:
                    raise ValidationError("Client with email '%s' already exists." % vals['email'])
            if 'phone_number' in vals:
                existing_phone_employee = self.env['accompany.client'].search([('phone_number', '=', vals['phone_number'])])
                if existing_phone_employee:
                    raise ValidationError("client with phone number '%s' already exists." % vals['phone_number'])
            if 'name' in vals:
                existing_employee = self.env['accompany.client'].search([('name', '=', vals['name'])])
                if existing_employee:
                    raise ValidationError("Client with name '%s' already exists." % vals['name'])
        return super(AccompanyClient, self).create(vals_list)
    
    @api.onchange('country')
    def _onchange_country(self):
        for record in self:
            if record.country and record.phone_number:
                if not record.phone_number.startswith(record.country):
                    record.phone_number = record.country + record.phone_number[len(record.country):]
            elif record.country:
                record.phone_number = record.country
                
    @api.depends('name')
    def _compute_capitalized_name(self):
      
        if self.name:
                self.capitalized_name = self.name.upper()
        else:
                self.capitalized_name = ""

    @api.onchange('is_foreign')
    def onchange_notes(self):
        if self.is_foreign == True:
            self.notes = 'this company is not from tunisia '

        else:
            self.notes = 'this company is  from tunisia '
        
    @api.constrains('email')
    def _check_valid_email(self):
        for record in self:
            if record.email:
                # Validate email format using a simple regex pattern
                if not re.match(r"[^@]+@[^@]+\.[^@]+", record.email):
                    raise ValidationError("Invalid email address: %s" % record.email)
                
    @api.onchange('is_foreign', 'country')
    def onchange_notes(self):
        if self.country and self.country != '+216':
            self.is_foreign = True
        else:
            self.is_foreign = False

        if self.is_foreign:
            self.notes = 'This company is not from Tunisia.'
        else:
            self.notes = 'This company is from Tunisia.'
 
