# -*- coding: utf-8 -*-
from odoo import _, api, fields, models
from odoo.exceptions import ValidationError
import re

class pipeline(models.Model):

   _inherit = 'crm.lead'

   partner_id = fields.Many2one(
        'res.partner',
        string='Customer',
        domain="[ ('email', 'not ilike', '@accompany')]",
      
    )

   documents = fields.Binary(string='Documents')
   documents1 = fields.Binary(string='Documents')
   documents2 = fields.Binary(string='Documents')
   user_id = fields.Many2one('res.users', string="Assigned User")

  
   Typetype = fields.Many2one('accompany.type', string='Type')
   Affectationsecteurtype=fields.Many2one('accompany.affectation_secteur_type',string='Affectation Secteur')
   AffectationBUType = fields.Many2one('accompany.afectationbu', string='AffectationBU', selection='_get_afectationbu_types')

   afectationoffreType = fields.Many2one('accompany.afectationoffre', string='Affectation Offre', ondelete='restrict')
   lostfield = fields.Char(string='lost')


   Statue  = fields.Selection([
        ('Stand_by', 'Stand by'),
        ('No_go', 'No go'),
        ('go', 'go'),
     
       
        # Add more countries as needed
    ], string='Statue offre',create=True,store=True,readonly=False) 
   
   Dateouverturereception = fields.Date('Date ouverture reception',store=True,readonly=False)
   
   Date_reception = fields.Date('Date reception ',store=True,readonly=False)
   
   
   Date_Sort = fields.Date('Date Sort',store=True,readonly=False)

   Relation=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ],store=True,readonly=False)
   Relation2 = fields.Text(string='Relation',readonly=False)
   Relation3 = fields.Text(string='Relation',readonly=False)
   Contributeur=fields.Text("Contributeur")
   Associe=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ], string='Associé',store=True,readonly=False)
   Contributeur2=fields.Text("Contributeur")
   Resultatgo=fields.Selection([
       ('En_preparation', 'En preparation'),
        ('Envoyee', 'Envoyée'),
        ('En_attente', 'en attente de confirmation'),
     
        
        # Add more Monsieur as needed
    ], string='Resultatgo',store=True,readonly=False)
   ClosingAssocie=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ], string='ClosingAssocié',store=True,readonly=False)
   Statueoffre  = fields.Selection([
        ('Stand_by', 'Stand by'),
        ('No_go', 'No go'),
        ('go', 'go'),
     
       
            # Add more countries as needed
        ], string='Statue offre',create=True,store=True,readonly=False) 
    
   BudgetDinar=fields.Float("Budget en dinar")
   Budgeteuro=fields.Float("Budget en euros") 
   Budgetpondere=fields.Float("Budget pondéré") 
   Contributeur3=fields.Text("Contributeur")
   offercheckbox = fields.Boolean('Offer',default=True,store=True,readonly=False) 
   Pistecheckbox = fields.Boolean('Piste',default=False,store=True,readonly=False) 
   OffreTechnique = fields.Boolean("Offre Technique",default=False,store=True,readonly=False) 
   OffreFinanciere = fields.Boolean("Offre Financière",default=False,store=True,readonly=False) 
   DossierAdministratif = fields.Boolean("Dossier Administratif",default=False,store=True,readonly=False) 
   Manager_id = fields.Many2one('res.partner', string='Manager', domain="[('complete_name', 'ilike', 'Accompany'), ('function', 'ilike', 'manager'), ('is_company','=', False)]")
   Consultant_id = fields.Many2many('res.partner', string='Consultants', domain="[('complete_name', 'ilike', 'Accompany'), ('function','not ilike', 'manager'), ('is_company','=', False)]")
   Prospectcheckbox = fields.Boolean('Prospect',default=False,store=True,readonly=False) 
   Clientcheckbox = fields.Boolean('Client',default=False,store=True,readonly=False) 
   x_derniereaction=fields.Text("Dernier Action")
   x_dateacc= fields.Date('Date dernière action ',store=True,readonly=False)
   x_acctionreq=fields.Text("Action requise") 
   x_responsale=fields.Text("Responsable") 
   x_risque=fields.Text("Risque")
   x_listconcurent=fields.Text("listing concurrent")

   @api.constrains('Date_reception', 'Dateouverturereception', 'Date_Sort', 'date_deadline')
   def _check_date_sequence(self):
        for record in self:
            if record.Date_reception and record.Dateouverturereception and record.Date_Sort and record.date_deadline:
                if record.Date_reception > record.Dateouverturereception or \
                   record.Dateouverturereception > record.Date_Sort or \
                   record.Date_Sort > record.date_deadline:
                    raise ValidationError("Dates should follow the sequence: Date reception < Date ouverture reception < Date Sort < Date deadline")
           
   @api.model
   def _kanban_states(self):
            # Call super() to inherit the default Kanban states
        states = super(pipeline, self)._kanban_states()

            # Modify the states as needed
        states.update({
                    'new': 'Custom New State',
                    'won': 'Custom Won State',
                    'lost': 'Custom Lost State',
                })

        return states

   @api.onchange('offercheckbox')
   def _onchange_offercheckboxe(self):
            if self.offercheckbox:
                #self.abondonne=False
                self.Pistecheckbox = False
                #self.Statue = 'go'
                #self.state='Arbitrage'
   @api.onchange('Pistecheckbox')
   def _onchange_Pistecheckbox(self):
            if self.Pistecheckbox:
                #self.abondonne=False
                self.offercheckbox = False
                #self.Statue = 'go'
                #self.state='Arbitrage'
   @api.onchange('Prospectcheckbox')
   def _onchange_Prospectcheckbox(self):
            if self.Prospectcheckbox:
                #self.abondonne=False
                self.Clientcheckbox = False
                #self.Statue = 'go'
                #self.state='Arbitrage'
   @api.onchange('Clientcheckbox')
   def _onchange_Clientcheckbox(self):
            if self.Clientcheckbox:
                #self.abondonne=False
                self.Prospectcheckbox = False
                #self.Statue = 'go'
                #self.state='Arbitrage'

class MailActivity(models.Model):
    _inherit = 'mail.activity'

    activity_type_id = fields.Many2one(
        'mail.activity.type',  # Relation
        string='Activity Type',  # Libellé du champ
        required=True,  # Champ obligatoire
        domain=[('res_model', '=', False), ('res_model', '=', 'J')],  # Domaine
    )


    summary = fields.Char(
        string='Summary',  # Libellé du champ
        help='Summary of the activity',  # Description du champ (facultatif)
    )