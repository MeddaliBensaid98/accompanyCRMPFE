{
    'name': 'AccompanyCRM',
    'author': 'Ben Said Mohamed Ali',
    'website': 'https://www.accompanyconsulting.net/',
    'summary': 'The new CRM',
    'depends': ['crm','contacts','base','web'],

    'data': [
        
        'security/ir.model.access.csv',
        'data/sequence.xml',
        'views/menu.xml',
        'views/Offer_form.xml',
        'views/Contact.xml',
        'views/pipeline.xml',
         'views/Type.xml',
        'views/afectationbu.xml',
         'views/stage.xml',
         'views/AffecteurSecteur.xml',

        'views/afectiationoffre.xml',

   
    ],
     'js': [
        'static/js/test.js',
    ],
    'images': [
        'static/description/icon.png',  # Adjust the path to your icon image
    ],
    
}
