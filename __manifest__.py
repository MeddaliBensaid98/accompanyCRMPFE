{
    'name': 'AccompanyCRM',
    'author': 'Ben Said Mohamed Ali',
    'website': 'https://www.accompanyconsulting.net/',
    'summary': 'The new CRM',
    'depends': ['mail'],

    'data': [
        'security/ir.model.access.csv',
        'data/sequence.xml',
        'data/sequanceoffers.xml',     
        'views/menu.xml',
        'views/client.xml',
        'views/offer.xml',
        'views/todo_task.xml'
    ],
    'images': [
        'static/description/icon.png',  # Adjust the path to your icon image
    ],
}
