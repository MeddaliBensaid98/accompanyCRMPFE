# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class AccompanyEmploye(models.Model):
    _name = "accompany.employe"
    _inherit = 'mail.thread'
    _description = "Accompany Employe Model"
    
   
    id = fields.Char(string="Identifiant", default=lambda self: _('New'))
    name = fields.Char(string='Name', required=True ,   tracking=True)
    email = fields.Char(string='Email', size=100,unique=True)
    _sql_constraints = [
    ('unique_email', 'UNIQUE(email)', 'This email already exists. Please choose a different one.')]

    country = fields.Selection([
        ('+1', '+1 - United States'),
        ('+44', '+44 - United Kingdom'),
        ('+33', '+33 - France'),
        ('+216', '+216 - Tunisia'),
        # Add more countries as needed
    ], string='Country Code')
    
    Tasks = fields.Many2many(
    'todo.task',
    string='Related Todo Task',
    relation='accompany_employe_todo_task_rel'  )
    Rank = fields.Selection([
        ('CJ', 'Consultant Junior'),
        ('CS', 'Consultant Senior'),
        ('MA', 'Manager'),
        ('AS', 'Associé '),
        # Add more countries as needed
    ], string='Rank')

    

    capitalized_name = fields.Char(string='Capitalized Name', compute='_compute_capitalized_name')
    phone_number = fields.Char(string='Phone Number', size=20)
    
   

    
    @api.constrains('email')
    def _check_valid_email(self):
        for record in self:
            if record.email:
                # Validate email format using a simple regex pattern
                if not re.match(r"[^@]+@[^@]+\.[^@]+", record.email):
                    raise ValidationError("Invalid email address: %s" % record.email)
                
 
    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['id'] = self.env['ir.sequence'].next_by_code('accompany.employe')
        return super(AccompanyEmploye, self).create(vals_list)

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

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list:
            if 'email' in vals:
                existing_employee = self.env['accompany.employe'].search([('email', '=', vals['email'])])
                if existing_employee:
                    raise ValidationError("Employee with email '%s' already exists." % vals['email'])
            if 'phone_number' in vals:
                existing_phone_employee = self.env['accompany.employe'].search([('phone_number', '=', vals['phone_number'])])
                if existing_phone_employee:
                    raise ValidationError("Employee with phone number '%s' already exists." % vals['phone_number'])

           
        return super(AccompanyEmploye, self).create(vals_list)

        
