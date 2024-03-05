from odoo import _, api, fields, models
from odoo.exceptions import ValidationError 
import re
class TodoTask(models.Model):
    _name = 'todo.task'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    #_inherit = 'accompany.client'
    _description ="Task"
    name = fields.Char('Opportunity')
    due_date = fields.Date('Due Date')
    is_late = fields.Boolean(default=False) 
    description = fields.Text('Description')
    Offre = fields.Boolean(default=False) 
    Piste = fields.Boolean("a l'etude",default=False) 
    abondonne = fields.Boolean("abondonné",default=False) 
    priority = fields.Selection([
        ('0', 'Low'),
        ('1', 'Normal'),
        ('2', 'High'),
        ('3', 'Very High'),
        ('4', 'Urgent')
    ], default='0')

    clients = fields.Many2one('accompany.client', string='Client',readonly=False, store=True)
    clientsemail =fields.Char('Email',related="clients.email",String="Email",store=True,readonly=False)
    Adresse=fields.Char(string='Adresse', related="clients.Adresse",store=True,readonly=False)
    nameResponsable=fields.Char(string='Nom Du Contact' ,related="clients.nameResponsable",store=True,readonly=False)
    Poste=fields.Char(string='Poste', required=True ,related="clients.Poste",store=True,readonly=False)
    phone_number = fields.Char(string='Phone Number',related="clients.phone_number",store=True,readonly=False)
    Clientcheckbox = fields.Boolean(default=True,related="clients.Clientcheckbox",store=True,readonly=False) 

    Dateouverturereception = fields.Date('Date ouverture reception',store=True,readonly=False)
    Date_Envoi = fields.Date('Date Envoi',store=True,readonly=False)
    Date_reception = fields.Date('Date reception ',store=True,readonly=False)
    Date_Production_offre = fields.Date('Date Production offre',store=True,readonly=False)
    Date_Soumission = fields.Date('Date Soumission  offre',store=True,readonly=False)
    Date_Sort = fields.Date('Date Sort',store=True,readonly=False)
    Prospectcheckbox = fields.Boolean('Prospect',default=False,store=True,readonly=False) 

    Langue=fields.Selection([
       ('Francais', 'Francais'),
        ('Anglais', 'Anglais'),
        
        # Add more Monsieur as needed
    ], string='Langue',create=True,related="clients.Langue",store=True,readonly=False)
    titre =fields.Selection([
        ('Docteur', 'Docteur'),
        ('Madame', 'Madame'),
        ('Madamoiselle  ', 'Madamoiselle'),
        ('Monsieur', 'Monsieur'),
        ('Professeur', 'Professeur'),
        # Add more Monsieur as needed
    ], string='titre',store=True,related="clients.titre",readonly=False)
    Type =fields.Selection([
        ('AOI', 'AOI'),
        ('AON', 'AON'),
        ('Consultation  ', 'Consultation'),
        ('GaG', 'GaG'),
        ('AMI', 'AMI'),
        ('Contrat_De_Référencement', 'Contrat De Référencement'),
        # Add more Monsieur as needed
    ], string='Type ',store=True,readonly=False)
    AffectationOffre =fields.Selection([
        ('Excellence_opérationnelle', 'Excellence opérationnelle'),
        ('People&change', 'People & change'),
        ('Stratégié&choixSI  ', 'Stratégié & choix SI'),
        ('AMOA&PMOdeprojetsSI', 'AMOA & PMO De Projets SI'),
        ('Gestiondesrisques', 'Gestion des risques'),
        ('Réglementationetconformité', 'Réglementation et conformité'),
        ('Digital', 'Digital'),
         ('Techno', 'Techno'),
        # Add more Monsieur as needed
    ], string='Affectation Offre ',create=True,store=True,readonly=False)
    AffectationBU =fields.Selection([
        ('Integration_Assurance', 'Integration Assurance'),
        ('DIGITALY', 'DIGITALY'),
        ('Conseil', 'Conseil'),
        ('Integration_Temenos', 'Integration Temenos'),
        ('Integration_CRM', 'Integration CRM'),
         ('Autre', 'Autre'),
        # Add more Monsieur as needed
    ], string='AffectationBU',create=True,store=True,readonly=False)
    country = fields.Selection([
        ('+1', '+1 - United States'),
        ('+44', '+44 - United Kingdom'),
        ('+33', '+33 - France'),
        ('+216', '+216 - Tunisia'),
        # Add more countries as needed
    ], string='Country Code',create=True,store=True,related="clients.country",readonly=False, tracking=True)
    Campagne = fields.Selection([
        ('Sale', 'Sale'),
        ('Christmas_Special', 'Christmas Special'),
        ('Email_Campaign_Service', 'Email Campaign-Service'),
       
        # Add more countries as needed
    ], string='Campagne',create=True,store=True,related="clients.Campagne",readonly=False, tracking=True)   
    Moyen   = fields.Selection([
        ('Banner', 'Banner'),
        ('Direct', 'Direct'),
        ('Email', 'Email'),
        ('Facebook', 'Facebook'),
        ('Linkedin', 'Linkedin'),
        ('Phone', 'Phone'),
       
        # Add more countries as needed
    ], string='Moyen',create=True,related="clients.Moyen",store=True,readonly=False,  tracking=True) 
    Source  = fields.Selection([
        ('Moteur de Recherche', 'Moteur_de_Recherche'),
        ('Rappel_de_Piste', 'Rappel De Piste'),
        ('Lettre_d_information', 'Lettre d information'),
        ('Facebook', 'Facebook'),
        ('Linkedin', 'Linkedin'),
        ('Twitter', 'Twitter'),
    
       
        # Add more countries as needed
    ], string='Source',create=True,related="clients.Source",store=True,readonly=False) 
   
    Siteweb = fields.Text(string='Site web',related="clients.Siteweb",readonly=False)
    Apportepar = fields.Char(string='Apporté par',related="clients.Apportepar",readonly=False)
    Employes = fields.Many2many(
        'accompany.employe',
        string='Consultants',
        relation='accompany_employe_todo_task_rel' )
    manager_names_selection =fields.Selection( string='manager',readonly=False,related="Employes.manager_names_selection")
    state = fields.Selection([
         ('Non_démarrée','Non démarrée '),
          ('Arbitrage','Arbitrage(GO/No GO)'),
          ('En_Cours','En Cours'),
          ('Envoyée','Envoyée'),
          ('A_suivre','A suivre'),
          ('Perdue','Perdue'),
          ('Gagnée','Gagnée'),
          ('abandonée','abandonée'),
      
        ],default='Non_démarrée',  group_expand='_expand_states', index=True)
    def _expand_states(self, states, domain, order):
        return [key for key, val in type(self).state.selection]
    tag_ids = fields.Many2many(
        'res.partner.category',  # Related model
        'todo_task_tag_rel',  # Relation table name
        'task_id',  # Field name for "this" side of the relationship (i.e., in todo.task model)
        'tag_id',  # Field name for the "other" side of the relationship (i.e., in res.partner.category model)
        string="Tags"  # Label for the field in the UI
    )
   #  show_mail_button = fields.Boolean(string="Show Mail Button", compute="show_send_mail_button")   
    

    Relation=fields.Selection([
       ('MGU', 'MGU'),
        ('MMO', 'MMO'),
        ('MTR', 'MTR'),
        ('MHI', 'MHI'),
        
        # Add more Monsieur as needed
    ],store=True,readonly=False)
    Relation2 = fields.Text(string='Relation',readonly=False)
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
    Contributeur3=fields.Text("Contributeur")
    BudgetDinar=fields.Float("Budget en dinar")
    Budgeteuro=fields.Float("Budget en euros") 
    Budgetpondere=fields.Float("Budget pondéré") 
    Revenuespere=fields.Float("Revenu espéré ") 
    Probabilite=fields.Float("Probabilité ") 
    Revenuespere =fields.Float(" Revenu espéré ")

    classbids= fields.One2many('accompany.action', 'taskid', 'offer', index=True,readonly=False,tracking=True)
    OffreTechnique = fields.Boolean("Offre Technique",default=False,store=True,readonly=False) 
    OffreFinanciere = fields.Boolean("Offre Financière",default=False,store=True,readonly=False) 
    DossierAdministratif = fields.Boolean("Dossier Administratif",default=False,store=True,readonly=False) 
    Statue  = fields.Selection([
        ('Stand_by', 'Stand by'),
        ('No_go', 'No go'),
        ('go', 'go'),
     
       
        # Add more countries as needed
    ], string='Statue offre',create=True,store=True,readonly=False) 
    def show_send_mail(self):
            # Your code to perform actions when the button is clicked
            # For example, you can send an email or perform any other action
            print("Send email action triggered for Todo Task:", self.name)

    def action_send_mail(self):
            # Your code to send emails for Todo Tasks
            print("Sending emails for Todo Tasks...")
    
  
    

        
    @api.model
    def read(self, fields=None, load='_classic_read'):
            # Appel de la méthode parente pour effectuer les opérations normales de lecture
            result = super(TodoTask, self).read(fields=fields, load=load)

            # Exécuter votre fonction personnalisée lorsque la vue de liste est ouverte
            self.check_expected_date()
            
      

            return result

        
        # Exécuter votre fonction personnalisée lorsque la vue de liste est ouverte
    def open_accompany_action_form(self):
        action = self.env.ref('AccompanyCRM.action_accompany_action').read()[0]
        action['context'] = {
            'default_taskid': self.id,
            # Add other default values if needed
        }
        return action
    def check_expected_date(self):
        print(self)
        test= self.search([])
        print(test)
        print(fields.Date.today())
        print("List view of Todo Tasks is opened!")
       
        for rec in test:    
           
           
            if rec.due_date and rec.due_date < fields.Date.today() and rec.state != 'completed':
                      rec.is_late = True
            else :
                rec.is_late = False
        return {
            'type': 'ir.actions.client',
            'tag': 'reload',
        }
    
    @api.onchange('Offre')
    def _onchange_offre(self):
        if self.Offre:
            self.abondonne=False
            self.Piste = False
            self.Statue = 'go'
            self.state='Arbitrage'
           

    @api.onchange('Statue')
    def _onchange_Statue(self):
        if self.Statue =='Stand_by':
            self.Offre = False
            self.abondonne=False
            self.Piste = True 
        if self.Statue =='go':
            self.Offre = True
            self.abondonne=False
            self.Piste = False 
        if self.Statue =='No_go':
            self.Offre = False
            self.abondonne=True
            self.Piste = False 
    @api.onchange('Piste')
    def _onchange_piste(self):
        if self.Piste:
            self.Offre = False
            self.abondonne=False
            self.Statue = 'Stand_by'
            self.state='Non_démarrée'
    @api.onchange('abondonne')
    def _onchange_abondonne(self):
        if self.abondonne:
            self.Offre = False
            self.Piste=False
            self.Statue = 'No_go'
            self.state='abandonée'
    @api.onchange('Clientcheckbox')
    def _onchange_Clientcheckbox(self):
        if self.Clientcheckbox:
            self.Prospectcheckbox = False

    @api.onchange('Prospectcheckbox')
    def _onchange_Prospectcheckbox(self):
        if self.Prospectcheckbox:
            self.Clientcheckbox = False
    @api.constrains('Date_reception', 'Dateouverturereception', 'Date_Sort', 'Date_Envoi')
    def _check_dates_order(self):
        for record in self:
            print("Checking dates order for record:", record.name)
            print("Date reception:", record.Date_reception)
            print("Date ouverture reception:", record.Dateouverturereception)
            print("Date Sort:", record.Date_Sort)
            print("Date export:", record.due_date)

            if (record.Date_reception and record.Dateouverturereception and record.Date_Sort and record.due_date and
                (record.Date_reception >= record.Dateouverturereception or
                 record.Dateouverturereception >= record.Date_Sort or
                 record.Date_Sort >= record.due_date)):
                raise ValidationError("Dates should follow the sequence: Date reception < Date ouverture reception < Date Sort < Date export")
            
            
            
                
