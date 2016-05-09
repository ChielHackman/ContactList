Contact.delete_all
User.delete_all

chiel = User.create( email: 'chiel@test.nl', password: 'chiel123')
mo = User.create( email: 'mo@test.nl', password: 'mo123456')

Contact.create( name: "Hans Janssen", phone: "06-15874698", email: "hans@ziggo.nl", user: chiel )
Contact.create( name: "Thea Wolters", phone: "06-14675577", email: "thea@upc.nl", user: chiel )

Contact.create( name: "Inge ter Borg", phone: "06-55467728", email: "inge@thuis.nl", user: mo )
Contact.create( name: "Joey Kaas", phone: "06-55733466", email: "joey@ziggo.nl", user: mo )
