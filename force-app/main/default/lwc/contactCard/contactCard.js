import { LightningElement, wire, api } from 'lwc';
import getContactsByAccountId from '@salesforce/apex/ContactController.getContactsByAccountId';

export default class ContactsRelatedList extends LightningElement {
    @api recordId;
    contacts;

    @wire(getContactsByAccountId, { accountId: '$recordId' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            
        } else if (error) {
            console.error(error);
        }
    }

    handleNewContact() {
        // Implement logic to create a new Contact record
    }

    handleEdit(event) {
        // Implement logic to edit the selected Contact record
    }

    handleDelete(event) {
        // Implement logic to delete the selected Contact record
    }
}