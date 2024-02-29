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
    Offre = fields.Boolean(default=True) 
    Piste = fields.Boolean(default=False) 
    priority=fields.Selection([('0','Low'), ('1','Normal'), ('2','High')])

    clients = fields.Many2one('accompany.client', string='Client',readonly=False, store=True)
    clientsemail =fields.Char('clientsemail',related="clients.email",store=True,readonly=False)
    Adresse=fields.Char(string='Adresse', related="clients.Adresse",store=True,readonly=False)
    nameResponsable=fields.Char(string='Nom Du Contact' ,related="clients.nameResponsable",store=True,readonly=False)
    Poste=fields.Char(string='Nom Du Contact', required=True ,related="clients.Poste",store=True,readonly=False)
    phone_number = fields.Char(string='Phone Number',related="clients.phone_number",store=True,readonly=False)
    Clientcheckbox = fields.Boolean(default=True,related="clients.Clientcheckbox",store=True,readonly=False) 

    Dateouverturereception = fields.Date('Date ouverture reception',store=True,readonly=False)
    Date_Envoi = fields.Date('Date Envoi',store=True,readonly=False)
    Date_reception = fields.Date('Date reception ',store=True,readonly=False)
    Date_Production_offre = fields.Date('Date Production offre',store=True,readonly=False)
    Date_Soumission = fields.Date('Date Production offre',store=True,readonly=False)
    Date_Sort = fields.Date('Date Sort',store=True,readonly=False)
    Prospectcheckbox = fields.Boolean(default=False,store=True,readonly=False) 
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
    ], string='Affectation Offre ',store=True,readonly=False)
    AffectationBU =fields.Selection([
        ('Integration_Assurance', 'Integration Assurance'),
        ('DIGITALY', 'DIGITALY'),
        ('Conseil', 'Conseil'),
        ('Integration_Temenos', 'Integration Temenos'),
        ('Integration_CRM', 'Integration CRM'),
         ('Autre', 'Autre'),
        # Add more Monsieur as needed
    ], string='AffectationBU',store=True,readonly=False)
    country = fields.Selection([
        ('+1', '+1 - United States'),
        ('+44', '+44 - United Kingdom'),
        ('+33', '+33 - France'),
        ('+216', '+216 - Tunisia'),
        # Add more countries as needed
    ], string='Country Code',store=True,related="clients.country",readonly=False, tracking=True)
    Campagne = fields.Selection([
        ('Sale', 'Sale'),
        ('Christmas_Special', 'Christmas Special'),
        ('Email_Campaign_Service', 'Email Campaign-Service'),
       
        # Add more countries as needed
    ], string='Campagne',store=True,related="clients.Campagne",readonly=False, tracking=True)   
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
        string='Related Todo Task',
        relation='accompany_employe_todo_task_rel' )

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
    
    def show_send_mail(self):
            # Your code to perform actions when the button is clicked
            # For example, you can send an email or perform any other action
            print("Send email action triggered for Todo Task:", self.name)

    def action_send_mail(self):
            # Your code to send emails for Todo Tasks
            print("Sending emails for Todo Tasks...")
    
  
    @api.onchange("Offre") 
    def action_in_Offre(self):
        if self.Offre==False:
             self.Piste==True
            
    @api.onchange("Piste") 
    def action_in_Piste(self):
        if self.Piste==False:
             self.Offre==True

        
        @api.model
        def read(self, fields=None, load='_classic_read'):
            # Appel de la méthode parente pour effectuer les opérations normales de lecture
            result = super(TodoTask, self).read(fields=fields, load=load)

            # Exécuter votre fonction personnalisée lorsque la vue de liste est ouverte
            self.check_expected_date()
            
            return result

        
        # Exécuter votre fonction personnalisée lorsque la vue de liste est ouverte
   
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
            'type': 'ir.actions.act_window',
            'tag': 'reload',
        }
  