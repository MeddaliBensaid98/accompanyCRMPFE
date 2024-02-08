# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError


class AccompanyClient(models.Model):
    _name = "accompany.client"
    _inherit = 'mail.thread'
    _description = "Accompany Client Model"
    

    name = fields.Char(string='Name', required=True ,   tracking=True)
    email = fields.Char(string='Email', size=100)
    country = fields.Selection([
        ('usa', 'United States'),
        ('uk', 'United Kingdom'),
        ('france', 'France'),
        ('TUN', 'Tunisie'),
        # Add more countries as needed
    ], string='Country')
    is_foreign = fields.Boolean(string='Is Foreign?' , tracking=True) 
    notes = fields.Text(string='Notes')
    capitalized_name = fields.Char(string='Capitalized Name', compute='_compute_capitalized_name')
    phone_number = fields.Char(string='Phone Number', size=20)
    ref = fields.Char(string="Reference", default=lambda self: _('New'))
    offer_id = fields.Many2one('accompany.offer',string="offer",tracking=True)
    tag_ids = fields.Many2many(
    'res.partner.category',  # Related model
    'accomapny_client_tag_rel',  # Relation table name
    'client_id',  # Field name for "this" side of the relationship (i.e., in accompany.offer model)
    'tag_id',  # Field name for the "other" side of the relationship (i.e., in res.partner.category model)
    string="Tags"  # Label for the field in the UI
)

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list: 
            vals['ref'] = self.env['ir.sequence'].next_by_code('accompany.client')
        return super(AccompanyClient, self).create(vals_list)
    
    @api.constrains('phone_number')
    def _check_valid_phone_number(self):
        for record in self:
            if record.phone_number:
                # Validate phone number format using a regular expression
                if not re.match(r'^\+(?:[0-9] ?){6,14}[0-9]$', record.phone_number):
                    raise ValidationError("Invalid phone number: %s" % record.phone_number)
                
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
