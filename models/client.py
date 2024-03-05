# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class AccompanyClient(models.Model):
    _name = "accompany.client"
    _inherit = 'mail.thread'
    _description = "Accompany Client Model"
    

    name = fields.Char(string='Client', required=True ,   tracking=True)
    nameResponsable=fields.Char(string='Nom Du Contact', required=True ,   tracking=True)
    Poste=fields.Char(string='Poste ', required=True ,   tracking=True)
   
    email = fields.Char(string='Email')
    titre =fields.Selection([
        ('Docteur', 'Docteur'),
        ('Madame', 'Madame'),
        ('Madamoiselle  ', 'Madamoiselle'),
        ('Monsieur', 'Monsieur'),
        ('Professeur', 'Professeur'),
        # Add more Monsieur as needed
    ], string='titre',create=True)
    Adresse=fields.Char(string='Adresse', required=True ,   tracking=True)
    Langue =fields.Selection([
        ('Francais', 'Francais'),
        ('Anglais', 'Anglais'),
        
       
        # Add more countries as needed
    ], string='Langue',create=True)
    country = fields.Selection([
        ('+1', '+1 - United States'),
        ('+44', '+44 - United Kingdom'),
        ('+33', '+33 - France'),
        ('+216', '+216 - Tunisia'),
        # Add more countries as needed
    ], string='Country Code')
    Campagne = fields.Selection([
        ('Sale', 'Sale'),
        ('Christmas_Special', 'Christmas Special'),
        ('Email_Campaign_Service', 'Email Campaign-Service'),
       
        # Add more countries as needed
    ], string='Campagne',create=True)   
    Moyen   = fields.Selection([
        ('Banner', 'Banner'),
        ('Direct', 'Direct'),
        ('Email', 'Email'),
        ('Facebook', 'Facebook'),
        ('Linkedin', 'Linkedin'),
        ('Phone', 'Phone'),
       
        # Add more countries as needed
    ], string='Moyen',create=True) 
    Affectationsecteur      = fields.Selection([
        ('Banques', 'Banques'),
        ('Assurances', 'Assurances'),
        ('SFS', 'SFS'),
        ('Public', 'Public'),
        ('Autre', 'Autre'),
      
       
        # Add more countries as needed
    ], string='Affectation secteur',create=True) 
    Source  = fields.Selection([
        ('Moteur de Recherche', 'Moteur_de_Recherche'),
        ('Rappel_de_Piste', 'Rappel De Piste'),
        ('Lettre_d_information', 'Lettre d information'),
        ('Facebook', 'Facebook'),
        ('Linkedin', 'Linkedin'),
        ('Twitter', 'Twitter'),
    
       
        # Add more countries as needed
    ], string='Source', create=True, store=True, readonly=False)

    Siteweb = fields.Text(string='Site web')
    is_foreign = fields.Boolean(string='Is Foreign?' , tracking=True) 
    notes = fields.Text(string='Notes')
    capitalized_name = fields.Char(string='Capitalized Name', compute='_compute_capitalized_name')
    phone_number = fields.Char(string='Phone Number',size=20)
    ref = fields.Char(string="Reference", default=lambda self: _('New'))
    Clientcheckbox= fields.Boolean(string='Client' ) 
    Prospectcheckbox= fields.Boolean(string='Prospect' ) 
    _columns = {
       'tasks' : fields.Many2one('todo.task',string="tasks",tracking=True)
      }
    Apportepar = fields.Char(string='Apporté par')

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.client')
            if 'phone_number' in vals and not vals['phone_number'].isdigit():
                raise ValidationError("Phone number must contain only numbers.")
            if 'email' in vals:
                existing_client = self.env['accompany.client'].search([('email', '=', vals['email'])])
                if existing_client:
                    raise ValidationError("Client with email '%s' already exists." % vals['email'])
            if 'phone_number' in vals:
                existing_client = self.env['accompany.client'].search([('phone_number', '=', vals['phone_number'])])
                if existing_client:
                    raise ValidationError("Client with phone number '%s' already exists." % vals['phone_number'])
            if 'name' in vals:
                existing_client = self.env['accompany.client'].search([('name', '=', vals['name'])])
                if existing_client:
                    raise ValidationError("Client with name '%s' already exists." % vals['name'])
        return super(AccompanyClient, self).create(vals_list)

                
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
    
    @api.constrains('phone_number')
    def _check_phone_number(self):
        for record in self:
            if record.phone_number and not record.phone_number.isdigit():
                raise ValidationError("Phone number must contain only numbers.")
             
    @api.onchange('Clientcheckbox')
    def _onchange_Clientcheckbox(self):
        if self.Clientcheckbox:
            self.Prospectcheckbox = False

    @api.onchange('Prospectcheckbox')
    def _onchange_Prospectcheckbox(self):
        if self.Prospectcheckbox:
            self.Clientcheckbox = False