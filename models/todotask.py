from odoo import _, api, fields, models
from odoo.exceptions import ValidationError

class TodoTask(models.Model):
    _name = 'todo.task'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _description ="Task"
    name = fields.Char('Task Name')
    due_date = fields.Date('Due Date')
    is_late = fields.Boolean(default=False) 
    description = fields.Text('Description')
   
    Ref_offer = fields.Many2one('accompany.offer', string='Ref offer')
    Employes = fields.Many2many(
        'accompany.employe',
        string='Related Todo Task',
        relation='accompany_employe_todo_task_rel' )

    state = fields.Selection([
        ('new','New'),
         ('Qualified','Qualified'),

        ('in_progress','In progress'),
        ('completed','Completed'),
      
        ],default='new')
    tag_ids = fields.Many2many(
        'res.partner.category',  # Related model
        'todo_task_tag_rel',  # Relation table name
        'task_id',  # Field name for "this" side of the relationship (i.e., in todo.task model)
        'tag_id',  # Field name for the "other" side of the relationship (i.e., in res.partner.category model)
        string="Tags"  # Label for the field in the UI
    )


    def action_in_progress(self):
        self.state = 'in_progress'

    def action_new(self):
        self.state = 'new'

    def action_completed(self):
        self.state = 'completed'
        
    #@api.model
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
      
 
 
      
     