from odoo import _, api, fields, models
from odoo.exceptions import ValidationError

class TodoTask(models.Model):
    _name = 'todo.task'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _description ="Task"
    name = fields.Char('Task Name')
    due_date = fields.Date('Due Date')
    description = fields.Text('Description')
    assign_to_id = fields.Many2one('res.partner', string='Assign To')
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