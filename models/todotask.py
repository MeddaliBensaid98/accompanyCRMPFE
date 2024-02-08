from odoo import _, api, fields, models
from odoo.exceptions import ValidationError

class TodoTask(models.Model):
    _name = 'todo.task'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _description ="Task"
    name = fields.Char('Task Name')
    due_date = fields.Date('Due Date')
    description = fields.Text('Description')
   

    Employes = fields.Many2many(
        'accompany.employe',
        string='Related Todo Task',
        relation='accompany_employe_todo_task_rel' )

    state = fields.Selection([
        ('new','New'),
        ('in_progress','In progress'),
        ('completed','Completed'),
    ],default='new')

    def action_in_progress(self):
        self.state = 'in_progress'

    def action_new(self):
        self.state = 'new'

    def action_completed(self):
        self.state = 'completed'