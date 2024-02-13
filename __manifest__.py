{
    'name': 'AccompanyCRM',
    'author': 'Ben Said Mohamed Ali',
    'website': 'https://www.accompanyconsulting.net/',
    'summary': 'The new CRM',
    'depends': ['mail','board'],

    'data': [
        'security/ir.model.access.csv',
        'data/sequence.xml', 
        'views/menu.xml',
        'views/client.xml',
        'views/offer.xml',
        'views/todo_task.xml',
        'views/Employe.xml',
        'views/dashboard.xml'
    ],
    'images': [
        'static/description/icon.png',  # Adjust the path to your icon image
    ],
}
