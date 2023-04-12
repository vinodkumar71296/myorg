import {LightningElement,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import insertContacts from '@salesforce/apex/createContacts.insertContacts';

export default class createContact extends LightningElement {

    @track records;
    @track listOfContacts;
    @track isVisible = false;
    

    selectedAccount;
    fullname;
    fname;
    lname;
    email;

    connectedCallback() {
        this.initData();
    }
    
    initData() {
        let listOfContacts = [];
        this.createRow(listOfContacts);
        this.listOfContacts = listOfContacts;
    }

    handleAccountSelection(event){
        this.selectedAccount = event.target.value;
    }

    createRow(listOfContacts) {
        let contactObject = {};
        if(listOfContacts.length > 0) {
            contactObject.index = listOfContacts[listOfContacts.length - 1].index + 1;
        } else {
            contactObject.index = 1;
        }
        contactObject.FirstName = null;
        contactObject.LastName = null;
        contactObject.Email  = null;
        listOfContacts.push(contactObject);
    }

    /**
     * Adds a new row
     */
    addNewRow() {
        this.isVisible = true;
        this.createRow(this.listOfContacts);
    }

    /**
     * Removes the selected row
     */
    removeRow(event) {

        let toBeDeletedRowIndex = event.target.name;

        let listOfContacts = [];
        for(let i = 0; i < this.listOfContacts.length; i++) {
            let tempRecord = Object.assign({}, this.listOfContacts[i]); //cloning object
            if(tempRecord.index !== toBeDeletedRowIndex) {
                listOfContacts.push(tempRecord);
            }
        }

        for(let i = 0; i < listOfContacts.length; i++) {
            listOfContacts[i].index = i + 1;
        }

        if(listOfContacts.length <= 1) {
            this.isVisible = false;
        }

        this.listOfContacts = listOfContacts;
    }

    /**
     * Removes all rows
     */
    removeAllRows() {
        let listOfContacts = [];
        this.createRow(listOfContacts);
        this.listOfContacts = listOfContacts;
    }

    handleInputChange(event) {
        let index = event.target.dataset.id;
        let fieldName = event.target.name;
        let value = event.target.value;

        for(let i = 0; i < this.listOfContacts.length; i++) {
            if(this.listOfContacts[i].index === parseInt(index)) {
                this.listOfContacts[i][fieldName] = value;
            }
        }
    }

    clear(){
        this.contactObject = {"index":1,"FirstName":"","LastName":"","Email":""};
        this.listOfContacts.push(contactObject);
        this.selectedAccount = '';
    }

    createContacts() {
        
        insertContacts({
            jsonOfListOfContacts: JSON.stringify(this.listOfContacts),
            AccId: this.selectedAccount
            
        }).then(result => {
                this.message = result;
                this.error = undefined;
                this.initData();
                this.contactObject = null;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created sucessfully...!!',
                        variant: 'success',
                    }),
                );
                this.clear();
            }).catch(error => {
                this.message = undefined;
                this.error = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
                console.log("error", JSON.stringify(this.error));
            });
    }
    
}